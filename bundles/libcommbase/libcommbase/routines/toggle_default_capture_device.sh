#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
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

# toggle_default_capture_device.sh
# This script serves as a key binding handler, associating a physical key on a
# keyboard (Ctrl-Shift-z) with the functionality to toggle and default the
# capture device between two specified devices. The selection process is based
# on the default state of the devices and is designed for a group of maximum two
# devices.

# The configuration file
source "$COMMBASE_APP_DIR/config/commbase.conf"

# Toggles and defaults the current default capture device to another device in a
# group of two. The default Commbase keyboard binding for this to work is
# Ctrl-Shift-z.
toggle_default_capture_device() {
  default_device=$(pactl info | grep "Default Source:" || exit 99);  # active_device=$(pactl list sources short | grep RUNNING || exit 99);

  if (echo "$default_device" | grep -q "$MY_APP_AUDIO_CAPTURE_DEVICE_NAME" || exit 99); then
    (pactl set-default-source "$SYSTEM_AUDIO_CAPTURE_DEVICE_NAME" || exit 99);  # Works with PulseAudio or PulseAudio and PipeWire
  else
    (pactl set-default-source "$MY_APP_AUDIO_CAPTURE_DEVICE_NAME" || exit 99);  # Works with Pulseaudio or PulseAudio and Pipewire
  fi
}

# Turns the capture on whether it is off.
turn_capture_on() {
# Assume that the capture is mono, no matter the number of channels, which is
# correct for registering the human voice.
  amixer_status=$(amixer get Capture | awk -F "[, ]+" '/on|off^/{print $NF ":", $1, $(NF-1)}' | tail -n+3) || exit 99;

  if (echo "$amixer_status" | grep -q 'off' || exit 99); then
    # Start capturing sound that the Commbase recognition requires to work.
    (amixer set Capture cap &>/dev/null || exit 99);  # The default keyboard binding for this is Alt-Shift-3.
  fi
}

toggle_default_capture_device || exit 99;
turn_capture_on || exit 99;

exit 99
