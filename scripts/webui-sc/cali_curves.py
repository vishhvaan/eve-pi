#!/usr/bin/python3

import time
import RPi.GPIO as GPIO
import sys
from datetime import datetime

import digitalio
import board
import busio
from adafruit_mcp230xx.mcp23017 import MCP23017
import adafruit_ads1x15.ads1015 as ADS
import adafruit_ads1x15.ads1115 as ADS_HR
from adafruit_ads1x15.analog_in import AnalogIn

import configparser
from multiprocessing import Process
import os
import csv

config = configparser.ConfigParser()
config.read('eve-conf.ini')


try:
    frac = float(sys.argv[2])
except ValueError:
    sys.exit("Please type a number.")

try:
    chkt = float(sys.argv[3])
except ValueError:
    sys.exit("Please type a number.")

try:
    loops = int(sys.argv[4])
except ValueError:
    sys.exit("Please type a integer.")

chkt=abs(chkt)
totsys = (''.join(config.sections())).count('CU')

adc = list()
gpioe = list()

adc_add = list()
gpio_add = list()

for sysitr in range(totsys):
    sysnum = sysitr + 1
    confsec = 'CU' + str(sysnum)
    if config[confsec].getboolean('enabled'):
        adc_add.append(config[confsec].getint('a_address'))
        if not config[confsec].getboolean('Pi_pins'):
            gpio_add.append(config[confsec].getint('m_address'))

adc_add = list(set(adc_add))
gpio_add = list(set(gpio_add))

i2c = busio.I2C(board.SCL, board.SDA)

if adc_add:
    for add in adc_add:
        if config['MAIN'].getboolean('ads1115'):
            adc.append(ADS_HR.ADS1115(i2c, address = add))
        else:
            adc.append(ADS.ADS1015(i2c, address = add))

if gpio_add:
    for add in gpio_add:
        gpioe.append(MCP23017(i2c, address = add))



def runner(sysnum,gpioe,gpio_add,adc,adc_add,chkt,loops,outfile):
    confsec = 'CU' + str(sysnum)
    print(confsec)
    pipins = config[confsec].getboolean('Pi_pins')
    P_LED_pins = config[confsec].getint('P_LED_pins')
    if config['MAIN'].getboolean('ads1115'):
        photod = AnalogIn(adc[adc_add.index(config[confsec].getint('a_address'))], getattr(ADS_HR,'P'+ str(config[confsec].getint('Analogin'))))
    else:
        photod = AnalogIn(adc[adc_add.index(config[confsec].getint('a_address'))], getattr(ADS,'P'+ str(config[confsec].getint('Analogin'))))

    odlist = []

    if pipins:
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(P_LED_pins, GPIO.OUT)
        GPIO.output(P_LED_pins,1)
        time.sleep(0.1)

    else:
        mcp = gpioe[gpio_add.index(config[confsec].getint('m_address'))]

        led_pin = mcp.get_pin(P_LED_pins)
        led_pin.direction = digitalio.Direction.OUTPUT
        led_pin.value = True
        time.sleep(0.1)

    for i in list(range(loops)):
        print("{:>5}\t{:>5.3f}".format(photod.value, photod.voltage))
        odlist.append(photod.voltage)
        time.sleep(chkt)


    if pipins:
        GPIO.output(P_LED_pins,0)
        time.sleep(0.1)

    else:
        led_pin.value = False
        time.sleep(0.1)

    # print(odlist)

    with open(outfile, 'a') as file:
        wr = csv.writer(file)
        wr.writerows(map(lambda x: [x], odlist))
        file.close()



evestr = sys.argv[1]
evesys = int(evestr)
print('CU Selected: %s' % evesys)
confsec = 'CU' + evestr
if not config[confsec].getboolean('enabled'):
    print("CU not enabled")
    sys.exit()

print()
root_dir = config['MAIN']['save_location']
if root_dir[-1] == '/': root_dir.pop(-1)
now = datetime.now()
cdate = now.strftime("%x").replace('/','')
outfile = "%s/Calibration Curves/%s/%s/%s.csv" % (root_dir, confsec, cdate, frac)
folder = "%s/Calibration Curves/%s/%s" % (root_dir, confsec, cdate)
if not os.path.exists(folder): os.makedirs(folder)


runner(evesys,gpioe,gpio_add,adc,adc_add,chkt,loops,outfile)
print()
print("Done")



