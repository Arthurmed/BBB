#!/usr/bin/env python
import rospy
import serial
from time import sleep
from aristarko.msg import ins, ins_info
from std_msgs.msg import String

"""
este nodo se encarga de:
1)Suscribirse a los publicadores necesarios para enviar la info a través de la radio.
2)Dar servicios a los mensajes desde la radio
3)Codificar/encriptar la informacion

whata bout to make a class??

"""




ser = serial.Serial("/dev/ttyO1", 57600, timeout=1)

radio = rospy.Publisher("publico_radio", String, queue_size=20)  # publisher to radio

def datatohex(data):
    pass

def callback_vn200(data):
    #print(data)
    #radio.publish(','.join(map(str, [data.RPY.z, data.RPY.y, data.RPY.x])))
    ser.write(','.join(map(str, [data.RPY.z, data.RPY.y, data.RPY.x])) + '\n')

def callback_vn200_info(data):
    print data

def listener():

    rospy.init_node('radio', anonymous=True)  # run the node.
    #rospy.Subscriber("publico_insInfo", ins_info, callback_vn200_info)  # suscriber to vn200

    while not rospy.is_shutdown():
        if ser.inWaiting()>0:
            a = ser.read(50)
            print(a)
        #leo datos del puerto si los hubiera. Ojo con los timeouts!
        ser.write('Esto es una prueba del copon bendito, matre mia que cansado estoy ya juevs por la tarde\n')
        sleep(0.1)

    # spin() simply keeps python from exiting until this node is stopped
    #rospy.spin()

if __name__ == '__main__':
    listener()
