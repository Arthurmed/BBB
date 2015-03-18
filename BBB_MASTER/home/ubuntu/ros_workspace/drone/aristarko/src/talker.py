#!/usr/bin/env python

import serial
import rospy
from std_msgs.msg import String

ser = serial.Serial('/dev/ttyO1', 9600, timeout=1)

def callback(data):
    print(data)

def talker():
    pub = rospy.Publisher('chatter', String, queue_size=10)
    rospy.Subscriber('from_listener', String, callback)  # suscriber to radio
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        #hello_str = "hello world %s" % rospy.get_time()
        #rospy.loginfo(hello_str)
        print('hello world')
        pub.publish('hello world')
        ser.write('hola_caracola\n')
        rate.sleep()


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
