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

P_LED_pins = 11
LED = mcp.get_pin(P_LED_pins)
LED.direction = digitalio.Direction.OUTPUT
LED.value = True

# Create single-ended input on channel 0
# photoreceptor_channel = 0
pd = AnalogIn(ads, ADS.P2)

print("{:>5}\t{:>5}".format('raw', 'v'))

try:
    while True:
        print("{:>5}\t{:>5.3f}".format(pd.value, pd.voltage))
        time.sleep(0.5)
except KeyboardInterrupt:
    LED.value = False

# for x in range(0,3):
#     pdval = adc.read_adc(photoreceptor_channel)
#     time.sleep(.5)

