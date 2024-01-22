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

# localhost_copy_a_single_file_to_server_1.sh
# Script to ssh copy a file to the server in the user's home directory
# from the relative directory. For example, copy a .zip file from 
# source to destiny

# The configuration file.
source $COMMBASE_ROOT_DIR/commbase/config/commbase.conf

REMOTEUSER=$REMOTE_USER_NAME
REMOTEHOST=$SERVER_HOST_001_IP_ADDRESS
#REMOTEHOST="shark2"

FILE="ProtonVPN_server_configs.zip"
REMOTEDIRECTORY=$HOME

scp $FILE $REMOTEUSER@$REMOTEHOST:$REMOTEDIRECTORY
#scp ProtonVPN_server_configs.zip esteban@192.168.100.45:~/
