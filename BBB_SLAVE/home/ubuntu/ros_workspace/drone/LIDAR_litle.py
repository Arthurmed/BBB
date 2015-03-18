#!/usr/bin/env python

import rospy
import smbus
import time
import struct
from Adafruit_I2C import Adafruit_I2C

#print 'define bus'
#bus = Adafruit_I2C(0x62, 2, debug = True)  # direccion 0x62, bus 2
#print'bus definido'

#print 'define bus'
bus_number = 2  # modificar esto para que lo haga automatico
bus = smbus.SMBus(bus_number)  #I2C number 2
#print'bus definido'
time.sleep(1)

Address           = 0x62            # Default I2C Address of LIDAR-Lite.
RegisterMeasure   = 0x00            # Register to write to initiate ranging.
MeasureValue      = 0x04            # Value to initiate ranging.
RegisterHighLowB  = 0x8F            # Register to get both High and Low bytes in 1 call.
data = 100

err = ''

while not rospy.is_shutdown():
    #hago peticion de dato
    while True:
        try:
            #bus.write8(0x00, 0x04)
            bus.write_byte_data(0x62, 0x00, 0x04) # Write 0x04 to 0x00
            time.sleep(0.01)  # doy tiempo a que el dispositivo haga la medida
            print('he escrito')
            break
        except err:
            print err

    #leo dato

    while True:
        try:
            #time.sleep(3)
            #data = bus.readU16(0x8F)
            #data = bus.readList(0xf0, 2)
            data = bus.read_word_data(0x62, 0x8f)
            print data
            #print struct.unpack('>h', struct.pack('<H', data))[0] / 256.0
            break
        except:
            print('no tengo dato')
            time.sleep(0.001)

    time.sleep(0.1)

