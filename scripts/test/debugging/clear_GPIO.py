import RPi.GPIO as GPIO

# Setup the GPIO Pins to Control the Pumps
P_drug_pins = [20]
P_nut_pins = [24]
P_waste_pins = [25]
P_LED_pins = [21]
P_fan_pins = [26]
pin_list = [P_drug_pins + P_nut_pins + P_waste_pins + P_LED_pins + P_fan_pins]
GPIO.setmode(GPIO.BCM)
for pin in pin_list:
    GPIO.setup(pin, GPIO.OUT)
    GPIO.output(pin,0)


GPIO.cleanup()
