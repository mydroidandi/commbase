#!/usr/bin/env sh
################################################################################
#                        commbase-recorder-transmitter-s                       #
#                                                                              #
# A reactive version of STT ASR (Automatic Speech Recognition) engine.         #
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

# recccom.sh
# Records audio when specific key is pressed, using the arecord command. Sends
# the recorded audio file to a remote host using scp when a specific key is
# pressed again.
# Required packages:
# alsa-utils
# openssh-client
# openssh server

RECORDING=false
RANDOM_DIR=$(mktemp -d /tmp/tmp.XXXXXX)
FILENAME="$RANDOM_DIR/recording.wav"

# Set up the following variables accordingly
REMOTE_HOST="commbase@127.0.0.1"
DEST_PATH="/home/commbase/Dev/mydroidandi/commbase/bundles/commbase-stt-whisper-reactive-p/client_data/recording.wav"
AUDIO_CAPTURE_DEVICE="hw:CARD=Microphone,DEV=0"
CHAR="c"

# Ensures that the temporary directory created earlier is deleted when the
# script exits.
cleanup() {
    echo "Cleaning up..."
    rm -r "$RANDOM_DIR"
    exit 0
}

trap cleanup EXIT

# Repeat a loop, awaiting the next key press to initiate or stop the recording
# and send the file with scp.
while true; do
    # Pass $CHAR as an argument to printf.
    printf "Press '%s' to start/stop recording: " "$CHAR"

    # Set terminal to single character mode
    stty -icanon min 1 time 0

    key=$(dd bs=1 count=1 2>/dev/null)

    # Reset terminal to normal mode
    stty sane

    if [ "$key" = "$CHAR" ]; then
        if [ "$RECORDING" = false ]; then
            echo "Start recording..."
            arecord -D "$AUDIO_CAPTURE_DEVICE" -f cd -t wav -d 10 -r 44100 -c 2 -V stereo -v "$FILENAME" &
            RECORDING=true
        else
            echo "Stop recording..."
            kill -INT $!
            wait $!  # Wait for the background process to finish
            RECORDING=false
            echo "Sending recording to remote host..."
            scp "$FILENAME" "$REMOTE_HOST:$DEST_PATH"
            rm "$FILENAME"
            echo "Recording sent successfully."
        fi
    fi
done
