#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 05/25/2024  Esteban Herrera Original code.                                   #
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

# terminal_set_pytts3_voice_index.sh
# This script is designed to interactively change the pyttsx3 voice index for
# a Commbase application.
# It performs the following tasks:
# 1. Displays current system locale information.
# 2. Displays the current application language code and voice index.
# 3. Shows details about the current voice index.
# 4. Displays the total number of available voice indexes.
# 5. Prompts the user to enter a new voice index, validating the input to ensure
# it's a valid index.
# 6. Updates the configuration file with the new voice index.
# 7. Shows details about the new voice index.
terminal_set_pytts3_voice_index() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Imports from libcommbase
  display_any_pytts3_voice_index_details=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/display_any_pytts3_voice_index_details.py
  display_total_number_of_pytts3_voice_indexes=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/display_total_number_of_pytts3_voice_indexes.py

  # Display the system locale info
  echo "Current system locale information:"
  locale

  # Display the value of the language code
  echo ""
  echo "The current app language code is:" "$COMMBASE_LANG"

  # Display the value of the current voice index
  echo ""
  echo "The current app voice index is:" "$TTS_PYTTSX3_LANGUAGE_INDEX"

  # Display the current index information
  echo ""
  echo "Current voice index information:"
  # Run the Python script and capture its output
  output=$($PYTHON_ENV_VERSION "$display_any_pytts3_voice_index_details" "$TTS_PYTTSX3_LANGUAGE_INDEX")
  # Print the captured output
  echo "$output"

  # Display the total number of available voice indexes
  # Run the Python script and capture its output
  output=$($PYTHON_ENV_VERSION "$display_total_number_of_pytts3_voice_indexes")
  total_indexes=$(echo "$output" | grep -o '[0-9]\+')

  # Print the captured output
  echo ""
  echo "Total number of available voice indexes: $total_indexes"

  # Prompt user to enter the index to change the language, and repeat the prompt
  # until a valid input is provided.
  echo ""
  read -r -p "👉️ Enter the new voice index: " new_voice_index

  while true; do
    # Check if input is empty
    if [[ -z "$new_voice_index" ]]; then
      read -r -p "👉️ Please enter a non-empty index: " new_voice_index
      continue
    fi

    # Check if input is a valid number
    if ! [[ "$new_voice_index" =~ ^[0-9]+$ ]]; then
      read -r -p "👉️ Please enter a valid numeric index: " new_voice_index
      continue
    fi

    # Check if input is within valid range
    if [[ "$new_voice_index" -ge "$total_indexes" ]] || [[ "$new_voice_index" -lt 0 ]]; then
      read -r -p "👉️ Please enter a valid index between 0 and $((total_indexes - 1)): " new_voice_index
      continue
    fi

    # If all checks pass, break the loop
    break
  done

  # Overwrite the variable in config/commbase.conf
  # TTS_PYTTSX3_LANGUAGE_INDEX
  if grep -q "TTS_PYTTSX3_LANGUAGE_INDEX" "$COMMBASE_APP_DIR"/config/commbase.conf; then
    sed -i "s#TTS_PYTTSX3_LANGUAGE_INDEX=.*#TTS_PYTTSX3_LANGUAGE_INDEX=\"$new_voice_index\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
  fi

  # Retrieve the real final value of the language variable from the
  # configuration file instead of from $new_lang_code.
  source "$COMMBASE_APP_DIR"/config/commbase.conf # Re-sources the configuration file to apply the changes

  # Display the value of the new voice index
  echo ""
  echo "The new app voice index is:" "$TTS_PYTTSX3_LANGUAGE_INDEX"

  # Display the new index information
  echo ""
  echo "The new voice index information:"
  # Run the Python script and capture its output
  output=$($PYTHON_ENV_VERSION "$display_any_pytts3_voice_index_details" "$TTS_PYTTSX3_LANGUAGE_INDEX")
  # Print the captured output
  echo "$output"

  exit 99
}

# Call terminal_set_pytts3_voice_index if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (terminal_set_pytts3_voice_index)
fi

exit 99
