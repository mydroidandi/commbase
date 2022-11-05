#!/bin/bash
# File: desktop-shark-check-internet-connection-one-time.sh
# Description: Checks for Internet and makes a beep sound if the Internet is available.
# This from the package sox:
# play -n synth 0.3 sine 800 vol 0.75
pingtime=$(ping -w 1 8.8.8.8 | grep ttl)
sleep 0.5 # Allows Commbase to finish saying "yes ..."
if [ "$pingtime" = "" ] 
then 
   pingtimetwo=$(ping -w 1 www.google.com | grep ttl) 
   if [ "$pingtimetwo" = "" ] 
   then 
       clear ; echo 'Internet Connection Status: Offline' ; echo 'Internet Connection Status: We are Offline' | festiva --tts
   else
       clear ; echo 'Internet Connection Status: Online' ; echo 'Internet Connection Status: Online' | festival --tts
   fi 
else
    clear ; echo 'Internet Connection Status: Online' ; echo 'Internet Connection Status: Online' | festival --tts #; play a beep sound here
fi
sleep 1
