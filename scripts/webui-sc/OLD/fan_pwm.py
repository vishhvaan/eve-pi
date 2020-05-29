#!/usr/bin/python3

import time

from board import SCL, SDA
import busio

from adafruit_pca9685 import PCA9685

i2c_bus = busio.I2C(SCL, SDA)

pca = PCA9685(i2c_bus, address=80)

pca.frequency = 60

fanper = input("Percentage of fan: ")
fantime = input("Time on (s): ")

pca.channels[0].duty_cycle = int(int(fanper)*65535/100)
time.sleep(int(fantime))
pca.channels[0].duty_cycle = 0


