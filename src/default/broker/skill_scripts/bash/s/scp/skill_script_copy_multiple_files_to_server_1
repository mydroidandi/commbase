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

# localhost_copy_multiple_files_to_server_1.sh
# Script to ssh copy multiple files to the server in the user's home directory
# from the relative directory (from source to destiny.)

# The configuration file.
source $COMMBASE_ROOT_DIR/commbase/config/commbase.conf

REMOTEUSER=$REMOTE_USER_NAME
REMOTEHOST=$SERVER_HOST_001_IP_ADDRESS
#REMOTEHOST="shark2"

WILDCARD="server*.sh"
REMOTEDIRECTORY=$HOME

scp $WILDCARD $REMOTEUSER@$REMOTEHOST:$REMOTEDIRECTORY
#scp ProtonVPN_server_configs.zip esteban@192.168.100.45:~/
#scp protonvpn-stable-release_1.0.1-1_all.deb esteban@192.168.100.45:~/
#scp Honeygain_install.exe esteban@192.168.100.45:~/
#scp server-run-honeygain-pollen-light.sh server-run-honeygain-pollen-heavy.sh server-run-honeygain.sh server-run-protonvpn-CLI.sh server-run-protonvpn-no-CLI-prompts.sh server-run-sync-live-server.sh esteban@192.168.100.45:~/
#scp server*.sh esteban@192.168.100.45:~/
