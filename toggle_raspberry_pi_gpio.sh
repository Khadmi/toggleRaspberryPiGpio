#!/bin/bash
#source gpio
# This script is for Toggling Raspberry Pi GPIO2
# This will toggle GPIO2 infinitely
# 110 second GPIO2 ON(HIGH) ,10 second GPIO2 OFF(LOW)
#
# Author: Mashkur A Khadmi 
# M.Tech (Embedded System)

echo "Started GPIO Script"
echo "--------------------------"


#sudo echo "5" > /sys/class/gpio/export
#sudo echo "out" > /sys/class/gpio/gpio5/direction

if [ -d /home/pi/poweronlog ];
then
	echo "poweronlog Dir Found"
else
	mkdir /home/pi/poweronlog
fi


ls /sys/class/gpio/gpio2 > /dev/null

if [ $? -eq 0 ] ;
then
	echo "GPIO2 Already"
else
	#Selecting GPIO Pin 2
	sudo echo "2" > /sys/class/gpio/export
	sudo echo "out" > /sys/class/gpio/gpio2/direction
fi


echo "Writing to GPIO"

count=0
while true ;
do

	echo Test Count $count
	echo  $count  : `date`  >> /home/pi/poweronlog/log.txt
	#Writing high to GPIO2
	sudo echo "1" > /sys/class/gpio/gpio2/value
	#sudo echo "1" > /sys/class/gpio/gpio5/value
	sleep 110
	
	#Writing low to GPIO2
	sudo echo "0" > /sys/class/gpio/gpio2/value
	#sudo echo "0" > /sys/class/gpio/gpio5/value
	count=$(($count + 1))
	sleep 10
done

