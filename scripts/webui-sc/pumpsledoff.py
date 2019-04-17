#!/usr/bin/python3
""" Vishhvaan's Test Script """

import time
import RPi.GPIO as GPIO
import sys

import digitalio
import board
import busio
import adafruit_mcp230xx

import configparser
from multiprocessing import Process

config = configparser.ConfigParser()
config.read('eve-conf.ini')


totsys = (''.join(config.sections())).count('EVE')

gpioe = list()
gpio_add = list()

for sysitr in range(totsys):
    sysnum = sysitr + 1
    confsec = 'EVE' + str(sysnum)
    if config[confsec].getboolean('enabled'):
        if not config[confsec].getboolean('Pi_pins'):
            gpio_add.append(config[confsec].getint('m_address'))

gpio_add = list(set(gpio_add))

i2c = busio.I2C(board.SCL, board.SDA)

if gpio_add:
    for add in gpio_add:
        gpioe.append(adafruit_mcp230xx.MCP23017(i2c, address=add))

def runner(sysnum,gpioe,gpio_add):
    confsec = 'EVE' + str(sysnum)
    pipins = config[confsec].getboolean('Pi_pins')
    P_drug_pins = config[confsec].getint('P_drug_pins')
    P_nut_pins = config[confsec].getint('P_nut_pins')
    P_waste_pins = config[confsec].getint('P_waste_pins')
    P_LED_pins = config[confsec].getint('P_LED_pins')

    pin_list = [P_drug_pins, P_nut_pins, P_waste_pins, P_LED_pins]
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
    confsec = 'EVE' + str(sysiter)
    if config[confsec].getboolean('enabled'):
        evesys.append(sysiter)
print('EVEs Enabled:')
print(evesys)
print('Started')
print('Pin Lists:')

for sysiter in evesys:
    sysstr = 'EVE' + str(sysiter)
    runner(sysiter,gpioe,gpio_add)
