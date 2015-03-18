
#include <sstream>
#include <stdio.h>
#include <unistd.h>

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "vectornav.h"

#include <aristarko/ins.h>
#include <aristarko/ins_info.h>


//GLOBALS
const char* const COM_PORT = "//dev//ttyO1";
const int BAUD_RATE = 115200;
unsigned const int NEWRATE = 10;

//PROTOTIPOS
void asyncDataListener(void* sender, VnDeviceCompositeData* data);

//PUBLICADORES
ros::Publisher ins_pub;  // TODO: poner gps, warnings y sensores?
ros::Publisher insInfo_pub;


// MENSAJES
aristarko::ins msg_ins;  //estructura de datos para publicar data
aristarko::ins_info msg_info;  // estructura de datos para publicar avisos



int main(int argc, char **argv)
{

  /***********************************************
  PARAMETROS DE CONFIGURACION DE ROS (scope global)
  ************************************************/

  // Handlers
  ros::init(argc, argv, "vn200");  // inicializo el nodo
  ros::NodeHandle n;  // handler para el ROS

  // Inicializo el publicador
  ins_pub = n.advertise<aristarko::ins>("publico_ins", 20);
  insInfo_pub = n.advertise<aristarko::ins_info>("publico_insInfo", 10);


  /********************************************
   PARAMETROS DE EL VN200. CONEXION CON IMU
  ********************************************/

  VN_ERROR_CODE errorCode;  // para gestion de errores
  Vn200 vn200;              // estructura VN200. importada de vn200.h

  // Conexion con el vn200
  errorCode = vn200_connect(&vn200, COM_PORT, BAUD_RATE);
  sleep(1);  // doy tiempo a conectar

  // gestiono posibles errores de conexion
  if (errorCode == VNERR_PERMISSION_DENIED)
    {
		printf(" No tienes permiso para abrir el puerto\n");
		return 0;
	}
  else if (errorCode != VNERR_NO_ERROR)
	{
		printf("Error encountered when trying to connect to the sensor.\n");

		return 0;
	}

  // Configuro la VN200 para que me de el registro de la INS
  //VNASYNC_VNINS = 22 -> importado de vn200.h
  errorCode = vn200_setAsynchronousDataOutputType(&vn200, VNASYNC_VNINS, true);
  sleep(1);
  //configuro el rate de salida de datos
  errorCode = vn200_setAsynchronousDataOutputFrequency(&vn200, NEWRATE, true);
  sleep(1);
  //configuro un listener, para que se genere un evento cuando haya un dato nuevo.
  //en vez de hacer polling se genera una interrupcion
  errorCode = vn200_registerAsyncDataReceivedListener(&vn200, &asyncDataListener);
  //TODO: Gestionar posibles errores

  ros::spin();


  errorCode = vn200_unregisterAsyncDataReceivedListener(&vn200, &asyncDataListener);
  errorCode = vn200_disconnect(&vn200);

	if(errorCode == VNERR_NO_ERROR)
	{
	    printf("Sensor VN200 disconnected\n");

	}

	else if (errorCode != VNERR_NO_ERROR)
	{
		printf("Error encountered when trying to disconnect from the sensor.\n");

		return 0;
	}



  return 0;
}

void asyncDataListener(void* sender, VnDeviceCompositeData* data)
{

  if (ins_pub.getNumSubscribers() > 0)  // solo publico si tengo almenos un suscriptor
  {
  // Roll picht yaw
  msg_ins.RPY.x = data->ypr.pitch;
  msg_ins.RPY.y = data->ypr.roll;
  msg_ins.RPY.z = data->ypr.yaw;

  //Latitude, Longitude, Altitude
  msg_ins.LLA.x = data->latitudeLongitudeAltitude.c0;
  msg_ins.LLA.y = data->latitudeLongitudeAltitude.c1;
  msg_ins.LLA.z = data->latitudeLongitudeAltitude.c2;

  //velocidad X, velocidad Y, velocidad Z
  msg_ins.Vel.x = data->velocity.c0;
  msg_ins.Vel.y = data->velocity.c1;
  msg_ins.Vel.z = data->velocity.c2;

  ins_pub.publish(msg_ins);
  }

  if (insInfo_pub.getNumSubscribers() > 0)
  {
    msg_info.GPSFIX = data->gpsFix;
    msg_info.INSTATUS = (data->insStatus & 0x3);
    msg_info.INSGPS = (data->insStatus & 0x8);
    insInfo_pub.publish(msg_info);
    /*
    - gpsFix = 0: No Fix
             = 1: Time Only
             = 2: 2D Fix
             = 3: 3D Fix

    - insStatus = 0: No tracking
                = 1: Degraded performance
                = 2: Performance with Spec

    - insGPSfix = 1: GPS Fixed
                = 0: GPS Not Fixed
    */
  }
}

