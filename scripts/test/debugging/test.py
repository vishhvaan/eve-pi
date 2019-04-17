""" Vishhvaan's Test Script """

import time
import datetime
import csv
import threading
import os
import RPi.GPIO as GPIO
#import numpy as np

import board
import busio
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn
#import numpy as np

# Create the I2C bus
i2c = busio.I2C(board.SCL, board.SDA)

# Create the ADC object using the I2C bus
ads = ADS.ADS1015(i2c)

# Create single-ended input on channel 0
# photoreceptor_channel = 0
pd = AnalogIn(ads, ADS.P0)

# setup the GPIO pins to control the pumps
P_drug_pins = [20]
P_nut_pins = [24]
P_waste_pins = [25]
P_LED_pins = [21]
P_fan_pins = [26]

pin_list = [P_drug_pins + P_nut_pins + P_waste_pins + P_LED_pins + P_fan_pins]
GPIO.setmode(GPIO.BCM)
for pin in pin_list:
    GPIO.setup(pin, GPIO.OUT)

while True:
    print("{:>5}\t{:>5.3f}".format(pd.value, pd.voltage))
    time.sleep(0.5)

class Morbidostat():
    def __init__(self):
        GPIO.output(P_drug_pins,1)
        GPIO.output(P_nut_pins,1)
        GPIO.output(P_waste_pins,1)
        GPIO.output(P_LED_pins,1)
        GPIO.output(P_fan_pins,1)

        time.sleep(.5)
        GPIO.output(P_drug_pins,0)
        GPIO.output(P_nut_pins,0)
        GPIO.output(P_waste_pins,0)
        GPIO.output(P_LED_pins,0)
        GPIO.output(P_fan_pins,0)
        print("Done!")

Morbidostat()
