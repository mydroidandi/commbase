#!/bin/bash 
# File: desktop-shark-countdown.sh
# Description: This is a fork from https://github.com/tomxue/countdown improved with an alarm
# with voice and sounds, also for Commbase

# Usage:
# Example 1:
# Countdown time to 90 minutes from now. The -m option indicates minutes.
# $ ./countdown.sh -m 90
# Example 2:
# Countdown time to a future date, such as March 23rd, 2036. The -d option indicates a date.
# $ ./countdown.sh -d "Mar 23 2036"
# Example 3:
# Countdown to a future time, such as 21:06.
# $ ./countdown.sh -d 21:06
# Example 4:
# You can also specify a future time right down to the exact seconds:
# $ ./countdown.sh -d 21:06:45
# Stop the alarm:
# Press CTRL + C two times to exit the program

# The Commbase directory:
# Due to the loss of the Commbase application scope here, it must be re-assigned
COMMBASE=$HOME/Developer
#COMMBASE=$HOME

if [ "$#" -lt "2" ] ; then 
	echo "Incorrect usage ! Example:" 
	echo './countdown.sh -d  "Jun 10 2011 16:06"' 
	echo 'or' 
	echo './countdown.sh -m  90' 
	exit 1 
fi 
 
now=`date +%s` 
 
if [ "$1" = "-d" ] ; then 
	until=`date -d "$2" +%s` 
	sec_rem=`expr $until - $now` 
	echo "-d" 
	if [ $sec_rem -lt 1 ]; then 
		echo "$2 is already history !" 
	fi 
fi 
 
if [ "$1" = "-m" ] ; then 
	until=`expr 60 \* $2` 
	until=`expr $until + $now` 
	sec_rem=`expr $until - $now` 
	echo "-m" 
	if [ $sec_rem -lt 1 ]; then 
		echo "$2 is already history !" 
	fi 
fi 
 
_R=0
_C=7
tmp=0
percent=0
total_time=0
col=`tput cols`
col=$[ $col -5 ]

while [ $sec_rem -gt 0 ]; do 
	clear 
	date 
	let sec_rem=$sec_rem-1 
	interval=$sec_rem 
	seconds=`expr $interval % 60` 
	interval=`expr $interval - $seconds` 
	minutes=`expr $interval % 3600 / 60` 
	interval=`expr $interval - $minutes` 
	hours=`expr $interval % 86400 / 3600` 
	interval=`expr $interval - $hours` 
	days=`expr $interval % 604800 / 86400` 
	interval=`expr $interval - $hours` 
	weeks=`expr $interval / 604800` 
	echo "----------------------------" 
	echo "Seconds: " $seconds 
	echo "Minutes: " $minutes 
	echo "Hours:   " $hours 
	echo "Days:    " $days 
	echo "Weeks:   " $weeks 

	echo -n "["

	progress=$[$progress + 1]
	if [ $total_time -lt 1 ] ; then
		total_time=$[$hours * 3600 + $minutes * 60 + $seconds]
	fi
	
	printf -v f "%$(echo $_R)s>" ; printf "%s\n" "${f// /=}"
	_C=7
	tput cup 7 $col

	tmp=$percent
	percent=$[$progress * 100 / $total_time]
	printf "]%d%%" $percent
	change=$[$percent - $tmp]

	_R=$[ $col * $percent / 100 ]

	sleep 1
done
printf "\n"
# Alarm Alternatives:
#aplay -q mixkit-game-notification-wave-alarm-987.wav
#echo "finished" | festival --tts
sleep 0.5; while true; do spd-say -w 'get back to work'; sleep 40; done
#sleep 0.5; while true; do spd-say -w 'get back to work' ; aplay -q $COMMBASE/Commbase/timers/custom-countdown/mixkit-game-notification-wave-alarm-987.wav; done
