#!/bin/env bash
################################################################################
#                                   Commbase                                   #
#                                                                              #
# AI Powered Conversational Assistant for Computers and Droids                 #
#                                                                              #
# Change History                                                               #
# 04/29/2023  Esteban Herrera Original code.                                   #
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

# client_skill.sh
# This script is designed to execute a temporary script based on the specified
# runtime extracted from JSON data. It checks for the presence of required tools
# (jq) and runtimes (Bash, Node.js, Python, etc.) and informs the user if any
# are missing. Finally, it removes the temporary script file.

# The configuration files
source $COMMBASE_APP_DIR/config/commbase.conf
source $COMMBASE_APP_DIR/config/app.conf
source $COMMBASE_APP_DIR/config/secrets

# Check if jq is installed
if ! command -v jq &> /dev/null; then
  echo "jq is not installed. Please install it before running this script."
  exit 1
fi

# TODO: Read from updated version of messages.json in data/
# Read JSON data from the file
json_data=$(cat response_messages.json)

# Extract source_code, runtime, and current_response from JSON object
source_code=$(echo "$json_data" | jq -r '.messages[] | select(has("source_code")).source_code')
runtime=$(echo "$json_data" | jq -r '.messages[] | select(has("runtime")).runtime')
current_response=$(echo "$json_data" | jq -r '.messages[] | select(has("current_response")).current_response')

# Check if source_code and runtime are not null
if [ -z "$source_code" ] || [ -z "$runtime" ]; then
  echo "Error: Missing source_code or runtime in JSON."
  exit 1
fi

# Save source code to a temporary file
echo "$source_code" > .skill_runner

# Check if the specified runtime is available
case "$runtime" in
  "bash")
    if ! command -v bash &> /dev/null; then
      echo "Bash is not installed. Please install it before running this script."
      rm .skill_runner
      exit 1
    fi
    # TODO: Here there must be ifs for the json property source_code_display, inside of every runtime case
    # The echoes for the json property current_response_display must go in the pane 1, chatroom.
    # Those echoes must include string of the Assistant name with tag and colors, something like
    # printf "\e[1;41mCOMMBASE:\e[1;m I don't understand: %s\n" "$current_request""."   ----> but using the config file variables.
    tmux select-window -t 1 && tmux select-pane -t 1 && (echo "$current_response"; echo "$current_response" | $TTS_ENGINE_STRING; gnome-terminal -- bash .skill_runner; sleep .1 &)
    ;;
  "nodejs")
    if ! command -v node &> /dev/null; then
      echo "Node.js is not installed. Please install it before running this script."
      rm .skill_runner
      exit 1
    fi
    tmux select-window -t 1 && tmux select-pane -t 1 && (echo "$current_response"; echo "$current_response" | $TTS_ENGINE_STRING; gnome-terminal -- node .skill_runner;sleep .1 &)
    ;;
  "python")
    if ! command -v python &> /dev/null; then
      echo "Python is not installed. Please install it before running this script."
      rm .skill_runner
      exit 1
    fi
    tmux select-window -t 1 && tmux select-pane -t 1 && (echo "$current_response"; echo "$current_response" | $TTS_ENGINE_STRING; gnome-terminal -- python .skill_runner;sleep .1 &)
    ;;
  # Add more runtimes here ...
  *)
    echo "Unsupported runtime: $runtime"
    rm .skill_runner
    exit 1
    ;;
esac

# Remove the temporary script file
rm .skill_runner
