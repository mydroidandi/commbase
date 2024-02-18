################################################################################
#                                   Commbase                                   #
#                                                                              #
# AI Powered Conversational Assistant for Computers and Droids                 #
#                                                                              #
# Change History                                                               #
# 02/17/2024  Esteban Herrera Original code.                                   #
#                           Add new history entries as needed.                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (c) 2022-present Esteban Herrera C.                               #
#  stv.herrera@gmail.com                                                       #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 3 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #

# timer.sh
# Serves as a countdown timer with options for setting the timer based on
# minutes or a specific date and time. The script utilizes the date command to
# calculate the remaining time in seconds and then displays the countdown in
# terms of seconds, minutes, hours, days, and weeks using the figlet command for
# a visually appealing output.
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
# Press Ctrl-c two times to exit the program

if [ "$#" -lt "2" ] ; then
  echo "Incorrect usage ! Example:"
  echo './countdown.sh -d  "Jun 10 2011 16:06"'
  echo 'or'
  echo './countdown.sh -m  90'
  exit 1
fi

now=$(date +%s)

if [ "$1" = "-d" ] ; then
  until=$(date -d "$2" +%s)
  sec_rem=$((until - now))
  echo "-d"
  if [ $sec_rem -lt 1 ]; then
    echo "$2 is already history !"
  fi
fi

if [ "$1" = "-m" ] ; then
  until=$((60 * $2))
  until=$((until + now))
  sec_rem=$((until - now))
  echo "-m"
  if [ $sec_rem -lt 1 ]; then
    echo "$2 is already history !"
  fi
fi

_R=0
_C=7
col=$(tput cols)
col=$((col - 5))

while [ $sec_rem -gt 0 ]; do
  clear
  date
  let sec_rem=$sec_rem-1
  interval=$sec_rem
  seconds=$(expr $interval % 60)
  interval=$(expr $interval - $seconds)
  minutes=$(expr $interval % 3600 / 60)
  interval=$(expr $interval - $minutes)
  hours=$(expr $interval % 86400 / 3600)
  interval=$(expr $interval - $hours)
  days=$(expr $interval % 604800 / 86400)
  interval=$(expr $interval - $hours)
  weeks=$(expr $interval / 604800)
  echo "-------------------------------"

  # Display countdown values using figlet
  figlet "Seconds: $seconds"
  figlet "Minutes: $minutes"
  figlet "Hours:   $hours"
  figlet "Days:    $days"
  figlet "Weeks:   $weeks"

  echo "Press Ctrl-c to stop the alarm"

  sleep 1
done

#printf "\n"

# Print countdown using figlet
#figlet "Time's Up!"

# Choose or program your alarm alternative here ...

# Say finished using festival tts and finish the program
#echo "finished" | festival --tts

# Say "get back to work" using spd-say and play a sound every 1/2 second until
# the user stops the program.
#sleep 0.5; while true; do spd-say -w 'get back to work' ; aplay -q $COMMBASE_APP_DIR/bundles/built-in/broker/libcommbase/resources/bundles/sounds/mixkit-unlock-game-notification-253.wav; done

# Say "get back to work" using spd-say and play a sound every 40 seconds until
# the user stops the program.
#sleep 0.5; while true; do spd-say -w 'get back to work'; sleep 40; done

# Match the countdown time and the sleep time to sound the alarm every end of
# the time period. So, the user can leave the timer working without stopping it,
# making it work similarly to "The Pomodoro Technique". For example, for a timer
# of 25 minutes:
# 25 minutes × 60 seconds/minute = 1500 seconds
# When using this alternative, remember to comment out the next line of code
# like this:
# figlet "Time's Up!"
#sleep 0.5; while true; do spd-say -w "twenty five minutes more have passed"; sleep 1500; done

# Custom alarm
source $COMMBASE_APP_DIR/config/commbase.conf
tts_engine="$TTS_ENGINE_STRING"
sleep 0.5; while true; do echo "twenty five minutes more have passed" | $tts_engine; sleep 1500; done
