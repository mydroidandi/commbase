#!/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 02/24/2024  Esteban Herrera Original code.                                   #
#                           Add new history entries as needed.                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (c) 2023-present Esteban Herrera C.                               #
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

# tail_chat_log.sh
# Provides a real-time, colored representation of log entries, making it
# visually distinguishable between entries related to the assistant and those
# related to the end user in a chat log. The script uses ANSI escape codes for
# color formatting.
tail_chat_log() {
  # Imports
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Define the strings as variables
  assistant_string="$ASSISTANT_NAME_IN_CHAT_PANE"
  enduser_string="$END_USER_NAME_IN_CHAT_PANE"

  # Specify the path to your file
  file_path="$COMMBASE_APP_DIR/$CHAT_LOG_FILE"

  # Define color variables
  assistant_color="\e[$ASSISTANT_BACKGROUND_COLOR_IN_CHAT_PANE"
  enduser_color="\e[$END_USER_BACKGROUND_COLOR_IN_CHAT_PANE"
  reset_color="\e[$TERMINAL_COLOR_CODE_END"

  # Function to print colored text
  print_colored() {
    case $1 in
      "$assistant_string")
        echo -e "${assistant_color}$1${reset_color}$2"
        ;;
      "$enduser_string")
        echo -e "${enduser_color}$1${reset_color}$2"
        ;;
      *)
        echo "$1$2"
        ;;
    esac
  }

  # Monitor the file for changes
  (tail -f "$file_path") | while read -r line; do
    # Check if the substrings are present before extracting
    if [[ $line == *"$assistant_string"* ]]; then
      substring1=$(echo "$line" | awk -F"$assistant_string" '{print $2}')
      print_colored "$assistant_string" "$substring1"
    fi

    if [[ $line == *"$enduser_string"* ]]; then
      substring2=$(echo "$line" | awk -F"$enduser_string" '{print $2}')
      print_colored "$enduser_string" "$substring2"
    fi
  done

  exit 99
}

# Call tail_chat_log if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (tail_chat_log)
fi

exit 99
