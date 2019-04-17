""" FAN OFF """

import time
import RPi.GPIO as GPIO

# setup the GPIO pins to control the fan
P_fan_pins = [26]
P_sfan_pins = [19]

pin_list = [P_fan_pins + P_sfan_pins]
GPIO.setmode(GPIO.BCM)
for pin in pin_list:
    GPIO.setup(pin, GPIO.OUT)

class Morbidostat():
	def __init__(self):
                GPIO.output(P_fan_pins,0)
                print("Done!")

Morbidostat()

GPIO.cleanup()
