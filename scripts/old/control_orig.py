

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
import Adafruit_ADS1x15
import numpy as np

# Needed for Slack Integration
import re
import json
import psutil
from slackclient import SlackClient

# Needed for Screenshots
import gtk.gdk
from subprocess import call
import time


# Define Experimental Variables
time_between_pumps = 12  # how often to activate pumps, in minutes
OD_thr = 70  # threshold above which to activate drug pump
OD_min = 55 # minimum OD needed to run the loop that activates pumps; 55
time_between_ODs = 2  # how often to gather OD data, in seconds
#time_between_writes = 1  # how often to write out OD data, in minutes

total_time = 72*60*60 #in seconds, default is 2 days
loops_between_ODs = 1 
loops_between_pumps = (time_between_pumps*60)/time_between_ODs # time between pumps in loops
#loops_between_writes = (time_between_writes*60)/time_between_ODs # time bewteen writes in loops
num_cham = 1 # number of morbidostat vials being used

OD_av_length = 30 #number of OD measurements to be averaged

# Setup the GPIO Pins to Control the Pumps
P_drug_pins = [20]
P_nut_pins = [24]
P_waste_pins = [25]
pin_list = [P_drug_pins+ P_nut_pins+P_waste_pins]
GPIO.setmode(GPIO.BCM)
for pin in pin_list:
    GPIO.setup(pin, GPIO.OUT)

# Set Up I2C to Read OD Data
adc = Adafruit_ADS1x15.ADS1015()
photoreceptor_channel_pins = [0]


P_drug_times = [2/1.4]
P_nut_times = [2/1.6]
P_waste_times = [2/1.6]

# Set Up Reporting for Slack
slack_client = SlackClient("xoxb-15598920096-403217259219-hziU8BstEflHagE0HiZppAlJ")

user_list = slack_client.api_call("users.list")

for user in user_list.get('members'):
    if user.get('name')== "eve2":
        slack_user_id = user.get('id')
        break

if slack_client.rtm_connect():
    print "Connected!"

#Report on RAM usage every half hour


class Morbidostat():
    # Read data from the ADC
    def __init__(self):
        self.running_data = []  # the list which will hold our 2-tuples of time and OD
        self.pump_data = []
        self.currOD = np.zeros(num_cham)
        # averaged OD value 
        self.avOD = np.zeros(num_cham)
        # OD averaging buffer 
        self.avOD_buffer = np.zeros((OD_av_length, num_cham))
        self.start_time = datetime.now()
        os.makedirs(str(self.start_time))
        
        self.elapsed_loop_time = 0
        self.loops = 0
        self.last_dilutionOD = 0
        self.nut = 0	
        self.drug = 1
        self.waste = 2  

        self.drug_mass = 0
        
        self.outfile_OD = "%s/ODdata_%s.csv" % (self.start_time, self.start_time)
        file = open(self.outfile_OD, 'ab') 
        wr = csv.writer(file)
        wr.writerow(['Current OD', 'Average OD','OD Timing'])
        file.close()

        self.outfile_pump = "%s/pump_%s.csv" % (self.start_time, self.start_time)
        file = open(self.outfile_pump, 'ab') 
        wr = csv.writer(file)
        wr.writerow(['Nutrient Pump', 'Drug Pump','Waste Pump','Pump Timing', 'Drug Mass'])
        file.close()

        print('Experiment begun at %02s:%02s:%02s' % (self.start_time.hour, self.start_time.minute, self.start_time.second))
        self.on_timer()

        slack_client.api_call(
            "chat.postMessage",
            channel='#morbidodata',
            text = "Experiment begun at %02s:%02s:%02s " % (self.start_time.hour, self.start_time.minute, self.start_time.second),
            as_user=True)

    def get_OD(self):
        self.value = []
        self.cpu_pct = psutil.cpu_percent(interval=1, percpu=True)
        for i in photoreceptor_channel_pins:
            self.value.append( adc.read_adc(i))
        self.currOD = np.asarray(self.value)
        #print("OD: current voltage (raw) = ", self.currOD[0:num_cham])
        print('Elapsed Time: %02s:%02s:%02s; OD = ' % (self.now.hour, self.now.minute, self.now.second), self.currOD[0:num_cham])
        
        #process the data
        self.avOD_buffer = np.append(self.avOD_buffer, self.currOD.reshape(1,num_cham), axis=0) 
 
        # then remove the first item in the array, i.e. the oldest 
        self.avOD_buffer = np.delete(self.avOD_buffer, 0, axis=0)          
        # calculate average for each flask
        self.avOD = np.mean(self.avOD_buffer, axis=0)

        #if self.now.minute == 30 and self.now.second == 0:
            
            #args = ['ps','aux']
            #args1 = ['awk','{print $2,$4,$11}']
            #args2 = ['sort', '-k2rn']
            #args3 = ['head','-n','5']
            #fpmem = Popen(args,stdout=PIPE,shell=False)
            #pmem1 = Popen(args1,stdin=fpmem.stdout,stdout=PIPE,shell=False)
            #pmem2 = Popen(args2,stdin=pmem1.stdout,stdout=PIPE,shell=False)
            #pmem = Popen(args3,stdin=pmem2.stdout,stdout=PIPE,shell=False)
            #stdout = pmem.communicate()
#
            #slack_client.api_call(
                #"chat.postMessage",
                #channel='#morbidodata',
                #text = "CPU = %s%%, R = %s" % (self.cpu_pct, stdout),
                #as_user=True)

        
        #if self.now.minute == 30 and self.now.second == 1:
            
            #args = ['ps','aux']
            #args1 = ['awk','{print $2,$4,$11}']
            #args2 = ['sort', '-k2rn']
            #args3 = ['head','-n','5']
            #fpmem = Popen(args,stdout=PIPE,shell=False)
            #pmem1 = Popen(args1,stdin=fpmem.stdout,stdout=PIPE,shell=False)
            #pmem2 = Popen(args2,stdin=pmem1.stdout,stdout=PIPE,shell=False)
            #pmem = Popen(args3,stdin=pmem2.stdout,stdout=PIPE,shell=False)
            #stdout = pmem.communicate()

            #slack_client.api_call(
                #"chat.postMessage",
                #channel='#morbidodata',
                #text = "CPU = %s%%, R = %s" % (self.cpu_pct, stdout),
                #as_user=True)

        if self.now.minute == 0 and self.now.second == 0:
            
            #args = ['ps','aux']
            #args1 = ['awk','{print $2,$4,$11}']
            #args2 = ['sort', '-k2rn']
            #args3 = ['head','-n','5']
            #fpmem = Popen(args,stdout=PIPE,shell=False)
            #pmem1 = Popen(args1,stdin=fpmem.stdout,stdout=PIPE,shell=False)
            #pmem2 = Popen(args2,stdin=pmem1.stdout,stdout=PIPE,shell=False)
            #pmem = Popen(args3,stdin=pmem2.stdout,stdout=PIPE,shell=False)
            #stdout = pmem.communicate()

            w = gtk.gdk.get_default_root_window()
            sz = w.get_size()
            #print "The size of the window is %d x %d" %sz
            
            pb = gtk.gdk.Pixbuf(gtk.gdk.COLORSPACE_RGB, False, 8, sz[0], sz[1])
            pb = pb.get_from_drawable(w, w.get_colormap(), 0,0,0,0, sz[0], sz[1])

            if (pb != None):

                timeStr = time.strftime("%Y%m%d-%H%M%s")
                ssFile = "screenshot_%s.png" % timeStr

                pb.save(ssFile, "png")

                slack_client.api_call(
                    "files.upload",
                    channels='#morbidodata',
                    filename = ssFile,
                    title = "Screenshot %s" % timeStr,
                    file = open(ssFile, "rb"),
                    as_user = True)


            #slack_client.api_call(
                #"chat.postMessage",
                #channel='#morbidodata',
                #text = "CPU = %s%%, R = %s" % (self.cpu_pct, stdout),
                #as_user=True)

        if self.now.minute == 0 and self.now.second == 1:
            
            #args = ['ps','aux']
            #args1 = ['awk','{print $2,$4,$11}']
            #args2 = ['sort', '-k2rn']
            #args3 = ['head','-n','5']
            #fpmem = Popen(args,stdout=PIPE,shell=False)
            #pmem1 = Popen(args1,stdin=fpmem.stdout,stdout=PIPE,shell=False)
            #pmem2 = Popen(args2,stdin=pmem1.stdout,stdout=PIPE,shell=False)
            #pmem = Popen(args3,stdin=pmem2.stdout,stdout=PIPE,shell=False)
            #stdout = pmem.communicate()

            w = gtk.gdk.get_default_root_window()
            sz = w.get_size()
            #print "The size of the window is %d x %d" %sz
            
            pb = gtk.gdk.Pixbuf(gtk.gdk.COLORSPACE_RGB, False, 8, sz[0], sz[1])
            pb = pb.get_from_drawable(w, w.get_colormap(), 0,0,0,0, sz[0], sz[1])

            if (pb != None):

                timeStr = time.strftime("%Y%m%d-%H%M%s")
                ssFile = "screenshot_%s.png" % timeStr

                pb.save(ssFile, "png")

                slack_client.api_call(
                    "files.upload",
                    channels='#morbidodata',
                    filename = ssFile,
                    title = "Screenshot %s" % timeStr,
                    file = open(ssFile, "rb"),
                    as_user = True)


            #slack_client.api_call(
                #"chat.postMessage",
                #channel='#morbidodata',
                #text = "CPU = %s%%, R = %s" % (self.cpu_pct, stdout),
                #as_user=True)
    
    # activate the pumps
    #pump_activation_times = {P_drug: [5/2.2], P_nut: 5/2.4, P_waste: 5/2.6}  # in seconds

    
    
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
            
            
    
     #write data
    def write_data(self,data):
        filename = (str('datetime.datetime.now()') + '.csv')
        print('writing data to', filename)
        with open(filename, 'w') as output:
            writer = csv.writer(output)
            for timepoint in data:
                writer.writerow(timepoint)
                
    def savefunc(self):
        print('saving to disk')
        OD_tmplist = []
        pump_tmplist = []
        
        file = open(self.outfile_OD, 'ab') 
        
        for i in range(num_cham):        
            OD_tmplist.append(self.currOD[i])
            OD_tmplist.append(self.avOD[i])
           
            
        OD_tmplist.append(self.now)
        wr = csv.writer(file)
        wr.writerow(OD_tmplist)
        file.close()

        
        file = open(self.outfile_pump, 'ab') 
        pump_tmplist =[self.nut,self.drug,self.waste,self.now,self.drug_mass]
        wr = csv.writer(file)
        wr.writerow(pump_tmplist)
        file.close()
        self.nut = 0	
        self.drug = 1
        self.waste = 2
    
    
    
    def morbidostat(self):

        for i in range(num_cham):

            if self.avOD[i] > OD_min:

                threading.Thread(target=self.pump_on, args=(P_waste_pins[i],)).start()
                threading.Timer(P_waste_times[i],self.pump_off, args=(P_waste_pins[i],)).start()
                self.waste = 3

                self.drug_mass = self.drug_mass - (self.drug_mass/12)

                if self.avOD[i] > OD_thr and self.avOD[i] > self.last_dilutionOD:
                    print('OD Threshold exceeded, pumping cefepime')

                    threading.Thread(target=self.pump_on, args=(P_drug_pins[i],)).start()
                    threading.Timer(P_drug_times[i],self.pump_off, args=(P_drug_pins[i],)).start()
                    self.drug = 2 

                    self.drug_mass = self.drug_mass + 2.5

                    slack_client.api_call(
                        "chat.postMessage",
                        channel='#morbidodata',
                        text = "OD = %d, pumping cefepime. Cefepime concentration: %f ug/mL" % (self.avOD[i], (self.drug_mass)/12),
                        as_user=True)

                    
                else:
                    print('OD below threshold, pumping nutrient')
                    
                    threading.Thread(target=self.pump_on, args=(P_nut_pins[i],)).start()
                    threading.Timer(P_nut_times[i],self.pump_off, args=(P_nut_pins[i],)).start()
                    self.nut = 1

                    slack_client.api_call(
                        "chat.postMessage",
                        channel='#morbidodata',
                        text = "OD = %d, pumping nutrient. Cefepime concentration: %f ug/mL" % (self.avOD[i], (self.drug_mass)/12),
                        as_user=True)
 
            
            else: #report even when pumps aren't activated yet

                self.drug_mass = 0

                slack_client.api_call(
                        "chat.postMessage",
                        channel='#morbidodata',
                        text = "OD = %d, OD below nutrient pump threshold." % (self.avOD[i]),
                        as_user=True)

            self.last_dilutionOD = self.avOD[i]
    
    def on_timer(self):
        if self.loops < total_time/time_between_ODs:
            threading.Timer(time_between_ODs,self.on_timer).start()    
        else:
            self.now = datetime.now()
            print('Experiment Complete at %02s:%02s:%02s ' % (self.now.hour, self.now.minute, self.now.second))

            slack_client.api_call(
                "chat.postMessage",
                channel='#morbidodata',
                text = "Experiment Complete at %02s:%02s:%02s " % (self.now.hour, self.now.minute, self.now.second),
                as_user=True)
                
            
        self.loops += 1
        #print(self.loops)
        # note the time the loop starts
        self.beginning = time.time()
        self.now = datetime.now()
        
        # read OD data to be used for both controlling and saving during this loop
        threading.Thread(target=self.get_OD()).start()
        print('Elapsed Time: %02s:%02s:%02s; OD = ' % (self.now.hour, self.now.minute, self.now.second), self.currOD)


        # activate pumps if needed and it's time (threaded to preserve time b/w ODss if this takes > time_between_OD
        if self.loops % (loops_between_pumps ) < 1:
        
            threading.Thread(self.morbidostat()).start()
        # save the data to disk if it's time (threaded to preserve time b/w ODs if this takes > time_between_ODs)
    	
        threading.Thread(self.savefunc()).start()
    
        # note the time the functions end
        self.end = time.time()
        self.interval = self.beginning - self.end
    
        # wait some period of time so that the total is time_between_ODs
        if self.interval > time_between_ODs:
            print('warning: loop took longer than requested OD interval')
        time.sleep(time_between_ODs - self.interval)
        #self.elapsed_loop_time += time_between_ODs

    
    
Morbidostat()
