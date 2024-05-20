#!usr//bin/env bash
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

# append_message_to_log_file.sh
# Logs individual messages to a log file. It reads configuration settings and
# translations from specified files, calculates the elapsed time since the start
# of the script, and appends formatted log messages to a log file.
append_message_to_log_file(){
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # The path to the log messages file
  LOG_FILE="$log_file_path"

  # Read the translation file based on the current language
  translation=$(cat "$COMMBASE_APP_DIR/i18n/log_messages/$COMMBASE_LANG.json")
  # Read the translation file based on the language passed as parameter
  # Extract the message from JSON
  log_message=$(echo "$translation" | jq -r ".$log_message_key")  # Syntax: jq -r '.instruction_to_pause_recording'

  # Record the start time in seconds since the epoch
  start_time=$(date +%s.%N)

  # Log the complete message
  log_message() {
    # v1
    # The date +"%s.%N" command ensures that you get the current time in seconds
    # since the epoch followed by nanoseconds.
    #timestamp=$(date +"%s.%N")
    #echo "[$timestamp] $origin: $log_severity_level: $log_message" >> "$LOG_FILE"

    # v2
    # The format string in printf specifies how the subsequent arguments should
    # be formatted and displayed.
    # %.6f: This is a format specifier for a floating-point number
    # The first part of the [0.001429] represents the seconds since the script
    # started running and the second part represents the fractional seconds.
    current_time=$(date +%s.%N)
    elapsed_time=$(echo "$current_time - $start_time" | bc)
    printf "[%.6f] %s: %s: %s\n" "$elapsed_time" "$origin" "$log_severity_level" "$log_message" >> "$LOG_FILE"
  }

  (log_message)

  exit 99
}

# Check if all the required values are provided as arguments
if [ $# -ne 4 ]; then
  echo "Usage: $0 <origin> <log_severity_level> <log_message_key> <log_file_path>"
  exit 1
fi

# Global declarations

# Extract origin, log severity level, and message from command line arguments
origin="$1"
log_severity_level="$2"
log_message_key="$3"
log_file_path="$4"

(append_message_to_log_file "$origin" "$log_severity_level" "$log_message_key" "$log_file_path")

exit 99
