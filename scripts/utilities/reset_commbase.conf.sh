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

# reset_commbase.conf.sh
# Restores the file config/commbase.conf to its inital status.

# Copy the content of cat
cd ../../config/
touch commbase.conf
cat <<EOT > commbase.conf
COMMBASE_APP_DIR="commbase"
PYTHON_ENV_VERSION="python"
PYTHON_CPU_LIMIT_PERCENTAGE="75"
IP_ADDRESS_UPDATE_IN_SECS="300"
LOCAL_HOST_UUID="5ba8f927-d331-471c-b640-812d4680e310"
REMOTE_USER_NAME="tonystark"
REMOTE_USER_PASSWD="USE-KEY-PAIRS"
COMMBASE_CAPTURE_DEVICE_NAME="alsa_input.usb-_Webcam_C170-02.mono-fallback"
ALTERNATIVE_CAPTURE_DEVICE_NAME="alsa_input.pci-0000_00_1b.0.analog-stereo"
ENABLE_TMUX_EXTRA_WINDOWS="true"
ENABLE_TMUX_EXTRA_WINDOW_EDITOR="true"
ENABLE_TMUX_EXTRA_WINDOW_TIMER="true"
ENABLE_TMUX_EXTRA_WINDOW_SERVER1="true"
ENABLE_TMUX_EXTRA_WINDOW_SERVER2="false"
EXTERNAL_STORAGE_DRIVE_01_TAG="WD1"
EXTERNAL_STORAGE_DRIVE_02_TAG="WD2"
DEV_PROJECT_DIRECTORY_NAME="commbase"
PROTONVPN_CLI_USERNAME="Tony_St4rk"
PROTONVPN_CLI_PASSWORD="NOT-REQUIRED-ONCE-REGISTERED"
PROTONVPN_API_USERNAME="USERNAME-IN-CONFIG-FILE-IN-/ETC/"
PROTONVPN_API_PASSWORD="PASSWORD-IN-CONFIG-FILE-IN-/ETC/"
SERVER_HOST_001_UUID="27475487-cab6-4050-9047-9a565e22d2b0"
SERVER_HOST_001_HOSTNAME="shark2"
SERVER_HOST_001_IP_ADDRESS="192.168.100.45"
SERVER_HOST_001_USER_PASSWD="USE-KEY-PAIRS"
CHATGPT_API_KEY="1234"

EOT

exit 99

