#!/usr/bin/python3
""" Vishhvaan's Test Script """

import time
import RPi.GPIO as GPIO
import sys

import digitalio
import board
import busio
from adafruit_mcp230xx.mcp23017 import MCP23017
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn

import configparser
from multiprocessing import Process

config = configparser.ConfigParser()
config.read('eve-conf.ini')

try:
    chkt = float(sys.argv[2])
except ValueError:
    sys.exit("Please type a number.")

try:
    loops = int(sys.argv[3])
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
        adc.append(ADS.ADS1015(i2c, address= add))

if gpio_add:
    for add in gpio_add:
        gpioe.append(MCP23017(i2c, address=add))

def runner(sysnum,gpioe,gpio_add,adc,adc_add,chkt,loops):
    confsec = 'CU' + str(sysnum)
    print(confsec)
    pipins = config[confsec].getboolean('Pi_pins')
    pins = [config[confsec].getint('P_LED_pins')]
    if config[confsec]['P_ind_pins'].isdigit(): pins.append(config[confsec].getint('P_ind_pins'))
    photod = AnalogIn(adc[adc_add.index(config[confsec].getint('a_address'))], getattr(ADS,'P'+ str(config[confsec].getint('Analogin'))))

    if pipins:
        GPIO.setmode(GPIO.BCM)
        for pin in pins:
            GPIO.setup(pin, GPIO.OUT)
            GPIO.output(pin,1)
        time.sleep(0.1)
    else:
        mcp = gpioe[gpio_add.index(config[confsec].getint('m_address'))]
        mcp_pins = []
        for pin in pins:
            mcp_pins.append(mcp.get_pin(pin))
            mcp_pins[-1].direction = digitalio.Direction.OUTPUT
            mcp_pins[-1].value = True
        time.sleep(0.1)

    for i in list(range(loops)):
        print("{:>5}\t{:>5.3f}".format(photod.value, photod.voltage))
        time.sleep(chkt)


    if pipins:
        for pin in pins: GPIO.output(pin,0)
        time.sleep(0.1)
    else:
        for pin in mcp_pins: pin.value = False
        time.sleep(0.1)

evesys = sys.argv[1]

totsys_l = sys.argv[1]
print('CUs Selected:')

if totsys_l == 'all':
    totsys_l = list(range(totsys+1))
    totsys_l.pop(0)
    evesys = []
    for sysiter in totsys_l:
        confsec = 'CU' + str(sysiter)
        if config[confsec].getboolean('enabled'):
            evesys.append(sysiter)
else:
    totsys_l = totsys_l.split(',')
    totsys_l = list(map(int, totsys_l))
    evesys = []
    for sysiter in totsys_l:
        confsec = 'CU' + str(sysiter)
        if config[confsec].getboolean('enabled'):
            evesys.append(sysiter)
print(evesys)

for sys in evesys:
    sysstr = 'CU' + str(sys)
    runner(sys,gpioe,gpio_add,adc,adc_add,chkt,loops)
    print()

print("Done")



