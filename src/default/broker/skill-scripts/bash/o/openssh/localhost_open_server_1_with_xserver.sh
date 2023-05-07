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

# localhost_open_server_1_with_xserver.sh
# Script to open remote server applications with GUI through the network. It requires to
# forward X over SSH (OpenSSH installed). Once logged in the remote computer run an application
# for testing, for example $ xeyes, from the local computer with any X server, commonly,
# Xfree86, Xorg, or Wayland.
# Requires previously established SSH configuration in both, the client and the server.
# Requires 'rsync' already installed in both, server and client.

# The configuration file.
source $COMMBASE_ROOT_DIR/commbase/config/commbase.conf;

REMOTE_HOST_IP_ADDRESS=$SERVER_HOST_001_IP_ADDRESS;

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

