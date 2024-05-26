#!/usr/bin/env bash
################################################################################
#                        commbase-recorder-transmitter-b                       #
#                                                                              #
# A voice recorder and recording transmitter for Commbase.                     #
#                                                                              #
# Change History                                                               #
# 02/29/2024  Esteban Herrera Original code.                                   #
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

# reccomm.sh
# Records audio when specific key is pressed, using the arecord command. Sends
# the recorded audio file to a remote host using scp when a specific key is
# pressed again.
# Required packages:
# alsa-utils
# openssh-client
# openssh server

recording=false

RANDOM_DIR=$(mktemp -d /tmp/tmp.XXXXXX)
FILENAME="$RANDOM_DIR/recording.wav"

# Set up the following variables accordingly
REMOTE_HOST="commbase@127.0.0.1"
DEST_PATH="/home/commbase/Dev/commbase/bundles/commbase-stt-whisper-reactive-p/client_data/recording.wav"
AUDIO_CAPTURE_DEVICE="hw:CARD=Microphone,DEV=0"  # arecord -L
CARD_INDEX="0"  # cat /proc/asound/cards
DEVICE_INDEX="0"  # arecord -L
RECORDING_CHAR="c"
QUIT_CHAR="q"

device_file="/dev/snd/pcmC${CARD_INDEX}D${DEVICE_INDEX}c"

# Function to check if the device is busy
is_device_busy() {

  lsof "$device_file" > /dev/null 2>&1
  return $?  # When the device is busy: $? is 0.
}

# Ensures that the temporary directory created earlier is deleted when the
# script exits.
cleanup() {

  echo "Cleaning up..."
  rm -r "$RANDOM_DIR"
  exit 0
}

# Repeats a loop, awaiting the next key press to initiate or stop the recording
# and sends the file with scp.
reccomm() {

  while true; do
    # Pass $RECORDING_CHAR as an argument to printf.
    printf "Press '%s' to start/stop recording: \\n" "$RECORDING_CHAR"
    read -r -n 1 -s key
    if [ "$key" == $RECORDING_CHAR ]; then
      if [ "$recording" == false ]; then
        echo "Start recording..."
          while is_device_busy; do
            echo "Device is busy, waiting..."
            sleep 1
          done
        arecord -D "$AUDIO_CAPTURE_DEVICE" -f cd -t wav -d 10 -r 44100 -c 2 -V stereo -v "$FILENAME" &
        recording=true
      else
        echo ""
        echo "Stop recording..."
        kill -SIGINT $!
        recording=false
        echo "Sending recording to remote host..."
        scp "$FILENAME" "$REMOTE_HOST:$DEST_PATH"
        rm "$FILENAME"
        echo "Recording sent successfully."
      fi
    fi

    if [ "$key" == $QUIT_CHAR ]; then
      echo "Exiting..."
      exit
    fi
  done
}

main () {

trap cleanup EXIT

# Recording logic
reccomm
}

# Main call
(main || exit 99)
