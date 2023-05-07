#!/usr/bin/env bash
################################################################################
#                                   Commbase                                   #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
#                                                                              #
# Change History                                                               #
# 04/29/2023  Esteban Herrera Original code.                                   #
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

# server_1_run_sync_live_server_from_localhost.sh
# Script that executed from the development server, synchronizes one time the directory
# ~/Developer in the developer's computer to the server's web directory /var/www/html/Developer/
# Requires previously established SSH configuration in both, the client and the server.
# Requires 'rsync' already installed in both, server and client.
# Requires a 'Developer' directory with the developer remote user created and set up in the server. 

# To create the directory in the server: 
# $ sudo mkdir /var/www/html/Developer
# $ sudo chown $USER /var/www/html/Developer
# $ sudo chgrp $USER /var/www/html/Developer
# $ sudo chmod 755 /var/www/html/Developer
# $ ls -hal /var/www/html
# NOTE: The permissions as well as the ownership of the files and directories could change when in a
# real fully set up live server.

# The configuration file.
source $COMMBASE_ROOT_DIR/commbase/config/commbase.conf

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
  rsync -a --delete --quiet -e ssh $REMOTE_USER@$REMOTE_HOST_IP_ADDRESS:~/Developer/* /var/www/html/Developer/
  echo "Sync finished. Check out the new changes!"
else
  echo "Something went wrong! Verify the remote IP address and hostname in your configuration file"
fi
