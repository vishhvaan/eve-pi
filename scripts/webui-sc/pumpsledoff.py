#!/usr/bin/python3
""" Vishhvaan's Test Script """

import time
import RPi.GPIO as GPIO
import sys

import digitalio
import board
import busio
from adafruit_mcp230xx.mcp23017 import MCP23017

import configparser
from multiprocessing import Process

config = configparser.ConfigParser()
config.read('eve-conf.ini')


totsys = (''.join(config.sections())).count('CU')

gpioe = list()
gpio_add = list()

for sysitr in range(totsys):
    sysnum = sysitr + 1
    confsec = 'CU' + str(sysnum)
    if config[confsec].getboolean('enabled'):
        if not config[confsec].getboolean('Pi_pins'):
            gpio_add.append(config[confsec].getint('m_address'))

gpio_add = list(set(gpio_add))

i2c = busio.I2C(board.SCL, board.SDA)

if gpio_add:
    for add in gpio_add:
        gpioe.append(MCP23017(i2c, address=add))

def runner(sysnum,gpioe,gpio_add):
    confsec = 'CU' + str(sysnum)
    pipins = config[confsec].getboolean('Pi_pins')
    P_drug_pins = config[confsec].getint('P_drug_pins')
    P_nut_pins = config[confsec].getint('P_nut_pins')
    P_waste_pins = config[confsec].getint('P_waste_pins')
    P_LED_pins = config[confsec].getint('P_LED_pins')

    pin_list = [P_drug_pins, P_nut_pins, P_waste_pins, P_LED_pins]

    if config[confsec]['P_ind_pins'].isdigit():
        P_ind_pins = config[confsec].getint('P_ind_pins')
        pin_list.append(P_ind_pins)
    
    print(pin_list)


    if pipins:
        GPIO.setmode(GPIO.BCM)
        for pin in pin_list:
            GPIO.setup(pin, GPIO.OUT)
            GPIO.output(pin,0)
            time.sleep(.1)
    else:
        pins = [None]*(max(pin_list)+1)
        mcp = gpioe[gpio_add.index(config[confsec].getint('m_address'))]

        for pin in pin_list:
            pins[pin] = mcp.get_pin(pin)
            pins[pin].direction = digitalio.Direction.OUTPUT
            pins[pin].value = False
            time.sleep(.1)


    print("Done!")




totsys_l = list(range(totsys+1))
totsys_l.pop(0)
evesys = []
for sysiter in totsys_l:
    confsec = 'CU' + str(sysiter)
    if config[confsec].getboolean('enabled'):
        evesys.append(sysiter)
print('CUs Enabled:')
print(evesys)
print('Started')
print('Pin Lists:')

for sysiter in evesys:
    sysstr = 'CU' + str(sysiter)
    runner(sysiter,gpioe,gpio_add)
