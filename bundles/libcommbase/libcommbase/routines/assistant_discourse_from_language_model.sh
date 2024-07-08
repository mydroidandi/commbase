#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 06/22/2024  Esteban Herrera Original code.                                   #
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

# assistant_discourse_from_language_model.sh
# Manages how discourse messages from an assistant language model are logged
# audibly.
assistant_discourse_from_language_model() {
  # Imports
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Imports from libcommbase
  mute_capture=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/capture_mute.sh
  unmute_capture=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/capture_unmute.sh

  # Define the path to the log file
  log_file="$COMMBASE_APP_DIR"/"$CHAT_LOG_FILE"

  # Check if ASSISTANT_NAME_IN_CHAT_PANE is set
  if [ -z "$ASSISTANT_NAME_IN_CHAT_PANE" ]; then
    echo "ASSISTANT_NAME_IN_CHAT_PANE is not set in the .env file."
    exit 1
  fi

  # Check if the log file exists
  if [ -f "$log_file" ]; then
    # Extract the last log entry by the assistant
    last_log=$(grep "$ASSISTANT_NAME_IN_CHAT_PANE" "$log_file" | tail -n 1)
    (bash "$mute_capture")
    # Extract only the text after the assistant name and pass it to the TTS_ENGINE_STRING command
    echo "$last_log" | awk -v name="$ASSISTANT_NAME_IN_CHAT_PANE" '{n=split($0, a, name); for (i=2; i<=n; i++) print a[i]}' | $TTS_ENGINE_STRING
    (bash "$unmute_capture")
  else
    echo "Log file not found."
    exit 1
  fi

  exit 99

}

# Call assistant_discourse_from_language_model if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (assistant_discourse_from_language_model)
fi

exit 99
