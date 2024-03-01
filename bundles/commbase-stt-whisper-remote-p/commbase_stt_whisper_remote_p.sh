#!/usr/bin/env bash
################################################################################
#                         commbase-stt-whisper-remote-p                        #
#                                                                              #
# An ASR (Automatic Speech Recognition) engine.                                #
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

# commbase-stt-whisper-remote-p.sh
# Records audio using the arecord command and sends the recorded audio file to a
# remote host using scp when a specific key ('c') is pressed.
# Requires the packages already installed:
# alsa-utils
# openssh-client
# openssh server
# Setup steps:
# 1. Have a copy of this file in the host that is going to work as remote for
# Commbase. You do not need the Commbase repo installation, unless you are
# installing Commbase and commbase-stt-whisper-remote-p.sh in a single computer.
# 2. Install the script as executable:
# cd /usr/bin
# sudo ln -s /path/to/commbase-stt-whisper-remote-p.sh ./commbase-remote
# 3. Set the value of the variable REMOTE_HOST to the host that runs Commbase or
# Commbase client. If installing in the localhost, use the localhost IP address:
# REMOTE_HOST="commbase@127.0.0.1"
# 4. Set the value of the variable DEST_PATH. Its value should be the path to
# send FILENAME="recording.wav" to in the host that is going to work as Commbase
# or Commbase client.
# 5. Set the audio capture variable, for example:
# AUDIO_CAPTURE_DEVICE="hw:CARD=Microphone,DEV=0"
# To find out the audio capture, list the available audio capture (recording)
# devices and their corresponding configurations with the next command:
# arecord -L
# Then select the input device parameter based on the output, for example:
# hw:CARD=Device_0,DEV=0
#     USB Audio Device, USB Audio
#     Direct hardware device without any conversions
#     ...
# Hw:CARD=Device_1,DEV=0
#     USB Audio Device, USB Audio 1
#     Direct hardware device without any conversions
#     ...
# 6. Setup the SSH connection from the ssh client (the host that is going to
# work as a remote for Commbase) to the ssh server host (the host that is going
# to work as Commbase or Commbase client).
# ssh 127.0.0.1
# 7. To avoid entering the password every time scp is executed, you can use SSH
# keys for authentication. Here's how you can set it up:
# 7.1. Generate SSH Key Pair (if not already done).
# Run the following command on the machine where the script is running:
# ssh-keygen -t rsa
# Press Enter for each prompt to use the default values (empty passphrase).
# 7.2. Copy Public Key to Remote Host.
# Copy the public key to the remote host by running:
# ssh-copy-id commbase@127.0.0.1
# If ssh-copy-id is not available on your system, you can manually copy the
# contents of the public key (~/.ssh/id_rsa.pub) to the remote host's
# ~/.ssh/authorized_keys file.
# 7.3. Ensure Proper Permissions on Remote Host.
# Make sure the ~/.ssh directory on the remote host has the correct permissions:
# chmod 700 ~/.ssh
# chmod 600 ~/.ssh/authorized_keys
# Now, when your script uses scp, it should not prompt for a password.
# 7.4. Additionally, you may want to check the following:
# Ensure that the user running the script has the correct permissions to read
# the private key file (typically ~/.ssh/id_rsa).
# Verify that the script is executed by the same user who owns the SSH key pair.
# By setting up SSH key authentication, you should be able to perform
# passwordless scp transfers.

RECORDING=false
FILENAME="recording.wav"

# Set up the next variables accordingly
REMOTE_HOST="commbase@127.0.0.1"
DEST_PATH="/home/commbase/Dev/mydroidandi/commbase/bundles/commbase-stt-whisper-remote-p/client_data/recording.wav"
AUDIO_CAPTURE_DEVICE="hw:CARD=Microphone,DEV=0"

while true; do
    read -r -n 1 -s key
    if [ "$key" == "c" ]; then
        if [ "$RECORDING" == false ]; then
            echo "Start recording..."
            arecord -D "$AUDIO_CAPTURE_DEVICE" -f cd -t wav -d 10 -r 44100 -c 2 -V stereo -v "$FILENAME" &
            RECORDING=true
        else
            echo "Stop recording..."
            kill -SIGINT $!
            RECORDING=false
            echo "Sending recording to remote host..."
            scp "$FILENAME" "$REMOTE_HOST:$DEST_PATH"
            rm "$FILENAME"
            echo "Recording sent successfully."
        fi
    fi
done
