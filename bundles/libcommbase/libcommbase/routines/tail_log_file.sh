#!/bin/env bash
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

# tail_log_file.sh
# Monitors a specified log file in real-time, printing each new entry without
# prefix. It loads configuration settings, ensures the log file path is defined,
# and uses the tail -f command to watch the file for updates.
tail_log_file() {
  # Imports
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  local log_file_path="$1"

  # Specify the path to your file
  file_path="$COMMBASE_APP_DIR/$log_file_path"

 # Ensure file_path is defined
  if [[ -z "$file_path" ]]; then
    echo "Error: file_path is not defined in the configuration."
    exit 1
  fi

  # Monitor the file for changes
  (tail -f "$file_path") | while read -r line; do
    # Process each line
    echo "$line"
  done

  exit 99
}

if [ $# -ne 1 ]; then
  echo "Usage: $0 <log_file_path>"
  exit 1
fi

# Global declarations

# Extract origin, log severity level, and message from command line arguments
log_file_path="$1"

(tail_log_file "$log_file_path")

exit 99
