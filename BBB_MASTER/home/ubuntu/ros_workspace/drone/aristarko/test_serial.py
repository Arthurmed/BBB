import serial
import time

s1 = serial.Serial('/dev/ttyO1',9600, timeout = 0.1)


while 1:
    s1.write('This is UART1!\n')
    time.sleep(0.1)
