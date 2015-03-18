#!/usr/bin/env python

import Adafruit_BBIO.UART as UART
#import rospy
import serial
import time


#UART.setup("UART0")  # RX=P9_26, TX=P9_24, port:/dev/tty01
ser = serial.Serial("/dev/ttyO1", 9600, timeout=1)



ser.close()
ser.open()
i = 0

while i < 1000:
    ser.write('vengo de la BBB')

    if ser.inWaiting() > 0:
        a = ser.read(100)
        print(a)

    time.sleep(0.1)
    i += 1
