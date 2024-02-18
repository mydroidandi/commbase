#!usr//bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 02/13/2024  Esteban Herrera Original code.                                   #
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

# update_control_in_messages_json.sh
# Updates any control in data/.messages.json and calls
# request_commbase_data_exchange.sh.
# Usage:
# bash update_control_in_messages_json.sh <new_control_value>
update_control_in_messages_json() {
  # Configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Import from libcommbase
  request_commbase_data_exchange=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/request_commbase_data_exchange.sh

  cd "$COMMBASE_APP_DIR"/data || exit

  # Path to the JSON file
  json_file=".messages.json"

  # New value for "control"
  new_control_value="$1"

  # Update the "control" value in the JSON file while keeping it in one line
  jq --arg new_value "$new_control_value" '.messages[0].control = $new_value' "$json_file" | jq -c '.' > "$json_file.tmp" && mv "$json_file.tmp" "$json_file"

  # Send the messages request through commbase-data-exchange client
  bash "$request_commbase_data_exchange"

  exit 99
}

# Check if a new_control_value is provided as a command-line argument
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <new_control_value>"
  exit 1
fi

# Call the function with the provided new_control_value
(update_control_in_messages_json "$1")

exit 99
