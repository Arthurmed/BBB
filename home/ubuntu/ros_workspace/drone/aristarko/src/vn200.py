#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import serial
import os
import time, datetime
#import Adafruit_BBIO.GPIO as GPIO
from std_msgs.msg import String

from os.path import join
#todavia no activo los mensajes
#from gazebo_sabalo.msg import vn_200_ins, vn_200_imu, vn_200_gps
#from gazebo_sabalo.srv import imu

"""
SENSOR: VN-200
TRAMA DE DATOS: PROPIETARIA
EJEMPLO:

$VNINS,63,333811.902862,1694,0004,+009.500,-004.754,-000.225,+32.95602815,
- 096.71424297,+00171.195,-000.840,-000.396,-000.109,07.8,01.6,0.23*5F

DONDE:
$: Inicio de la trama
VNRRG:  Lectura del registro
63:  Identificacion del registro
333811.902862- Segundos de la semana en GPS
1694- GPS week# 0004- Controla el estado del GPS
+009.500- Heading/Yaw en grados. Float 32
-004.754  Pitch en grados. Float 32
-000.225- Roll en grados. Float 32
+32.956- Latitud en grados. Double 64
-096.71424297- Longitud den grados. Double 64
+0017.195- Altitud en m. Float 32.
+xxxxxxx- Velocidad GPS. Float 32.

El programa está preparado para poder recibir tres tipos de tramas desde el VN200, las
de tipo VNINS, VNIMU y VNGPS, así como para enviar al vn200 la trama de selección.
No se va a utilizar y por defecto utilziaremos únicamente las tramas VNINS
"""

####### GLOBAL VARIABLES #####

"""defino variables"""
IMU_LENGTH = 12
INS_LENGTH = 16
GPS_LENGTH = 16

""" definimos los publicadores """
#imu_pub = rospy.Publisher("publico_imu", vn_200_imu)
ins_pub = rospy.Publisher("publico_ins", String, queue_size=10)
#gps_pub = rospy.Publisher("publico_gps", vn_200_gps)

""" define el puerto de lectura"""

ser = serial.Serial()
ser.baudrate = 115200
ser.bytesize = serial.EIGHTBITS      # number of bits per bytes
ser.parity = serial.PARITY_NONE      # set parity check: no parity
ser.stopbits = serial.STOPBITS_ONE  # number of stop bits
ser.timeout = 1                     # non-block read
ser.xonxoff = False                 # disable software flow control
ser.rtscts = False                 # disable hardware (RTS/CTS) flow control
ser.dsrdtr = False                   # disable hardware (DSR/DTR) flow control
ser.writeTimeout = 2                 # timeout for write

""" configuracion del puerto """

ser.port = '/dev/ttyO1'
sudoPassword = 'temppwd'
command = 'chmod 666 ' + ser.port
os.system('echo %s|sudo -S %s' % (sudoPassword, command))

# External interruption
#GPIO.setmode(GPIO.BCM)
#GPIO.setup("GPIO0_26", GPIO.IN, pull_up_down=GPIO.PUD_DOWN)  # Pin P9_11 como entrada

###### HELPERS FUNCTIONS #######

def tiempo():

    d = datetime.datetime.now()
    hour = getattr(d, 'hour')
    minute = getattr(d, 'minute')
    second = getattr(d, 'second') + round(getattr(d, 'microsecond') / 1e6, 3)
    return (str(hour) + ':' + str(minute) + ':' + str(second) + ',')


def read_data():

    """
    Esta funion se encarga de leer el puerto para estraer una trama de datos
    Esta forma de hacerlo es lenta, accede a puerto byte a bye. Hay que cambiarlo!!
    """
    #data = "$"

    #while not rospy.is_shutdown():
    #    c = ser.read(1)  # leo un caracter del buffer
    #    if c == '$':  # busco el comienzo de la trama
    #        break

    data = ser.readline()
    #while not rospy.is_shutdown():
    #    c = ser.read(1)
    #    if c == '\n':  # he llegado al final de la trama
    #        break
    #    elif c == '\x00':  # no llegan datos?
    #        continue
    #    data += c

    #print " Data from read data VN200 ", data
    #time.sleep(0.1)
    #ser.flushInput()  # limpio el buffer para que la trama siguiente sea lo mas reciente posible
    return data


def cmd(string):

    """ esta funcion se encarga de coger un string del VN-200
    y convertirla en formato legible para poder escribir sobre el sensor.
    Entra un string del tipo VNWRG,5,9600 y se le suma el $, el cmd y el
    salto de linea
    """
    xor = 0

    for char in string.upper():
        xor ^= ord(char)
    return '$' + string + '*' + hex(xor & 0xFF)[2:4].upper() + '\n'


def comprueba_checksum(trama):

    """ Esta funcion se encarga de comprobar el cheksum que viene de
    el sensor
    """

    try:
        data = trama.split('*')  # separo datos del checksum
        checksum_recibido = data[1].strip()
        #me quedo con el checksum y quito espacios
        data_to_checksum = data[0]  # me quedo con el cuerpo
        checksum = 0
        for c in data_to_checksum[1:].upper():
            checksum ^= ord(c)
        return (hex(checksum & 0xFF)[2:4].upper()) == checksum_recibido.upper()
    except IndexError:  # la trama a evaluar no tiene campo de checksum
        #print('NO HAY CAMPO DE CHECKSUM')
        return False


# def publish_ins_data(ins_data):
#     """
#     funcion que hace el parsing de los datos y chekea posibles errores.
#     Al final publica los datos en el mensaje apropiado
#     """
#     global ins_pub
#
#     ins_msg = vn_200_ins()  # instancia del mensaje
#     ins_msg.error_imu = False  # inicializamos error a falso
#     ins_msg.error_gps = False  # inicializamos error a falso
#     ins_msg.error_mag = False  # inicializamos error a falso
#     ins_msg.mode = 'INS'
#     """
#     evaluacion de errores
#     """
#
#     ins_status = int(ins_data[3], 16) & 0xFFFF  # Nos aseguramos q hay 16 bits
#     ins_mode = ins_status & 0x0003
#     ins_gps_fix = ins_status & 0x0004
#     ins_error = ins_status & 0x0078
#
#     if ins_mode == 0:
#         ins_msg.error_gps = True
#         #rospy.logwarn("Not traking. Insuficient dynamic motion")
#         #ins_msg.error += '1'
#     elif ins_mode == 1:
#         pass
#         #rospy.logwarn("INS: Sufficient dynamic motion, but solution was not within performence specs.")
#         #ins_msg.error += '2'
#     if ins_gps_fix != 4:
#         ins_msg.error_gps = True
#         #rospy.logwarn("INS: No GPS fix")
#         #ins_msg.error += '3'
#
#     if ins_error & 0x0001:
#         ins_msg.error_imu = True
#         #rospy.logwarn("INS: Time Error. IMU filter loop has taken more than 5 ms")
#         #ins_msg.error += '4'
#     if ins_error & 0x0002:
#         ins_msg.error_imu = True
#         #rospy.logwarn("INS: IMU Error. IMU communication error detected")
#         #ins_msg.error_string += '5'
#     if ins_error & 0x0004:
#         ins_msg.error_mag = True
#         #rospy.logwarn("IMU: Magnetometer or Pressure sensor error detected")
#         #ins_msg.error_string += '6'
#     if ins_error & 0x0008:
#         ins_msg.error_gps = True
#         #rospy.logwarn("IMU: GPS communication error detected")
#         #ins_msg.error_string += "GPS communication error detected\n"
#
#     #parsing
#     ins_msg.orientacion_euler.yaw = float(ins_data[4])  # yaw
#     ins_msg.orientacion_euler.pitch = float(ins_data[5])  # pitch
#     ins_msg.orientacion_euler.roll = float(ins_data[6])  # roll
#
#     ins_msg.latitude = float(ins_data[7])  # latitud
#     ins_msg.longitude = float(ins_data[8])  # longitud
#     ins_msg.altitude = float(ins_data[9])  # altitud
#
#     ins_msg.velocities.x = float(ins_data[10])  # velocity X
#     ins_msg.velocities.y = float(ins_data[11])  # velocity Y
#     ins_msg.velocities.z = float(ins_data[12])  # velocity Z
#
#     ins_msg.error_altitude = float(ins_data[13])
#     ins_msg.error_position = float(ins_data[14])
#     ins_msg.error_velocity = float(ins_data[15])
#
#     ins_pub.publish(ins_msg)
#     #rospy.loginfo(ins_msg)
#
#     #log_imu = open("/home/sabalo01/ros_workspace/gazebo_sabalo/logs/log_vn200.txt", 'a')
#     #datos = ','. join(map(str, (ins_msg.latitude, ins_msg.longitude, ins_msg.altitude, ins_msg.orientacion_euler.yaw,
#     #    ins_msg.orientacion_euler.pitch, ins_msg.orientacion_euler.roll, ins_msg.velocities.x, ins_msg.velocities.y, ins_msg.velocities.z)))
#     #log_imu.write(tiempo() + datos + '\n')


# def publish_imu_data(imu_data):
#
#     global imu_pub
#
#     imu_msg = vn_200_imu()  # estancia del mensaje imu
#     imu_msg.mode = 'IMU'
#
#     imu_msg.compass.x = float(imu_data[1])
#     imu_msg.compass.y = float(imu_data[2])
#     imu_msg.compass.z = float(imu_data[3])
#
#     imu_msg.accelerometer.x = float(imu_data[4])
#     imu_msg.accelerometer.y = float(imu_data[5])
#     imu_msg.accelerometer.z = float(imu_data[6])
#
#     imu_msg.gyro.x = float(imu_data[7])
#     imu_msg.gyro.y = float(imu_data[8])
#     imu_msg.gyro.z = float(imu_data[9])
#
#     imu_pub.publish(imu_msg)
#     rospy.loginfo(imu_msg)
#
#
# def publish_gps_data(gps_data):
#
#     global gps_pub
#
#     gps_msg = vn_200_gps()
#     gps_msg.error = '0'
#     gps_msg.error_present = False
#     gps_msg.mode = 'GPS'
#
#     gps_fix = int(gps_data[3])
#
#     if gps_fix == 0:
#         rospy.logwarn("GPS: No GPS fix")
#         gps_msg.error_present = True
#         gps_msg.error += '1'
#     elif gps_fix == 1:
#         gps_msg.error_present = True
#         rospy.logwarn("GPS: Time only in GPS soln")
#         gps_msg.error += '2'
#     elif gps_fix == 2:
#         rospy.logwarn("GPS: 2D fix. Horizontal position might be impacted.")
#
#     gps_msg.num_satellites = int(gps_data[4])
#
#     if gps_msg.num_satellites < 3:
#         gps_msg.error_present = True
#         rospy.logwarn(
#             "GPS: Solution is has connection to less than 3 satellites. \
#             Please move to an open area")
#         gps_msg.error += '3'
#
#     gps_msg.latitude = float(gps_data[5])
#     gps_msg.longitude = float(gps_data[6])
#     gps_msg.altitude = float(gps_data[7])
#
#     gps_msg.velocities.x = float(gps_data[8])
#     gps_msg.velocities.y = float(gps_data[9])
#     gps_msg.velocities.z = float(gps_data[10])
#
#     gps_msg.acceleration.x = float(gps_data[11])
#     gps_msg.acceleration.y = float(gps_data[12])
#     gps_msg.acceleration.z = float(gps_data[13])
#
#     gps_msg.speed_accuracy_estimate = float(gps_data[14])
#
#     gps_pub.publish(gps_msg)
#     rospy.loginfo(gps_msg)


def remove_checksum(trama):

    return trama.split('*')[0]


def obtain_fields(trama):

    return trama.split(',')


# def process_and_publish(trama):
#     """
#     funcion que decide el tipo de trama, y
#     llama a los distintos publicadores segun la trama
#     que estemos recibiendo
#     """
#     global GPS_LENGTH
#     global INS_LENGTH
#     global IMU_LENGTH
#
#     if trama[1:6] == "VNINS":  # la trama es del INS
#         ins_data = obtain_fields(remove_checksum(trama))
#
#         if len(ins_data) is not INS_LENGTH:  # estan todos los datos?
#             #rospy.logwarn("ERROR leyendo mensaje INS")
#             return
#         publish_ins_data(ins_data)
#
#     elif trama[1:6] == "VNIMU":  # la trama es del IMU
#         imu_data = obtain_fields(remove_checksum(trama))
#
#         if len(imu_data) is not IMU_LENGTH:
#             #rospy.logwarn("ERROR leyendo mensaje IMU")
#             return
#         publish_imu_data(imu_data)
#
#     elif trama[1:6] == "VNGPS":  # la trama es del GPS
#         gps_data = obtain_fields(remove_checksum(trama))
#
#         if len(gps_data) is not GPS_LENGTH:
#             #rospy.logwarn("ERROR leyendo mensaje GPS")
#             return
#         publish_gps_data(gps_data)
#
#     else:
#         #rospy.logwarn("Mensaje desconocido: " + str(trama) + '\n')
#         pass

####### HANDLERS FUNCTIONS ##########


# def handle_servicio(req):
#     """
#     Funcion que se encarga de escribir en el IMU para satisfacer un servicio
#     """
#     ser.write(req.comando + '\n')
#     imu.contesta = 'te oigo'
#     return imu.contesta


def vn200():
    """
    Defino el comportamiento del vn200

    """

    rospy.init_node('sensor_inercial')  # inicializo el nodo

    ser.close()  # only in case
    ser.open()  # abro el puerto
    ser.flushInput()  #vacio el buffer

    #configuro el VN-200
    ser.write(cmd("VNWRG,05,115200"))  # baudrate to 115200
    ser.write(cmd("VNWRG,07,10"))  # pongo la salida de datos a 10 Hz
    ser.write(cmd("VNWRG,06,22"))  # apago la salida asyncrona

    #defino el servicio
    #rospy.Service('servicio_inercial', imu, handle_servicio)

    #rate = rospy.Rate(10)		# 10Hz	Indica la frecuencia con la que publica (8 test!!)
    while not rospy.is_shutdown():

        print 'hola'
        time.sleep(0.01)
        #GPIO.wait_for_edge("GPIO0_26", GPIO.RISING)
        print 'adios'
        trama = read_data()  # leo datos desde el puerto serie
        print(trama)
        ins_pub.publish(trama)
        #print "Datos serie VN200 ", trama
        #if comprueba_checksum(trama):

        #    try:
        #        process_and_publish(trama)

        #    except:
                #rospy.logwarn("eliminando trama %s por incoherencia en datos", trama)
        #        pass
        #else:
        #    pass
            #rospy.logwarn("Checksum incorrecto para %s. Trama eliminada", trama)

        #time.sleep(0.01)
        
    #rospy.spin()


if __name__ == '__main__':
    try:

        vn200()
    except rospy.ROSInterruptException:
        pass
