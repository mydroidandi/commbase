################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 02/17/2024  Esteban Herrera Original code.                                   #
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

# controller.sh
# Parses the current request property value stored in a JSON file generated by
# either the STT engine or the Commbase executable. If the current request
# matches a control pattern in the control patterns file, updates the current
# request in the JSON file. Subsequently, sends the updated messages request
# through the commbase-data-exchange client.
controller() {
  # Imports
  source "$COMMBASE_APP_DIR/config/commbase.conf"

  # Imports from libcommbase
  update_control_in_messages_json=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/update_control_in_messages_json.sh
  request_commbase_data_exchange=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/request_commbase_data_exchange.sh

  # Extract the JSON object property value current_request from the file
  # messages json.
  messages_json=$(<"$COMMBASE_APP_DIR""$MESSAGING_FILE")
  # Read the value of current_request property from JSON
  current_request=$(jq -r '.messages[1].current_request' <<< "$messages_json")

  # Extract the JSON object control patterns from file and process them
  patterns_file=$(<"$COMMBASE_APP_DIR""$CONTROL_PATTERNS_FILE")
  #cat $COMMBASE_APP_DIR$CONTROL_PATTERNS_FILE | jq 'to_entries[] | .key, .value[]'

  matching_property=""

  ## Search for matches including substrings in strings
  #for property in $(echo "$patterns_file" | jq -r 'keys_unsorted[]'); do
  #    values=$(echo "$patterns_file" | jq -r ".$property[]")
  #    if [[ $values =~ $current_request ]]; then
  #        matching_property="$property"
  #        break
  #    fi
  #done

  # Search for exactly equal string matches
  for property in $(echo "$patterns_file" | jq -r 'keys_unsorted[]'); do
    # Braces '{[]}' wrap the array expansion without changing the behavior of the code.
    # To protect against the possibility that .items is not an array use "?"
    values=$(echo "$patterns_file" | jq -r ".$property{[]}?" | tr '\n' '|')
    values=${values%|}  # Remove the trailing "|"

    IFS='|' read -ra values_array <<< "$values"

    for value in "${values_array[@]}"; do
      if [[ "$current_request" == "$value" ]]; then
        matching_property="$property"
        break 2  # Break both inner and outer loops
      fi
    done
  done

  if [ -n "$matching_property" ]; then
    #echo "Matching property found: $matching_property"
    (bash "$update_control_in_messages_json" "$matching_property")
  else
    #echo "No matching property found for the current request."
    (bash "$request_commbase_data_exchange")
  fi

  exit 99
}

# Call controller if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (controller)
fi

exit 99
