#!/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 03/06/2024  Esteban Herrera Original code.                                   #
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

# store_chat_log_copy.sh
# Creates a timestamped copy of the current chat log file, stores it in a
# specific user directory, and then clears the original chat log content.
store_chat_log_copy() {
  # Imports
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Generate a chat log file name with date and a random number
  random_filename="chat_log_$(date +%Y%m%d%H%M%S)_$RANDOM.txt"
  # Store a copy of the chat file in the user directory
  cp "$COMMBASE_APP_DIR""$CHAT_LOG_FILE" "$COMMBASE_APP_DIR/user/conversation_logs/$random_filename"
  # Get rid of the chat content
  rm "$COMMBASE_APP_DIR""$CHAT_LOG_FILE"

  exit 99
}

# Call store_copy_of_chat_log if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (store_chat_log_copy)
fi

exit 99
