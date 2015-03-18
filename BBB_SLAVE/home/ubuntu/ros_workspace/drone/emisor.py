#!/usr/bin/env python

import rospy
from std_msgs.msg import String
import time

#defino publicador
pub = rospy.Publisher('talker', String, queue_size = 10)

def emite():

    while not rospy.is_shutdown():
        h = 'hello world %s' % rospy.get_time()
        pub.publish(h)
        time.sleep(0.1)

if __name__ == '__main__':
    try:
        #inicio node
        rospy.init_node('emisor')
        emite()


    except rospy.ROSInterruptException:
        print('error')
