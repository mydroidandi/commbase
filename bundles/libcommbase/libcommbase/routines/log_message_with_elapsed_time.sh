#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 05/19/2024  Esteban Herrera Original code.                                   #
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

# log_message_with_elapsed_time.sh
# Logs messages either to a specified log file or to the output, based on
# parameters passed to it. It sources configuration settings from a file
# (commbase.conf), reads translation files to support multiple languages, and
# calculates the elapsed time since the script started. The script formats and
# logs messages with details including the origin, severity level, and
# translated message.
log_message_with_elapsed_time() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Deal with the directories related to internationalization (i18n)
  local i18n_number=$3

    # The path to the log messages file
  log_file="$log_file_path"

  case $i18n_number in
    1)
      # Read the translation file based on the current language
      translation=$(cat "$COMMBASE_APP_DIR/bundles/libcommbase/resources/i18n/log_messages/$COMMBASE_LANG.json")
      ;;
    2)
      # Read the translation file based on the current language
      translation=$(cat "$COMMBASE_APP_DIR/i18n/log_messages/$COMMBASE_LANG.json")
      ;;
    3)
      # Read the translation file based on the current language
      translation=$(cat "$COMMBASE_APP_DIR/src/client/i18n/log_messages/$COMMBASE_LANG.json")
      ;;
    *)
      echo "Invalid i18n path"
  esac

  # Read the translation file based on the language passed as parameter
  # Extract the message from JSON
  log_message=$(echo "$translation" | jq -r ".$log_message_key")  # Syntax: jq -r '.instruction_to_pause_recording'

  # Record the start time in seconds since the epoch
  start_time=$(date +%s.%N)

  # Log the complete message
  log() {
    # The format string in printf specifies how the subsequent arguments should
    # be formatted and displayed.
    # %.6f: This is a format specifier for a floating-point number
    # The first part of the [0.001129] represents the seconds since the script
    # started running and the second part represents the fractional seconds.
    current_time=$(date +%s.%N)
    elapsed_time=$(echo "$current_time - $start_time" | bc)

    # If log_file_path_on is False, the script prints only in the output
    if [ "$log_to_file_on" == "True" ]; then
      printf "[%.6f] %s: %s: %s\n" "$elapsed_time" "$origin" "$log_severity_level" "$log_message" >> "$log_file"
    else
      printf "%s: %s: %s\n" "$origin" "$log_severity_level" "$log_message"
    fi
  }

  (log)

  exit 99
}

# Check if all the required values are provided as arguments
if [ $# -ne 6 ]; then
  echo "Usage: $0 <origin> <log_severity_level> <i18n_number> <log_message_key> <log_to_file_on> <log_file_path>"
  exit 1
fi

# Global declarations

# Extract origin, log severity level, and message from command line arguments
origin="$1"
log_severity_level="$2"
i18n_number="$3"
log_message_key="$4"
log_to_file_on="$5"
log_file_path="$6"

(log_message_with_elapsed_time "$origin" "$log_severity_level" "$i18n_number" "$log_message_key" "$log_to_file_on" "$log_file_path")

exit 99
