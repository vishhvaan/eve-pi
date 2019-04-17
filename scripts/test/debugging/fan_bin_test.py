""" Vishhvaan's Test Script """

import time
#import datetime
#import csv
#import threading
#import os
import RPi.GPIO as GPIO
#import numpy as np

# setup the GPIO pins to control the pumps
P_drug_pins = [20]
P_nut_pins = [24]
P_waste_pins = [25]
P_LED_pins = [21]
P_fan_pins = [26]
P_sfan_pins = [19]

pin_list = [P_drug_pins + P_nut_pins + P_waste_pins + P_LED_pins + P_fan_pins + P_sfan_pins]
GPIO.setmode(GPIO.BCM)
for pin in pin_list:
    GPIO.setup(pin, GPIO.OUT)

class Morbidostat():
	def __init__(self):
		# GPIO.output(P_drug_pins,1)
		# GPIO.output(P_nut_pins,1)
		# GPIO.output(P_waste_pins,1)
                # GPIO.output(P_LED_pins,1)
                # GPIO.output(P_fan_pins,1)
                GPIO.output(P_sfan_pins,1)

                time.sleep(2)
                # GPIO.output(P_drug_pins,0)
		# GPIO.output(P_nut_pins,0)
		# GPIO.output(P_waste_pins,0)
                # GPIO.output(P_LED_pins,0)
                # GPIO.output(P_fan_pins,0)
                GPIO.output(P_sfan_pins,0)
                print("Done!")

Morbidostat()

GPIO.cleanup()
