#!/usr/bin/env python
import rospy
import serial
from time import sleep

from aristarko.msg import ins, ins_info
from std_msgs.msg import String

ser = serial.Serial("/dev/ttyO2", 9600, timeout=1)

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
    rospy.Subscriber("publico_ins", ins, callback_vn200)  # suscriber to vn200
    #rospy.Subscriber("publico_insInfo", ins_info, callback_vn200_info)  # suscriber to vn200

    while not rospy.is_shutdown():
        #leo datos del puerto si los hubiera. Ojo con los timeouts!
        pass
        sleep(1)

    # spin() simply keeps python from exiting until this node is stopped
    #rospy.spin()

if __name__ == '__main__':
    listener()
