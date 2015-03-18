#!/usr/bin/env python
import rospy
from aristarko.msg import ins
from std_msgs.msg import String


radio = rospy.Publisher("process_data", String, queue_size=20)  # publisher to radio

def datatohex(data):
    pass

def callback(data):

    radio.publish(','.join(map(str, [data.RPY.z, data.RPY.y, data.RPY.x])))

def listener():


    rospy.init_node('listener', anonymous=True)  # run the node.
    rospy.Subscriber("publico_ins", ins, callback)  # suscriber to vn200
    rospy.Subscriber("publico_radio", String, callback_radio)  # suscriber to radio


    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
