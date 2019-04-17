

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

import board
import busio
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn

# Needed for Slack Integration
import re
import json
import psutil
from slackclient import SlackClient

# Needed for Screenshots
#import gtk.gdk
from subprocess import call

#Graphs
import pandas as pd
import matplotlib.pyplot as plt


# Define Experimental Variables
time_between_pumps = 12  # how often to activate pumps, in minutes
OD_thr = 1.5  # threshold above which to activate drug pump  [vish bench tests: empty: 3.5V, Clear Vial: 0.265V, Very Cloudy Vial: 2.15V]
OD_min = 0.7 # minimum OD needed to run the loop that activates pumps; 55
time_between_ODs = 2  # how often to gather OD data, in seconds
time_between_graphs = 30 # how often to graph, in minutes
#time_between_writes = 1  # how often to write out OD data, in minutes

total_time = 48*60*60 #in seconds, default is 2 days
loops_between_ODs = 1
loops_between_pumps = (time_between_pumps*60)/time_between_ODs # time between pumps in loops
#loops_between_writes = (time_between_writes*60)/time_between_ODs # time bewteen writes in loops
num_cham = 1 # number of morbidostat vials being used

OD_av_length = 30 #number of OD measurements to be averaged

# Setup the GPIO Pins to Control the Pumps
P_drug_pins = [20]
P_nut_pins = [24]
P_waste_pins = [25]
P_LED_pins = [21]
P_fan_pins = [26]
pin_list = [P_drug_pins + P_nut_pins + P_waste_pins + P_LED_pins + P_fan_pins]
GPIO.setmode(GPIO.BCM)
for pin in pin_list:
    GPIO.setup(pin, GPIO.OUT)
    GPIO.output(pin,0)
# GPIO.output(P_fan_pins,1)

# Set Up I2C to Read OD Data
# Create the I2C bus
i2c = busio.I2C(board.SCL, board.SDA)

# Create the ADC object using the I2C bus
ads = ADS.ADS1015(i2c)

# Create single-ended input on channel 0
# photoreceptor_channel = 0
photod = AnalogIn(ads, ADS.P0)

# P_drug_times = [2/1.4]
# P_nut_times = [2/1.6]
# P_waste_times = [2/1.6]
P_drug_times = 1.25
P_nut_times = 1.25
P_waste_times = 1.25

# Set Up Reporting for Slack
slack_client = SlackClient("xoxb-15598920096-507190138311-pIsmBndOCk1YsVbflP5qXnnT")

user_list = slack_client.api_call("users.list")

for user in user_list.get('members'):
    if user.get('name')== "blob":
        slack_user_id = user.get('id')
        break

if slack_client.rtm_connect():
    print ("Connected!")

#Report on RAM usage every half hour


class Morbidostat():
    # Read data from the ADC
    def __init__(self):
        self.running_data = []  # the list which will hold our 2-tuples of time and OD
        self.pump_data = []
        # self.currOD = np.zeros(num_cham)
        self.currOD = 0
        # averaged OD value
        # self.avOD = np.zeros(num_cham)
        self.avOD = 0
        # OD averaging buffer
        self.avOD_buffer = np.zeros(OD_av_length)#need to change for multiplexing
        self.start_time = datetime.now()
        os.makedirs("/mnt/morbidodata/"+str(self.start_time))

        self.elapsed_loop_time = 0
        self.loops = 0
        self.last_dilutionOD = 0
        self.nut = 0
        self.drug = 1
        self.waste = 2

        self.drug_mass = 0

        self.outfile_OD = "/mnt/morbidodata/%s/ODdata_%s.csv" % (self.start_time, self.start_time)
        file = open(self.outfile_OD, 'a')
        wr = csv.writer(file)
        # wr.writerow(['Current OD', 'Average OD','OD Timing'])
        wr.writerow(['current', 'average','time','hour'])
        file.close()

        self.outfile_pump = "/mnt/morbidodata/%s/pump_%s.csv" % (self.start_time, self.start_time)
        file = open(self.outfile_pump, 'a')
        wr = csv.writer(file)
        # wr.writerow(['Nutrient Pump', 'Drug Pump','Waste Pump','Pump Timing', 'Drug Mass'])
        wr.writerow(['media', 'drug','waste','pump_time','hour','drug_mass'])
        file.close()

        # print('Experiment begun at %02s:%02s:%02s' % (self.start_time.hour, self.start_time.minute, self.start_time.second))
        print(self.start_time.strftime('Experiment begun at %H:%M:%S on %a - %b %d, %Y'))
        self.on_timer()

        slack_client.api_call(
            "chat.postMessage",
            channel='#morbidotest',
            text = self.start_time.strftime('Experiment begun at %H:%M:%S on %a - %b %d, %Y'),
            as_user=True)

    def get_OD(self):
        GPIO.output(P_LED_pins,1)
        # self.value = []
        #self.cpu_pct = psutil.cpu_percent(interval=1, percpu=True)
        time.sleep(0.1)
        # for i in photoreceptor_channel_pins:
        #     self.value.append( adc.read_adc(i))
        # self.value.append(photod.voltage)
        self.currOD = photod.voltage #np.asarray(self.value)#[0]
        time.sleep(0.1)
        GPIO.output(P_LED_pins,0)
        #print("OD: current voltage (raw) = ", self.currOD[0:num_cham])
        #print('Elapsed Time: %02s:%02s:%02s; OD = ' % (self.now.hour, self.now.minute, self.now.second), self.currOD[0:num_cham])

        #process the data
        #self.avOD_buffer = np.append(self.avOD_buffer, self.currOD.reshape(1,num_cham), axis=0)  #might need to transpose if more than one pd (for multiplexing)
        self.avOD_buffer = np.append(self.avOD_buffer, self.currOD)  #might need to transpose if more than one pd (for multiplexing)

        # then remove the first item in the array, i.e. the oldest
        self.avOD_buffer = np.delete(self.avOD_buffer, 0)
        # calculate average for each flask
        self.avOD = np.mean(self.avOD_buffer)


    def pump_on(self,pump):
        GPIO.output(pump, 1)
        print('Turning on pump',pump)

    def pump_off(self,pump):
        GPIO.output(pump, 0)
        print('Turning off pump',pump)

    def all_pump_off(self):
        for i in pin_list:
            GPIO.output(i, 0)
        print('Turning off all pumps')


    def savefunc(self):
        print('saving to disk')
        OD_tmplist = []
        pump_tmplist = []

        # for i in range(num_cham):
        #     OD_tmplist.append(self.currOD[i])
        #     OD_tmplist.append(self.avOD[i])

        OD_tmplist.append(self.currOD)
        OD_tmplist.append(self.avOD)

        # file = open(self.outfile_OD, 'ab')
        with open(self.outfile_OD, 'a') as file:
            # OD_tmplist.append(self.now)
            OD_tmplist.append(self.nows)
            OD_tmplist.append((86400 - self.elapsed_time.seconds)/3600)
            wr = csv.writer(file)
            wr.writerow(OD_tmplist)
            file.close()

        # file = open(self.outfile_pump, 'ab')
        # pump_tmplist =[self.nut,self.drug,self.waste,self.now,self.drug_mass]
        pump_tmplist =[self.nut,self.drug,self.waste,self.nows,(86400 - self.elapsed_time.seconds)/3600,self.drug_mass]
        with open(self.outfile_pump, 'a') as file:
            wr = csv.writer(file)
            wr.writerow(pump_tmplist)
            file.close()
            self.nut = 0
            self.drug = 1
            self.waste = 2

    def graphOD(self):
        print('generating graph')
        # slack_client.api_call(
        #     "chat.postmessage",
        #     channel='#morbidotest',
        #     text = "the graph goes here!",
        #     as_user=true)

        slack_client.api_call(
            "chat.postMessage",
            channel='#morbidotest',
            text = ('Elapsed Time: %s ; OD = %.3f' % (self.secondsToText(86400 - self.elapsed_time.seconds),self.currOD)),
            as_user=True)

        #print ('Elapsed Time: %s; OD = %.3f' % (self.secondsToText(86400 - self.elapsed_time.seconds),self.currOD))

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
        ODfig.savefig("/mnt/morbidodata/%s/ODplot_%s.png" % (self.start_time, self.start_time))
        allODs = None; ODplt = None; ODfig = None; fig = None
        with open("/mnt/morbidodata/%s/ODplot_%s.png" % (self.start_time, self.start_time), "rb") as file_content:
            slack_client.api_call(
                "files.upload",
                channels='morbidotest',
                title = "ODPlot",
                file = file_content,
            )

        allpumps = pd.read_csv(self.outfile_pump, index_col='hour')   # cols: 'media', 'drug','waste','pump_time','hour','drug_mass'
        PUplt = (allpumps[['media','drug','waste']]).plot()
        PUfig = PUplt.get_figure()
        PUfig.savefig("/mnt/morbidodata/%s/PUplot_%s.png" % (self.start_time, self.start_time))
        allpumps = None; PUplt = None; PUfig = None; fig = None
        with open("/mnt/morbidodata/%s/PUplot_%s.png" % (self.start_time, self.start_time), "rb") as file_content:
            slack_client.api_call(
                "files.upload",
                channels='morbidotest',
                title = "PUPlot",
                file = file_content,
            )



    # def graph_upload(self):
        # with open("/mnt/morbidodata/%s/ODplot_%s.png" % (self.start_time, self.start_time), "rb") as file_content:
            # slack_client.api_call(
                # "files.upload",
                # channels='morbidotest',
                # title = "ODPlot",
                # file = file_content,
            # )

        # slack_client.api_call(
            # "files.upload",
            # channels='morbidotest',
            # filename = PUplt,
            # title = "PUPlot",
            # file = open("/mnt/morbidodata/%s/PUplot_%s.png" % (self.start_time, self.start_time), "rb"),
            # as_user = True)

    def morbidostat(self):

        # for i in range(num_cham):

        if self.avOD > OD_min:

            threading.Thread(target=self.pump_on, args=(P_waste_pins,)).start()
            threading.Timer(P_waste_times,self.pump_off, args=(P_waste_pins,)).start()
            self.waste = 3

            self.drug_mass = self.drug_mass - (self.drug_mass/12)

            if self.avOD > OD_thr and self.avOD > self.last_dilutionOD:
                print('OD Threshold exceeded, pumping cefepime')

                threading.Thread(target=self.pump_on, args=(P_drug_pins,)).start()
                threading.Timer(P_drug_times,self.pump_off, args=(P_drug_pins,)).start()
                self.drug = 2

                self.drug_mass = self.drug_mass + 2.5

                slack_client.api_call(
                    "chat.postMessage",
                    channel='#morbidotest',
                    text = "OD = %0.3f, pumping cefepime. Cefepime concentration: %f ug/mL" % (self.avOD, (self.drug_mass)/12),
                    as_user=True)


            else:
                print('OD below threshold, pumping nutrient')

                threading.Thread(target=self.pump_on, args=(P_nut_pins,)).start()
                threading.Timer(P_nut_times,self.pump_off, args=(P_nut_pins,)).start()
                self.nut = 1

                slack_client.api_call(
                    "chat.postMessage",
                    channel='#morbidotest',
                    text = "OD = %0.3f, pumping nutrient. Cefepime concentration: %f ug/mL" % (self.avOD, (self.drug_mass)/12),
                    as_user=True)


        else: #report even when pumps aren't activated yet

            self.drug_mass = 0

            slack_client.api_call(
                    "chat.postMessage",
                    channel='#morbidotest',
                    text = "OD = %0.3f, OD below nutrient pump threshold." % (self.avOD),
                    as_user=True)

        self.last_dilutionOD = self.avOD

    def secondsToText(self,secs):
        days = secs//86400
        hours = (secs - days*86400)//3600
        minutes = (secs - days*86400 - hours*3600)//60
        seconds = secs - days*86400 - hours*3600 - minutes*60
        result = ("{0} day{1}, ".format(days, "s" if days!=1 else "") if days else "") + \
        ("{0} hour{1}, ".format(hours, "s" if hours!=1 else "") if hours else "") + \
        ("{0} minute{1}, ".format(minutes, "s" if minutes!=1 else "") if minutes else "") + \
        ("{0} second{1}, ".format(seconds, "s" if seconds!=1 else "") if seconds else "")
        return result[:-2]

    def on_timer(self):
        if self.loops < total_time/time_between_ODs:
            threading.Timer(time_between_ODs,self.on_timer).start()
        else:
            self.now = datetime.now()
            self.nows = time.time()
            print('Experiment Complete at %02s:%02s:%02s ' % (self.now.hour, self.now.minute, self.now.second))
            # GPIO.output(P_fan_pins,0)

            slack_client.api_call(
                "chat.postMessage",
                channel='#morbidotest',
                text = "Experiment Complete at %02s:%02s:%02s " % (self.now.hour, self.now.minute, self.now.second),
                as_user=True)

        self.loops += 1
        #print(self.loops)
        # note the time the loop starts
        self.now = datetime.now()
        self.nows = time.time()
        self.beginning = time.time()

        # read OD data to be used for both controlling and saving during this loop
        threading.Thread(target=self.get_OD()).start()

        self.elapsed_time = self.start_time - self.now
        # save the data to disk if it's time (threaded to preserve time b/w ODs if this takes > time_between_ODs)
        threading.Thread(self.savefunc()).start()

        #self.elapsed_time_h = datetime(1,1,1) + self.elapsed_time
        print ('Elapsed Time: %s ; OD = %.3f' % (self.secondsToText(86400 - self.elapsed_time.seconds),self.currOD))

        # activate pumps if needed and it's time (threaded to preserve time b/w ODss if this takes > time_between_OD
        if self.loops % (loops_between_pumps ) == 0:
            threading.Thread(self.morbidostat()).start()

        # Graph if it is time per the global var
        if (self.loops % int(time_between_graphs*60/time_between_ODs)) == 0:
            threading.Thread(self.graphOD()).start()

        # note the time the functions end
        self.end = time.time()
        self.interval = self.beginning - self.end

        # wait some period of time so that the total is time_between_ODs
        if self.interval > time_between_ODs:
            print('warning: loop took longer than requested OD interval')
        time.sleep(time_between_ODs - self.interval)
        #self.elapsed_loop_time += time_between_ODs



Morbidostat()
