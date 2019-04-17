#!/usr/bin/python3

"""The basic idea is this: the bugs grow for a certain period of time, dt. After this time, if their optical density,
OD, (as read by a photodetector) is above a threshhold, OD_thr, and they have grown since the last time point, drug is
administered through a pump, P_drug. If OD is less than OD_thr, then nutrient solution is added through another pump,
P_nut.

This system will be controlled by a Raspberry Pi, using the SPI and GPIO ports. To activate the pumps, GPIO ports are
set to 1/GPIO.HIGH/True for a certain period of time, t_pump. Optical density data is read via an analogue to digital
converter attached to one of the SPI ports on the RPi.

Data will be saved on the RPi and stored in the cloud. Using the Slack API, we will be able to query the RPi to find
out how the experiment is progressing."""


# Needed for Running the Pumps
import time
from datetime import datetime
import csv
import threading
import os
from subprocess import call
from subprocess import Popen, PIPE
import RPi.GPIO as GPIO
import numpy as np
import configparser

import board
import busio
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn
import adafruit_mcp230xx
import digitalio

# Needed for Slack Integration
import re
import json
# import psutil
from slackclient import SlackClient

# Needed for Screenshots
#import gtk.gdk
from subprocess import call

#Graphs
import pandas as pd
import matplotlib.pyplot as plt

#Logging
import logging




class Morbidostat:
    def __init__(self, sysnum):
        self.sysnum = sysnum
        self.sysstr = 'EVE' + str(self.sysnum)

        self.config = configparser.ConfigParser()
        self.config.read('eve-conf.ini')

        # Define Experiment Variables
        self.time_between_pumps = self.config[self.sysstr].getfloat('time_between_pumps')
        self.OD_thr = self.config[self.sysstr].getfloat('OD_thr')
        self.OD_min = self.config[self.sysstr].getfloat('OD_min')
        self.time_between_ODs = self.config[self.sysstr].getfloat('time_between_ODs') # how often to gather OD data, in seconds
        self.time_between_graphs = self.config[self.sysstr].getfloat('time_between_graphs') # how often to graph, in minutes
        # OD_thr is the threshold above which to activate drug pump  [vish bench tests: empty: 3.5V, Clear Vial: 0.265V, Very Cloudy Vial: 2.15V]

        #time_between_writes = 1  # how often to write out OD data, in minutes
        #loops_between_writes = (time_between_writes*60)/time_between_ODs # time bewteen writes in loops
        self.time_between_saves = self.config[self.sysstr].getfloat('time_between_saves')

        # Set Up I2C to Read OD Data
        # Create the I2C bus

        self.P_drug_times = self.config[self.sysstr].getfloat('P_drug_times')
        self.P_nut_times = self.config[self.sysstr].getfloat('P_nut_times')
        self.P_waste_times = self.config[self.sysstr].getfloat('P_waste_times')

        self.running_data = []  # the list which will hold our 2-tuples of time and OD
        self.pump_data = []
        self.OD_tmplist = []
        self.pump_tmplist = []
        # self.currOD = np.zeros(num_cham)
        self.currOD = 0
        # averaged OD value
        # self.avOD = np.zeros(num_cham)
        self.avOD = 0
        self.OD_av_length = self.config[self.sysstr].getint('OD_av_length')
        # OD averaging buffer
        self.avOD_buffer = np.zeros(self.OD_av_length)#need to change for multiplexing

        self.elapsed_loop_time = 0
        self.loops = 0
        self.last_dilutionOD = 0
        self.nut = 0
        self.drug = 1
        self.waste = 2

        self.drug_mass = 0

        self.total_time = self.config[self.sysstr].getfloat('Exp_time_hours')*3600 #in seconds
        self.loops_between_ODs = 1
        self.loops_between_pumps = (self.time_between_pumps*60)/self.time_between_ODs # time between pumps in loops

        # num_cham = 1 # number of morbidostat vials being used

        self.i2c = busio.I2C(board.SCL, board.SDA)
        # # Create the ADC object using the I2C bus
        self.ads = ADS.ADS1015(self.i2c)
        # # Create single-ended input on channel 0
        # # photoreceptor_channel = 0
        self.photod = AnalogIn(self.ads, getattr(ADS,'P'+ str(self.config[self.sysstr].getint('Analogin'))))

        # Setup the GPIO Pins to Control the Pumps
        self.pipins = self.config[self.sysstr].getboolean('Pi_pins')
        self.P_drug_pins = self.config[self.sysstr].getint('P_drug_pins')
        self.P_nut_pins = self.config[self.sysstr].getint('P_nut_pins')
        self.P_waste_pins = self.config[self.sysstr].getint('P_waste_pins')
        self.P_LED_pins = self.config[self.sysstr].getint('P_LED_pins')
	# P_fan_pins = self.config[self.sysstr].getint('P_fan_pins')
        self.pin_list = [self.P_drug_pins, self.P_nut_pins, self.P_waste_pins, self.P_LED_pins]

        if self.pipins:
            GPIO.setmode(GPIO.BCM)
            for pin in self.pin_list:
                GPIO.setup(pin, GPIO.OUT)
        else:
            self.pins = [None]*(max(self.pin_list)+1)
            self.mcp = adafruit_mcp230xx.MCP23017(self.i2c, address=self.config[self.sysstr].getint('m_address'))

            for pin in self.pin_list:
                self.pins[pin] = self.mcp.get_pin(pin)
                self.pins[pin].direction = digitalio.Direction.OUTPUT
                self.pins[pin].value = False

        self.writer = 0
        self.init_time = datetime.now()

        self.slack_client = SlackClient(self.config['MAIN']['slack_key'])
        # self.chanid = self.config['MAIN']['slack_chanid']
        self.slack_usericon = self.config[self.sysstr]['slack_icon']
        self.chan = self.config['MAIN']['slack_channel']
        self.slack_client.api_call(
            "chat.postMessage",
            channel = self.chan,
            username=self.sysstr,
            icon_url = self.slack_usericon,
            text = self.init_time.strftime('Initialized at %H:%M:%S')
            )



    def start(self):
        self.start_time = datetime.now()
        os.makedirs("/mnt/morbidodata/" + self.sysstr + "/" + str(self.start_time))

        self.elogr = logging.getLogger('self.elogr')
        self.elogr.setLevel(logging.DEBUG)
        self.elogrfh = logging.FileHandler('/mnt/morbidodata/%s/%s/exceptions.txt' % (self.sysstr, self.start_time))
        self.elogrfh.setFormatter("%(asctime)s — %(name)s — %(levelname)s — %(message)s")
        self.elogr.addHandler(self.elogrfh)

        self.ilogr = logging.getLogger('self.ilogr')
        self.ilogr.setLevel(logging.INFO)
        self.ilogrfh = logging.FileHandler('/mnt/morbidodata/%s/%s/info.txt' % (self.sysstr, self.start_time))
        self.ilogrfh.setFormatter("%(asctime)s — %(name)s — %(levelname)s — %(message)s")
        self.ilogr.addHandler(self.ilogrfh)

        # self.outfile_OD = "/mnt/morbidodata/%s/%s/ODdata_%s.csv" % (self.start_time, self.sysstr, self.start_time)
        self.outfile_OD = "/mnt/morbidodata/%s/%s/ODdata_%s.csv" % (self.sysstr, self.start_time, self.start_time)
        file = open(self.outfile_OD, 'a')
        wr = csv.writer(file)
        # wr.writerow(['Current OD', 'Average OD','OD Timing'])
        wr.writerow(['current', 'average','time','hour'])
        file.close()

        # self.outfile_pump = "/mnt/morbidodata/%s/%s/pump_%s.csv" % (self.start_time, self.sysstr, self.start_time)
        self.outfile_pump = "/mnt/morbidodata/%s/%s/pump_%s.csv" % (self.sysstr, self.start_time, self.start_time)
        file = open(self.outfile_pump, 'a')
        wr = csv.writer(file)
        # wr.writerow(['Nutrient Pump', 'Drug Pump','Waste Pump','Pump Timing', 'Drug Mass'])
        wr.writerow(['media', 'drug','waste','pump_time','hour','drug_mass'])
        file.close()

        #TURN ON THE FAN HERE

        # print('Experiment begun at %02s:%02s:%02s' % (self.start_time.hour, self.start_time.minute, self.start_time.second))
        print(self.start_time.strftime(self.sysstr + ' started at %H:%M:%S on %a - %b %d, %Y'))
        self.ilogr.info(self.start_time.strftime(self.sysstr + ' started at %H:%M:%S on %a - %b %d, %Y'))
        threading.Thread(self.on_timer()).start()

        self.initalmessage = self.slack_client.api_call(
            "chat.postMessage",
            channel = self.chan,
            username=self.sysstr,
            icon_url = self.slack_usericon,
            text = self.start_time.strftime('Experiment started at %H:%M:%S on %a - %b %d, %Y')
            )

        self.recgra = self.slack_client.api_call(
            "chat.postMessage",
            channel = self.chan,
            username=self.sysstr,
            icon_url = self.slack_usericon,
            text = self.start_time.strftime('Most recent graphs')
            )


        # self.history = self.slack_client.api_call("channels.history", channel=self.chanid, count = 1)
        # self.threadts = self.history['messages'][0]['ts']
        self.chanid = self.initalmessage['channel']
        self.threadts = self.initalmessage['ts']
        self.recgrats = self.recgra['ts']
        self.firstrec = True

        if self.pipins:
            GPIO.output(self.P_LED_pins,1)
        else:
            self.pins[self.P_LED_pins].value = True

    def get_OD(self):
        # self.currOD = self.photod.voltage #np.asarray(self.value)#[0]
        if self.pipins:
            GPIO.output(self.P_LED_pins,1)
            time.sleep(0.1)
            self.currOD = self.photod.voltage #np.asarray(self.value)#[0]
            time.sleep(0.1)
            GPIO.output(self.P_LED_pins,0)
        else:
            self.pins[self.P_LED_pins].value = True
            time.sleep(0.1)
            self.currOD = self.photod.voltage #np.asarray(self.value)#[0]
            time.sleep(0.1)
            self.pins[self.P_LED_pins].value = False

        self.avOD_buffer = np.append(self.avOD_buffer, self.currOD)  #might need to transpose if more than one pd (for multiplexing)

        # then remove the first item in the array, i.e. the oldest
        self.avOD_buffer = np.delete(self.avOD_buffer, 0)
        # calculate average for each flask
        self.avOD = np.mean(self.avOD_buffer)


    def pump_on(self,pump):
        if self.pipins:
            GPIO.output(pump, 1)
        else:
            self.pins[pump].value = True
        print('Turning on pump',pump)

    def pump_off(self,pump):
        if self.pipins:
            GPIO.output(pump, 0)
        else:
            self.pins[pump].value = False
        print('Turning off pump',pump)

    def all_pump_off(self):
        if self.pipins:
            for i in pin_list:
                GPIO.output(i, 0)
        else:
            for i in pin_list:
                self.pins[i].value = False
        print('Turning off all pumps')


    def bufferdata(self):
        self.OD_tmplist.append([self.currOD, self.avOD, self.nows, (self.elapsed_time.seconds)/3600])
        self.pump_tmplist.append([self.nut,self.drug,self.waste,self.nows,(self.elapsed_time.seconds)/3600,self.drug_mass])
        self.nut = 0
        self.drug = 1
        self.waste = 2


    def savefunc(self):
        self.writer = 1
        self.bufferdata()

        with open(self.outfile_OD, 'a') as file:
            # OD_tmplist.append(self.now)
            wr = csv.writer(file)
            wr.writerows(self.OD_tmplist)
            file.close()

        with open(self.outfile_pump, 'a') as file:
            wr = csv.writer(file)
            wr.writerows(self.pump_tmplist)
            file.close()

        self.OD_tmplist = []
        self.pump_tmplist = []
        self.writer = 0

    def graphOD(self):
        print('[%s] Generating graph' % self.sysstr)

        self.slack_client.api_call(
            "chat.postMessage",
            channel = self.chan,
            username=self.sysstr,
            icon_url = self.slack_usericon,
            text = ('Elapsed Time: %s ; OD = %.3f' % (self.secondsToText(self.elapsed_time.seconds),self.currOD)),
            thread_ts = self.threadts
            )

        allODs = pd.read_csv(self.outfile_OD, index_col='hour')
        # allODs['hour'] = allODs['time'] - allODs['time'].iloc[0]
        # allODs['hour'] = allODs['hour'].divide(3600)
        # allODs.set_index('hour')
        # print(allODs)
        #fig = plt.figure(dpi=1000)
        plt.rcParams["figure.dpi"] = 200
        ODplt = (allODs[['average']]).plot()  #figsize=(10,10) in the plot
        # ODplt = (allODs[['current']]).plot()  #figsize=(10,10) in the plot
        ODfig = ODplt.get_figure()
        self.outfile_OD = "/mnt/morbidodata/%s/%s/ODdata_%s.csv" % (self.sysstr, self.start_time, self.start_time)
        ODfig.savefig("/mnt/morbidodata/%s/%s/ODplot_%s.png" % (self.sysstr, self.start_time, self.start_time))
        ODplt = None; ODfig = None; fig = None
        with open("/mnt/morbidodata/%s/%s/ODplot_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
            self.slack_client.api_call(
                "files.upload",
                channels = self.chan,
                thread_ts = self.threadts,
                title = "ODPlot",
                file = file_content
            )

        allpumps = pd.read_csv(self.outfile_pump, index_col='hour')   # cols: 'media', 'drug','waste','pump_time','hour','drug_mass'

        allconcs = allpumps[['drug_mass']]/12
        allconcs.rename(columns={'drug_mass':'drug_conc'}, inplace=True)
        # allODs['hour'] = allODs['time'] - allODs['time'].iloc[0]
        # allODs['hour'] = allODs['hour'].divide(3600)
        # allODs.set_index('hour')
        # print(allODs)
        #fig = plt.figure(dpi=1000)
        colors = getattr(getattr(pd.plotting, '_style'), '_get_standard_colors')(num_colors=2)
        plt.rcParams["figure.dpi"] = 200
        ODplt = (allODs[['average']]).plot(label='average', color=colors[0])  #figsize=(10,10) in the plot
        ODplt.set_ylabel(ylabel='Average OD')
        lines, labels = ODplt.get_legend_handles_labels()

        DM = ODplt.twinx()
        DM.spines['right'].set_position(('axes', 1.0))
        allconcs.plot(ax = DM, label='drug_mass',color=colors[1],legend=False)
        DM.set_ylabel(ylabel='Drug Concentration (ug/mL)')
        line, label = DM.get_legend_handles_labels()
        lines += line
        labels += label
        ODplt.legend(lines, labels, loc=2)
        # ODplt = (allODs[['current']]).plot()  #figsize=(10,10) in the plot
        ODfig = ODplt.get_figure()
        ODfig.savefig("/mnt/morbidodata/%s/%s/ODconc_%s.png" % (self.sysstr, self.start_time, self.start_time),bbox_inches='tight')
        ODplt.figure = None; ODplt = None; ODfig = None; fig = None; allconcs= None; colors = None; DM = None
        with open("/mnt/morbidodata/%s/%s/ODconc_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
            self.slack_client.api_call(
                "files.upload",
                channels = self.chan,
                thread_ts = self.threadts,
                title = "ODConc",
                file = file_content
            )


        pumpa = allpumps[['media','drug','waste']]
        colors = getattr(getattr(pd.plotting, '_style'), '_get_standard_colors')(num_colors=4)
        PUplt = (allODs[['average']]).plot(label='average', color=colors[0])
        PUplt.set_ylabel(ylabel='Average OD')
        lines, labels = PUplt.get_legend_handles_labels()

        DM = PUplt.twinx()
        DM.spines['right'].set_position(('axes', 1.0))
        pumpa.plot(ax = DM,color=colors[1:4],legend=False)
        DM.set_yticklabels([])

        line, label = DM.get_legend_handles_labels()
        lines += line
        labels += label
        PUplt.legend(lines, labels, loc=2)

        PUfig = PUplt.get_figure()
        PUfig.savefig("/mnt/morbidodata/%s/%s/PUplot_%s.png" % (self.sysstr, self.start_time, self.start_time))
        allODs = None; allpumps = None; PUplt.figure = None; PUplt = None; PUfig = None; fig = None; allconcs= None; colors = None; DM = None; pumpa = None
        with open("/mnt/morbidodata/%s/%s/PUplot_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
            self.slack_client.api_call(
                "files.upload",
                channels = self.chan,
                thread_ts = self.threadts,
                title = "PUPlot",
                file = file_content
            )

        if self.firstrec:
            self.recmes = self.slack_client.api_call(
                "chat.postMessage",
                channel = self.chan,
                username=self.sysstr,
                icon_url = self.slack_usericon,
                text = ('Elapsed Time: %s ; OD = %.3f' % (self.secondsToText(self.elapsed_time.seconds),self.currOD)),
                thread_ts = self.recgrats
                )
            with open("/mnt/morbidodata/%s/%s/ODplot_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
                self.recod = self.slack_client.api_call(
                    "files.upload",
                    channels = self.chan,
                    thread_ts = self.recgrats,
                    title = "ODPlot",
                    file = file_content
                )
            with open("/mnt/morbidodata/%s/%s/ODconc_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
                self.recodc = self.slack_client.api_call(
                    "files.upload",
                    channels = self.chan,
                    thread_ts = self.recgrats,
                    title = "ODConc",
                    file = file_content
                )
            with open("/mnt/morbidodata/%s/%s/PUplot_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
                self.recpu = self.slack_client.api_call(
                    "files.upload",
                    channels = self.chan,
                    thread_ts = self.recgrats,
                    title = "PUPlot",
                    file = file_content
                )
            # print(self.recod['file']['shares']['public'][self.chanid][0]['ts'])
            self.firstrec = False
        else:
            self.slack_client.api_call(
                "chat.delete",
                channel = self.chanid,
                ts = self.recmes['ts']
                )
            self.slack_client.api_call(
                "chat.delete",
                channel = self.chanid,
                ts = self.recod['file']['shares']['public'][self.chanid][0]['ts']
                )
            self.slack_client.api_call(
                "chat.delete",
                channel = self.chanid,
                ts = self.recodc['file']['shares']['public'][self.chanid][0]['ts']
                )
            self.slack_client.api_call(
                "chat.delete",
                channel = self.chanid,
                ts = self.recpu['file']['shares']['public'][self.chanid][0]['ts']
                )
            self.recmes = self.slack_client.api_call(
                "chat.postMessage",
                channel = self.chan,
                username=self.sysstr,
                icon_url = self.slack_usericon,
                text = ('Elapsed Time: %s ; OD = %.3f' % (self.secondsToText(self.elapsed_time.seconds),self.currOD)),
                thread_ts = self.recgrats
                )
            with open("/mnt/morbidodata/%s/%s/ODplot_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
                self.recod = self.slack_client.api_call(
                    "files.upload",
                    channels = self.chan,
                    thread_ts = self.recgrats,
                    title = "ODPlot",
                    file = file_content
                )
            with open("/mnt/morbidodata/%s/%s/ODconc_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
                self.recodc = self.slack_client.api_call(
                    "files.upload",
                    channels = self.chan,
                    thread_ts = self.recgrats,
                    title = "ODConc",
                    file = file_content
                )
            with open("/mnt/morbidodata/%s/%s/PUplot_%s.png" % (self.sysstr, self.start_time, self.start_time), "rb") as file_content:
                self.recpu = self.slack_client.api_call(
                    "files.upload",
                    channels = self.chan,
                    thread_ts = self.recgrats,
                    title = "PUPlot",
                    file = file_content
                )


    def control_alg(self):
        # for i in range(num_cham):

        if self.avOD > self.OD_min:
            threading.Thread(target=self.pump_on, args=(self.P_waste_pins,)).start()
            threading.Timer(self.P_waste_times,self.pump_off, args=(self.P_waste_pins,)).start()

            self.waste = 3

            self.drug_mass = self.drug_mass - (self.drug_mass/12)

            if self.avOD > self.OD_thr and self.avOD > self.last_dilutionOD:
                print('[%s] OD Threshold exceeded, pumping cefepime' % self.sysstr)

                threading.Thread(target=self.pump_on, args=(self.P_drug_pins,)).start()
                threading.Timer(self.P_drug_times,self.pump_off, args=(self.P_drug_pins,)).start()
                self.drug = 2

                self.drug_mass = self.drug_mass + 2.5

                self.slack_client.api_call(
                    "chat.postMessage",
                    channel = self.chan,
                    username=self.sysstr,
                    icon_url = self.slack_usericon,
                    thread_ts = self.threadts,
                    text = "OD = %0.3f, pumping cefepime. Cefepime concentration: %f ug/mL" % (self.avOD, (self.drug_mass)/12)
                    )


            else:
                print('[%s] OD below threshold, pumping nutrient' % self.sysstr)

                threading.Thread(target=self.pump_on, args=(self.P_nut_pins,)).start()
                threading.Timer(self.P_nut_times,self.pump_off, args=(self.P_nut_pins,)).start()
                self.nut = 1

                self.slack_client.api_call(
                    "chat.postMessage",
                    channel = self.chan,
                    username=self.sysstr,
                    icon_url = self.slack_usericon,
                    thread_ts = self.threadts,
                    text = "OD = %0.3f, pumping nutrient. Cefepime concentration: %f ug/mL" % (self.avOD, (self.drug_mass)/12)
                    )


        else: #report even when pumps aren't activated yet

            self.drug_mass = 0

            self.slack_client.api_call(
                    "chat.postMessage",
                    channel = self.chan,
                    username=self.sysstr,
                    icon_url = self.slack_usericon,
                    thread_ts = self.threadts,
                    text = "OD = %0.3f, OD below nutrient pump threshold." % (self.avOD)
                    )

        self.last_dilutionOD = self.avOD

    def secondsToText(self,secs):
        if secs:
            days = secs//86400
            hours = (secs - days*86400)//3600
            minutes = (secs - days*86400 - hours*3600)//60
            seconds = secs - days*86400 - hours*3600 - minutes*60
            result = ("{0} day{1}, ".format(days, "s" if days!=1 else "") if days else "") + \
            ("{0} hour{1}, ".format(hours, "s" if hours!=1 else "") if hours else "") + \
            ("{0} minute{1}, ".format(minutes, "s" if minutes!=1 else "") if minutes else "") + \
            ("{0} second{1}, ".format(seconds, "s" if seconds!=1 else "") if seconds else "")
            return result[:-2]
        else:
            return "0 seconds"

    def on_timer(self):
        # note the time the loop starts
        self.now = datetime.now()
        self.nows = time.time()
        self.beginning = time.time()

        if self.loops < self.total_time/self.time_between_ODs:
            threading.Timer(self.time_between_ODs,self.on_timer).start()
        else:
            self.now = datetime.now()
            self.nows = time.time()
            print('[%s] Experiment Complete at %02s:%02s:%02s ' % (self.sysstr, self.now.hour, self.now.minute, self.now.second))
            # GPIO.output(P_fan_pins,0)

            self.slack_client.api_call(
                "chat.postMessage",
                channel = self.chan,
                username=self.sysstr,
                icon_url = self.slack_usericon,
                thread_ts = self.threadts,
                text = "Experiment Complete at %02s:%02s:%02s " % (self.now.hour, self.now.minute, self.now.second)
                )

        self.loops += 1
        #print(self.loops)

        # read OD data to be used for both controlling and saving during this loop
        threading.Thread(target=self.get_OD()).start()

        self.elapsed_time = self.now - self.start_time

        #self.elapsed_time_h = datetime(1,1,1) + self.elapsed_time
        print ('[%s] Elapsed Time: %s ; OD = %.3f' % (self.sysstr, self.secondsToText(self.elapsed_time.seconds),self.currOD))

        # activate pumps if needed and it's time (threaded to preserve time b/w ODss if this takes > time_between_OD
        if self.loops % (self.loops_between_pumps ) == 0:
            threading.Thread(self.control_alg()).start()

        # Graph if it is time per the global var
        if (self.loops % int(self.time_between_graphs*60/self.time_between_ODs)) == 0:
            threading.Thread(self.graphOD()).start()

        # save the data to disk if it's time (threaded to preserve time b/w ODs if this takes > time_between_ODs)
        if (self.loops % int(self.time_between_saves*60/self.time_between_ODs)) == 0:
            print('[%s] Saving to disk' % self.sysstr)
            threading.Thread(self.savefunc()).start()
        else:
            print('[%s] Buffering Data' % self.sysstr)
            threading.Thread(self.bufferdata()).start()

        # note the time the functions end
        self.end = time.time()
        self.interval = self.beginning - self.end

        # wait some period of time so that the total is time_between_ODs
        if self.interval > self.time_between_ODs:
            print('[%s] warning: loop took longer than requested OD interval' % self.sysstr)
        time.sleep(self.time_between_ODs - self.interval)
        #self.elapsed_loop_time += time_between_ODs



# Morbidostat()
