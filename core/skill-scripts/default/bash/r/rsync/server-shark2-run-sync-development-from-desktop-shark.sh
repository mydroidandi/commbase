#!/bin/bash
# File: server-shark2-run-sync-development-from-desktop-shark.sh
# Description: Script that executed from the development server, synchronizes one time the directory
# ~/Developer in the developer's computer to the server.
# Requires previously established SSH configuration in both, the client and the server.
# Requires 'rsync' already installed in both, server and client.
# Requires a 'Developer' directory with the developer remote user created and set up in the server. 

# To create the directory in the server:
# $ sudo mkdir ~/Developer
# $ sudo chown $USER ~/Developer
# $ sudo chgrp $USER ~/Developer
# $ sudo chmod 755 ~/Developer
# $ ls -hal $HOME

# The configuration file.
source $COMMBASE/commbase/config/commbase.conf

# In this case, use the remote IP address is the one named as the local host
# in commbase.conf
REMOTE_HOST_IP_ADDRESS=$HOST_IP_ADDRESS

# This will get you the private IP address of your interfaces, plus assigned to a constant
MY_HOST_IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Helps to make sure that the script is executed from the server:
MY_HOST_NAME=$(hostname | awk '{print $1}')

REMOTE_USER=$REMOTE_USER_NAME

# Connect to the remote host by IP address. SSH will prompt for the user login password in the remote
# machine. Once logged in use 'screen' to keep the terminal session accessible after the connection
# time is up.
if [ "$MY_HOST_IP_ADDRESS" == "$REMOTE_HOST_IP_ADDRESS" ]; then
  echo "Something but Spoofing! Not proceeding."
elif [ "$MY_HOST_NAME" == "$SERVER_HOST_001_HOSTNAME" ]; then
  echo "Connecting and Syncing from the remote host: "$REMOTE_HOST_IP_ADDRESS". Otherwise, verify the remote IP address in your .env file."
  rsync -a --delete --quiet -e ssh $REMOTE_USER@$REMOTE_HOST_IP_ADDRESS:~/Developer/* $COMMBASE/
  echo "Sync finished. Check out the new changes!"
else
  echo "Something went wrong! Verify the remote IP address and hostname in your configuration file"
fi
