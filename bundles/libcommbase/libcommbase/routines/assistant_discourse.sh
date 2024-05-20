#!usr//bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 03/18/2024  Esteban Herrera Original code.                                   #
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

# assistant_discourse.sh
# Handles the presentation and logging of assistant discourse messages, with
# flexibility for different language preferences and configuration settings.
assistant_discourse() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Imports from libcommbase
  mute_capture=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/capture_mute.sh
  unmute_capture=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/capture_unmute.sh

  # Time is exported in app.sh, but it's re-declared here to pass the linting,
  # be able to reuse the routine in other scripts, and save some milliseconds.
  # It might also get re-declared as local.
  time=0.1

  # Deal with the directories related to internationalization (i18n)
  local i18n_number=$2

  case $i18n_number in
    1)
      # Read the translation file based on the current language
      translation=$(cat "$COMMBASE_APP_DIR/bundles/libcommbase/resources/i18n/discourses/$COMMBASE_LANG.json")
      ;;
    2)
      # Read the translation file based on the current language
      translation=$(cat "$COMMBASE_APP_DIR/i18n/discourses/$COMMBASE_LANG.json")
      ;;
    3)
      # Read the translation file based on the current language
      translation=$(cat "$COMMBASE_APP_DIR/src/client/i18n/discourses/$COMMBASE_LANG.json")
      ;;
    *)
      echo "Invalid i18n path"
  esac

  # Read the translation file based on the language passed as parameter
  # Extract the message from JSON
  discourse=$(echo "$translation" | jq -r ".$discourse_key")  # Syntax: jq -r '.instruction_to_pause_recording'

  # Check if the assistant configuration is set to make it speak out loud
  if [ "$AUDIBLE_ASSISTANT_LOGGING_ON" = "True" ]; then
    # If true, show the log severity level in the assistant message
    if [ "$ASSISTANT_LOG_SEVERITY_LEVELS_ON" = "True" ]; then
      # Log the assistant message in the chatroom = ON
      # Make the assistant speak the message = ON
      # Log the severity level = ON
      (tmux select-pane -t "$pane_number" && tmux send-keys " clear; echo \"$ASSISTANT_NAME_IN_CHAT_PANE\" \"[$log_severity_level]: $discourse\" >> \"$COMMBASE_APP_DIR$CHAT_LOG_FILE\" && bash \"$mute_capture\"; echo \"$discourse\" | $TTS_ENGINE_STRING; bash \"$unmute_capture\"" C-m && sleep "$time");
    else
      # Log the assistant message in the chatroom = ON
      # Make the assistant speak the message = ON
      # Log the severity level = OFF
      (tmux select-pane -t "$pane_number" && tmux send-keys " clear; echo \"$ASSISTANT_NAME_IN_CHAT_PANE\" \"$discourse\" >> \"$COMMBASE_APP_DIR\"\"$CHAT_LOG_FILE\" && bash \"$mute_capture\"; echo \"$discourse\" | $TTS_ENGINE_STRING; bash \"$unmute_capture\"" C-m && sleep "$time");
    fi
  else
    # The audible assistant variable is set to false
    # If true, show the log severity level in the assistant message
    if [ "$ASSISTANT_LOG_SEVERITY_LEVELS_ON" = "True" ]; then
      # Log the assistant message in the chatroom = ON
      # Make the assistant speak the message = OFF
      # Log the severity level = ON
      (tmux select-pane -t "$pane_number" && tmux send-keys " clear; echo \"$ASSISTANT_NAME_IN_CHAT_PANE\" \"[$log_severity_level]: $discourse\" >> \"$COMMBASE_APP_DIR\"\"$CHAT_LOG_FILE\"" C-m && sleep $time);
    else
      # Log the assistant message in the chatroom = ON
      # Make the assistant speak the message = OFF
      # Log the severity level = OFF
      (tmux select-pane -t "$pane_number" && tmux send-keys " clear; echo \"$ASSISTANT_NAME_IN_CHAT_PANE\" \"$discourse\" >> \"$COMMBASE_APP_DIR\"\"$CHAT_LOG_FILE\"" C-m && sleep $time);
    fi
  fi

  exit 99
}

# Check if all the required values are provided as arguments
if [ $# -ne 4 ]; then
  echo "Usage: $0 <pane_number> <i18n_number> <log_severity_level> <discourse_key>"
  exit 1
fi

# Global declarations
pane_number="$1"
i18n_number="$2"
log_severity_level="$3"
discourse_key="$4"

(assistant_discourse "$pane_number" "$i18n_number" "$log_severity_level" "$discourse_key")

exit 99
