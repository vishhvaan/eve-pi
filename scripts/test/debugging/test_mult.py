""" Vishhvaan's Test Script """

import time
import datetime
import csv
import threading
import os
import RPi.GPIO as GPIO
import adafruit_mcp230xx
import digitalio

import board
import busio
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn
#import numpy as np

# Create the I2C bus
i2c = busio.I2C(board.SCL, board.SDA)

# Create the ADC object using the I2C bus
ads = ADS.ADS1015(i2c)
mcp = adafruit_mcp230xx.MCP23017(i2c, address=32)

# Create single-ended input on channel 0
# photoreceptor_channel = 0
pd = AnalogIn(ads, ADS.P0)

# setup the GPIO pins to control the pumps
P_drug_pins = [0]
P_nut_pins = [1]
P_waste_pins = [2]
P_LED_pins = [3]
# P_fan_pins = [4]

pin_list = P_drug_pins + P_nut_pins + P_waste_pins + P_LED_pins
pins = list()

for i in pin_list:
    pins.append(mcp.get_pin(i))
    pins[i].direction = digitalio.Direction.OUTPUT
    pins[i].value = False

time.sleep(1)

for i in pin_list:
    pins[i].value = True

time.sleep(1)

for i in pin_list:
    pins[i].value = False

# for pin in pins:
#     pin.value = False

print("Done!")

