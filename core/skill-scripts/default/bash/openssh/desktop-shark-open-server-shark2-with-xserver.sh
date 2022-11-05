#!/bin/bash
# File: desktop-shark-open-server-shark2-with-xserver.sh
# Description: Script to open remote server applications with GUI through the network. It requires to
# forward X over SSH (OpenSSH installed). Once logged in the remote computer run an application
# for testing, for example $ xeyes, from the local computer with any X server, commonly,
# Xfree86, Xorg, or Wayland.
# Requires previously established SSH configuration in both, the client and the server.
# Requires 'rsync' already installed in both, server and client.

# The Commbase directory:
# Due to the loss of the Commbase application scope here, it must be re-assigned
COMMBASE=$HOME/Developer
#COMMBASE=$HOME

# Files to import:
source $COMMBASE/Commbase/.env

REMOTE_HOST_IP_ADDRESS=$SERVER_SHARK2_IP_ADDRESS

# This will get you the private IP address of your interfaces, plus assigned to a constant
MY_HOST_IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Connect to the remote host by IP address. SSH will prompt for the user login password in the remote
# machine. Once logged in use 'screen' to keep the terminal session accessible after the connection
# time is up.
if [ "$MY_HOST_IP_ADDRESS" == "$REMOTE_HOST_IP_ADDRESS" ]; then
  echo "Something but Spoofing! Not proceeding."
else
  echo "Connecting to the remote host: "$REMOTE_HOST_IP_ADDRESS". Otherwise, verify the remote IP address in your .env file."
  ssh -X $REMOTE_HOST_IP_ADDRESS
fi
