#!/bin/bash
# File: desktop-shark-continuously-check-internet-connection.sh
# Description: Continuously checks for Internet and makes a beep sound when the Internet is available.
# This from the package sox:
# play -n synth 0.3 sine 800 vol 0.75
while :
do
pingtime=$(ping -w 1 8.8.8.8 | grep ttl)
sleep 0.5 # Allows Commbase to finish saying "yes ..."
if [ "$pingtime" = "" ] 
then 
   pingtimetwo=$(ping -w 1 www.google.com | grep ttl) 
   if [ "$pingtimetwo" = "" ] 
   then 
       clear ; echo 'Offline' #; echo 'Offline' | festival --tts
   else
       clear ; echo 'Online' ; echo 'Online' | festival --tts
   fi 
else
    clear ; echo 'Online' ; echo 'Online' | festival --tts ; play -n synth 0.3 sine 800 vol 0.25
fi
sleep 180
done
