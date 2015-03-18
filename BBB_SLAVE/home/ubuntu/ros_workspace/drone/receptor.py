#!/usr/bin/env python

import rospy
from std_msgs.msg import String
import Queue
import os
import random
from threading import Thread

import time
import socket

#defino el nodo.
rospy.init_node('receptor', anonymous=True)
#defino una cola
Q = Queue.Queue()

def sender(q):
    while True:
        data = q.get()
        print data
        #probar sockets


def callback(data):
    a = data
    #rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    Q.put(a)

def callback2(data):

    #rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    Q.put(data)


#threads
worker = Thread(target=sender, args=(Q,))
worker.setDaemon(True)
worker.start()

#suscribers
rospy.Subscriber("talker", String, callback)
rospy.Subscriber("talker2", String, callback2)

#lanzo nodos
#os.popen("python /home/ubuntu/ros_workspace/drone/emisor.py")
#time.sleep(5)
#os.popen("python /home/ubuntu/ros_workspace/drone/emisor2.py")

rospy.spin()
