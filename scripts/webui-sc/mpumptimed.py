#!/usr/bin/python3

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

try:
    pumpt = float(sys.argv[3])
except ValueError:
    sys.exit("Please type a number.")

pumpt=abs(pumpt)
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

def runner(sysnum,gpioe,gpio_add,pname):
    confsec = 'CU' + str(sysnum)
    pipins = config[confsec].getboolean('Pi_pins')
    P_drug_pins = config[confsec].getint('P_drug_pins')
    P_nut_pins = config[confsec].getint('P_nut_pins')
    P_waste_pins = config[confsec].getint('P_waste_pins')

    pin_list = [P_drug_pins, P_nut_pins, P_waste_pins]
    print(pin_list)


    if pipins:
        GPIO.setmode(GPIO.BCM)
        for pin in pin_list:
            GPIO.setup(pin, GPIO.OUT)
            GPIO.output(pin,0)
            time.sleep(0.1)
        for i in pname:
            if i == "Drug":
                GPIO.output(P_drug_pins,1)
                time.sleep(0.1)
            elif i == "Media":
                GPIO.output(P_nut_pins,1)
                time.sleep(0.1)
            elif i == "Waste":
                GPIO.output(P_waste_pins,1)
                time.sleep(0.1)

    else:
        pins = [None]*(max(pin_list)+1)
        mcp = gpioe[gpio_add.index(config[confsec].getint('m_address'))]

        for pin in pin_list:
            pins[pin] = mcp.get_pin(pin)
            pins[pin].direction = digitalio.Direction.OUTPUT
            pins[pin].value = False
            time.sleep(0.1)

        for i in pname:
            if i == "Drug":
                pins[P_drug_pins].value = True
                time.sleep(0.1)
            elif i == "Media":
                pins[P_nut_pins].value = True
                time.sleep(0.1)
            elif i == "Waste":
                pins[P_waste_pins].value = True
                time.sleep(0.1)

    print("Started ...")

def stopper(sysnum,gpioe,gpio_add,pname):
    confsec = 'CU' + str(sysnum)
    pipins = config[confsec].getboolean('Pi_pins')
    P_drug_pins = config[confsec].getint('P_drug_pins')
    P_nut_pins = config[confsec].getint('P_nut_pins')
    P_waste_pins = config[confsec].getint('P_waste_pins')

    pin_list = [P_drug_pins, P_nut_pins, P_waste_pins]
    if pipins:
        GPIO.setmode(GPIO.BCM)
        for pin in pin_list:
            GPIO.setup(pin, GPIO.OUT)
            GPIO.output(pin,0)
            time.sleep(0.1)
    else:
        pins = [None]*(max(pin_list)+1)
        mcp = gpioe[gpio_add.index(config[confsec].getint('m_address'))]
        for pin in pin_list:
            pins[pin] = mcp.get_pin(pin)
            pins[pin].direction = digitalio.Direction.OUTPUT
            pins[pin].value = False
            time.sleep(0.1)

    print("Finished")





totsys_l = sys.argv[1]
print('CUs Selected:')

evesys = []
if totsys_l == 'all':
    totsys_l = list(range(totsys+1))
    totsys_l.pop(0)
    for sysiter in totsys_l:
        confsec = 'CU' + str(sysiter)
        if config[confsec].getboolean('enabled'):
            evesys.append(sysiter)
else:
    totsys_l = totsys_l.split(',')
    totsys_l = list(map(int, totsys_l))
    for sysiter in totsys_l:
        confsec = 'CU' + str(sysiter)
        if config[confsec].getboolean('enabled'):
            evesys.append(sysiter)
print(evesys)
pname = sys.argv[2].split(',')
print('Started')
print('Pin Lists:')

for sys in evesys: runner(sys,gpioe,gpio_add,pname)

print('Running ...')
time.sleep(pumpt)

for sys in evesys: stopper(sys,gpioe,gpio_add,pname)


