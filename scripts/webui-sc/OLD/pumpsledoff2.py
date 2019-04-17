#!/usr/bin/python3
""" Vishhvaan's Test Script """

import time
import RPi.GPIO as GPIO

# setup the GPIO pins to control the pumps
P_drug_pins = [20]
P_nut_pins = [24]
P_waste_pins = [25]
P_LED_pins = [21]
#P_fan_pins = [26]

pin_list = [P_drug_pins + P_nut_pins + P_waste_pins + P_LED_pins]
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
for pin in pin_list:
    GPIO.setup(pin, GPIO.OUT)

class Morbidostat():
    def __init__(self):
        GPIO.output(P_drug_pins,0)
        GPIO.output(P_nut_pins,0)
        GPIO.output(P_waste_pins,0)
        GPIO.output(P_LED_pins,0)
#        GPIO.output(P_fan_pins,0)
#        GPIO.cleanup()
        print("Done!")

try:
    Morbidostat()
except KeyboardInterrupt:
    GPIO.output(P_drug_pins,0)
    GPIO.output(P_nut_pins,0)
    GPIO.output(P_waste_pins,0)
    GPIO.output(P_LED_pins,0)
#    GPIO.cleanup()
    print("Stopped Early")
