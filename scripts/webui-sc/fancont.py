#!/usr/bin/python3

from board import SCL, SDA
import busio

from adafruit_pca9685 import PCA9685

import configparser

config = configparser.ConfigParser()
config.read('eve-conf.ini')

import sys

try:
    fanper = float(sys.argv[3])
except ValueError:
    sys.exit("Please type a number.")

fanper=abs(fanper)
totsys = (''.join(config.sections())).count('CU')

pwmgs = list()
pwmg_add = list()

for sysitr in range(totsys):
    sysnum = sysitr + 1
    confsec = 'CU' + str(sysnum)
    if config[confsec].getboolean('enabled'):
        if not config[confsec].getboolean('Pi_pins'):
            pwmg_add.append(config[confsec].getint('pwm_address'))

pwmg_add = list(set(pwmg_add))

i2c = busio.I2C(SCL, SDA)

if pwmg_add:
    for add in pwmg_add:
        pwmgs.append(PCA9685(i2c, address=add))
        pwmgs[-1].frequency = config['MAIN'].getint('pwm_freq')


def runner(sysnum,pwmgs,pwmg_add,ptog,fanper,config):
    confsec = 'CU' + str(sysnum)
    fan_pin = config[confsec].getint('p_fan_pins')

    pwmg = pwmgs[pwmg_add.index(config[confsec].getint('pwm_address'))]

    if ptog == 'On':
        pwmg.channels[fan_pin].duty_cycle = int(int(fanper)*65535/100)
    else:
        pwmg.channels[fan_pin].duty_cycle = 0
    
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

ptog = sys.argv[2]
print(f'Turning {ptog}')

for sys in evesys: runner(sys,pwmgs,pwmg_add,ptog,fanper,config)

