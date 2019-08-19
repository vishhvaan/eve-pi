#!/usr/bin/python3
""" Vishhvaan's Test Script """

import time
import RPi.GPIO as GPIO
from adafruit_mcp230xx.mcp23017 import MCP23017
import digitalio
import board
import busio

import configparser

import sys

try:
    evenum = int(sys.argv[1])
    fant = float(sys.argv[3])
except ValueError:
    sys.exit("Please type a number.")

config = configparser.ConfigParser()
config.read('../test/multiplex/eve-conf.ini')

totsys = (''.join(config.sections())).count('CU')
sysstr = 'CU' + str(evenum)

i2c = busio.I2C(board.SCL, board.SDA)
# mcp = adafruit_mcp230xx.MCP23017(i2c, address=32)
mcp = MCP23017(i2c, address=config[sysstr].getint('m_address'))

fant=abs(fant)

# setup the GPIO pins to control the devices
P_sfan_pins = config[sysstr].getint('P_sfan_pins')
P_fan_pins = config[sysstr].getint('P_fan_pins')
pin_list = [P_fan_pins, P_sfan_pins]

pins =  [None]*(max(pin_list)+1)

for i in pin_list:
    pins[i] = mcp.get_pin(i)
    pins[i].direction = digitalio.Direction.OUTPUT
    pins[i].value = False

class Morbidostat():
    def __init__(self):
        if sys.argv[2] == "Off":
            print("Turning Fan Off")
            pins[P_sfan_pins].value = False
            pins[P_fan_pins].value = False
        elif sys.argv[2] == "On":
            print("Fan at Full Power")
            pins[P_sfan_pins].value = True
            pins[P_fan_pins].value = True
            time.sleep(fant)
            pins[P_sfan_pins].value = False
            print("Fan at Low Power. Done.")

try:
    Morbidostat()
except KeyboardInterrupt:
    pins[P_sfan_pins].value = False
    pins[P_fan_pins].value = False
    print("Stopped Early")
