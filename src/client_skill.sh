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
# are missing.
client_skill() {
  # Configuration files
  source $COMMBASE_APP_DIR/config/commbase.conf
  source $COMMBASE_APP_DIR/config/app.conf
  source $COMMBASE_APP_DIR/config/secrets

  # Tmux session
  session_name="Commbase-0"
  window_number=1
  pane_number=6

  # Check if jq is installed
  if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Please install it before running this script."
    exit 1
  fi

  # Data files
  json_data=$(cat $COMMBASE_APP_DIR/data/.messages.json)

  # Extract values from JSON object
  source_code=$(echo "$json_data" | jq -r '.messages[] | select(has("source_code")).source_code')
  runtime=$(echo "$json_data" | jq -r '.messages[] | select(has("runtime")).runtime')
  source_code_display=$(echo "$json_data" | jq -r '.messages[] | select(has("source_code_display")).source_code_display')
  current_response=$(echo "$json_data" | jq -r '.messages[] | select(has("current_response")).current_response')

  # Check if source_code, runtime, source_code_display, and current_response are not null
  if [ -z "$source_code" ] || [ -z "$runtime" ] || [ -z "$source_code_display" ] || [ -z "$current_response" ]; then
    echo "Error: Missing source_code, runtime, source_code_display, or current_response in JSON."
    exit 1
  fi

  # Save source code to a temporary file
  echo "$source_code" > $COMMBASE_APP_DIR/data/.skill_runner

  # Check if the specified runtime is available
  case "$runtime" in
    "bash")
      if ! command -v bash &> /dev/null; then
        echo "Bash is not installed. Please install it before running this script."
        rm $COMMBASE_APP_DIR/data/.skill_runner
        exit 1
      fi
      # TODO: The echoes for the pane 1, chatroom, must include string of the
      # Assistant name with tag and colors, something like
      # printf "\e[1;41mCOMMBASE:\e[1;m I don't understand: %s\n" "$current_request""."   ----> but using the config file variables.
      tmux has-session -t $session_name 2>/dev/null

      if [ $? != 0 ]; then
        echo "Session does not exist. Please create or start the session first."
      else
        if [ "$source_code_display" = "session_pane_six" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_gnome-terminal_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "gnome-terminal -- bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_konsole_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "konsole --hold -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_lxterminal_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "lxterminal -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_kitty_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "kitty -- bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_alacritty_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "alacritty --hold -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_xterm_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "xterm -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        # Add custom displays here ...
      fi
      ;;
    "nodejs")
      if ! command -v node &> /dev/null; then
        echo "Node.js is not installed. Please install it before running this script."
        rm $COMMBASE_APP_DIR/data/.skill_runner
        exit 1
      fi
      tmux has-session -t $session_name 2>/dev/null

      if [ $? != 0 ]; then
        echo "Session does not exist. Please create or start the session first."
      else
        if [ "$source_code_display" = "session_pane_six" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_gnome-terminal_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "gnome-terminal -- bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_konsole_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "konsole --hold -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_lxterminal_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "lxterminal -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_kitty_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "kitty -- bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_alacritty_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "alacritty --hold -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_xterm_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "xterm -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        # Add custom displays here ...
      fi
      ;;
    "python")
      if ! command -v python &> /dev/null; then
        echo "Python is not installed. Please install it before running this script."
        rm $COMMBASE_APP_DIR/data/.skill_runner
        exit 1
      fi
      tmux has-session -t $session_name 2>/dev/null

      if [ $? != 0 ]; then
        echo "Session does not exist. Please create or start the session first."
      else
        if [ "$source_code_display" = "session_pane_six" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_gnome-terminal_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "gnome-terminal -- bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_konsole_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "konsole --hold -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_lxterminal_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "lxterminal -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_kitty_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "kitty -- bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_alacritty_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "alacritty --hold -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        if [ "$source_code_display" = "new_xterm_terminal" ]; then
          tmux send-keys -t $session_name:$window_number.1 "$current_response" 2>/dev/null Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "echo \"$current_response\" | $TTS_ENGINE_STRING" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "xterm -e bash $COMMBASE_APP_DIR/data/.skill_runner &" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "sleep 0.1" Enter
          tmux send-keys -t $session_name:$window_number.$pane_number "clear" Enter
        fi
        # Add custom displays here ...
      fi
      ;;
    # Add custom runtimes here ...
    *)
      echo "Unsupported runtime: $runtime"
      rm $COMMBASE_APP_DIR/data/.skill_runner
      exit 1
      ;;
  esac

  exit 99
}

# Call client_skill if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (client_skill)
fi

exit 99
