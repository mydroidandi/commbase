#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 06/03/2023  Esteban Herrera Original code.                                   #
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

# display_control_patterns.sh
# Organizes and displays all the control patters from the controls patterns file
display_control_patterns() {
  # Imports
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Read the controls JSON file into a variable
  json_data=$(cat "$COMMBASE_APP_DIR/$CONTROL_PATTERNS_FILE")

  # Load every first value and its key into a single variable
  key_value_pairs=$(jq -r 'to_entries | .[] | "\(.value[0]): \(.key)"' <<< "$json_data")

  # Echo each key value with underscores removed and only the first word
  # capitalized, and the values inside double quotes.
  while read -r key_value_pair; do
    key=$(echo "$key_value_pair" | cut -d ':' -f 2 | sed -e 's/_/ /g' -e 's/\b\(.\)/\u\1/')
    value=$(echo "$key_value_pair" | cut -d ':' -f 1 | sed 's/^[[:space:]]*//')
    echo "    \"$value\":" "$key"
  done <<< "$key_value_pairs"

  exit 99
}

# Call display_control_patterns if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (display_control_patterns)
fi

exit 99
