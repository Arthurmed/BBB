#!/usr/bin/env python
import rospy
from std_msgs.msg import String
import time

radio = rospy.Publisher("process_data", String, queue_size=20)  # publisher to radio
pub = rospy.Publisher("from_listener", String, queue_size=10)

def datatohex(data):
    pass

def callback(data):

    #radio.publish(','.join(map(str, [data.RPY.z, data.RPY.y, data.RPY.x])))
    print(data)

def listener():


    rospy.init_node('listener', anonymous=True)  # run the node.
    rospy.Subscriber("chatter", String, callback)  # suscriber to radio


    while not rospy.is_shutdown():

        pub.publish("data from listener")
        print('publico data')
        time.sleep(0.1)

    # spin() simply keeps python from exiting until this node is stopped
    #rospy.spin()

if __name__ == '__main__':
    listener()
