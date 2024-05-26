#!usr//bin/env bash
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

# toggle_capture_on-off.sh
# This script serves as a key binding handler, associating physical keys on a
# keyboard with the functionality to toggle sound capture ON/OFF.

# Toggles ON/OFF the sound capture.
# The default Commbase keyboard binding for this to work is Alt-Shift-1.
toggle_capture_on_off() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Imports from libcommbase
  assistant_discourse=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/assistant_discourse.sh
  assistant_discourse_with_external_capture_driving=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/assistant_discourse_with_external_capture_driving.sh

  # First tmux session
  SESSIONNAME="Commbase-0";

  # Assume that the capture is mono, no matter the number of channels, which is
  # correct for registering the human voice.
  amixer_status=$(amixer get Capture | awk -F "[, ]+" '/on|off^/{print $NF ":", $1, $(NF-1)}' | tail -n+3 || exit 99);

  if (echo "$amixer_status" | grep -q 'off' || exit 99); then
    # Start capturing sound that the Commbase recognition requires to work.
    (amixer set Capture cap &>/dev/null || exit 99);  # The default keyboard binding for this is Alt-Shift-3.
  elif (echo "$amixer_status" | grep -q 'on' || exit 99); then
    # Stop capturing sound that alters Commbase recognition.
    (amixer set Capture nocap &>/dev/null);  # The default keyboard binding for this is ALT-SHIFT-2.
    # Check if there is a running Commbase session
    if (tmux has-session -t "$SESSIONNAME" 2> /dev/null); then
      # Call assistant_discourse_with_external_capture_driving with the
      # arguments: pane, i18n, origin, log_severity_level_1, discourse_key.
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; bash \"$assistant_discourse_with_external_capture_driving\" \"7\" \"1\" \"toggle_capture_on-off\" \"$LOG_SEVERITY_LEVEL_1\" \"default_microphone_is_mute_now\"" C-m);
    else
      # The key binding script is executed when Commbase is off. No
      # configuration variables are available.
      (echo "The default microphone is mute now." || exit 99);
    fi
  else
    # amixer is unable to retrieve the capture device status
    # Check if there is a running Commbase session
    if (tmux has-session -t "$SESSIONNAME" 2> /dev/null); then
      # Call assistant_discourse with the arguments: pane, i18n, origin,
      # log_severity_level_1, discourse_key.
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; bash \"$assistant_discourse\" \"7\" \"1\" \"toggle_capture_on-off\" \"$LOG_SEVERITY_LEVEL_1\" \"issue_with_the_microphone\"" C-m);
    else
      # The key binding script is executed when Commbase is off. No
      # configuration variables are available.
      (echo "There an issue with the microphone." || exit 99);
    fi
  fi
}

toggle_capture_on_off || exit 99;

exit 99
