#!usr//bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 05/22/2024  Esteban Herrera Original code.                                   #
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

# log_command_with_timestamp.sh
# Logs messages either to a specified log file or to the output, based on
# parameters passed to it. It sources configuration settings from a file
# (commbase.conf), reads translation files to support multiple languages, and
# calculates the elapsed time since the script started. The script formats and
# logs messages with details including the origin, severity level, and
# translated message.
log_command_with_timestamp() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # The path to the log messages file
  log_file="$command_log_file_path"

  # Log the complete message
  log() {
    # The date +"%s.%N" command ensures that you get the current time in seconds
    # since the epoch followed by nanoseconds.
    # timestamp=$(date +"%s.%N")
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    # If log_file_path_on is False, the script prints only in the output
    if [ "$LOG_COMMANDS_TO_FILE_ON" == "True" ]; then
      echo "[$timestamp] $origin: $log_severity_level: $command" >> "$log_file"
    else
      echo "LOG_COMMANDS_TO_FILE_ON is set to False" 2> /dev/null
    fi
  }

  (log)

  exit 99
}

# Check if all the required values are provided as arguments
if [ $# -ne 4 ]; then
  echo "Usage: $0 <origin> <log_severity_level> <command> <command_log_file_path>"
  exit 1
fi

# Global declarations

# Extract origin, log severity level, and message from command line arguments
origin="$1"
log_severity_level="$2"
command="$3"
command_log_file_path="$4"

(log_command_with_timestamp "$origin" "$log_severity_level" "$command" "$command_log_file_path")

exit 99
