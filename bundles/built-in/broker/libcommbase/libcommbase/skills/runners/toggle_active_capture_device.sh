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

# toggle_active_capture_device.sh
# A key binding, or an association between a physical key on a keyboard and a
# parameter to toggle and activate the current active and default capture device
# to another device in a group of two devices, turning it active and default.

# The configuration file
source "$COMMBASE_APP_DIR/config/app.conf"

# Toggle and activate the current active and default capture device to another
# device in a group of two devices, turning it active and default.
# Uses the keyboard binding CTRL-SHIFT-Z.
toggle_active_capture_device() {
  active_device=$(pactl list sources short | grep RUNNING || exit 99);

  if (echo "$active_device" | grep -q "$MY_APP_AUDIO_CAPTURE_DEVICE_NAME" || exit 99); then
    (pacmd set-default-source "$SYSTEM_AUDIO_CAPTURE_DEVICE_NAME" || exit 99);
  else
    (pacmd set-default-source "$MY_APP_AUDIO_CAPTURE_DEVICE_NAME" || exit 99);
  fi
}

# Turn capture on whether it is off.
turn_capture_on() {
# Assume that the capture is mono, no matter the number of channels, which is
# correct for registering the human voice.
  amixer_status=$(amixer get Capture | awk -F "[, ]+" '/on|off^/{print $NF ":", $1, $(NF-1)}' | tail -n+3) || exit 99;

  if (echo "$amixer_status" | grep -q 'off' || exit 99); then
    # Start capturing sound that the Commbase recognition requires to work.
    # Uses the keyboard binding ALT-SHIFT-3.
    (amixer set Capture cap &>/dev/null || exit 99);
  fi
}

toggle_active_capture_device || exit 99;
turn_capture_on || exit 99;

exit 99
