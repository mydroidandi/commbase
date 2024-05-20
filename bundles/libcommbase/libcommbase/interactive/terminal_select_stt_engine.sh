#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 05/12/2024  Esteban Herrera Original code.                                   #
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

# terminal_only_select_stt_engine.sh
# Sets up the STT engine based on the value of the variable STT_ENGINE_PATH
terminal_only_select_stt_engine() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # time=
  # declare time
  time=0.3

  # Display the STT engines available
  echo ""
  echo "The STT engines available are:"

  # Find files and store them in an array
  # Populate the array using a while loop with process substitution
  files=()
  while IFS= read -r -d '' file; do
    files+=("$(basename "$file" .py)")
  done < <(find "$COMMBASE_APP_DIR"/bundles -type f -name "commbase_stt_*" -print0)

  # Prompt user to select a file
  echo "Select the STT that you want to use:"
  select file in "${files[@]}"; do
      if [ -n "$file" ]; then
          selected_file="$file"
          break
      else
          echo "Invalid selection. Please try again."
      fi
  done

  echo "You selected: $selected_file"

  # If selected_file = commbase_stt_whisper_reactive_p
  if [ "$selected_file" = "commbase_stt_whisper_reactive_p" ]; then
    # Stop the running STT engine
    # pkill to gracefully terminate the PID, and if that fails, use kill -9.
    pkill -f "$STT_ENGINE_PATH"

    # Overwrite the variable STT_ENGINE_PATH in config/commbase.conf
    sed -i 's#STT_ENGINE_PATH=.*#STT_ENGINE_PATH="$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-reactive-p/commbase_stt_whisper_reactive_p.py"#' "$COMMBASE_APP_DIR"/config/commbase.conf && sleep "$time"

    # Re-source the configuration file to apply the changes
    source "$COMMBASE_APP_DIR"/config/commbase.conf

    # On window 0, select pane 2, activate the conda environment if it exists,
    # send the enter key, and sleep.
    (tmux select-window -t 1 && tmux select-pane -t 2 && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep "$time");
    # Run the STT_ENGINE_STRING and then press the enter
    (tmux select-window -t 1 && tmux select-pane -t 2 && tmux send-keys " clear; cpulimit --limit=$STT_PROCESS_CPU_LIMIT_PERCENTAGE -- $STT_ENGINE_STRING" C-m && sleep "$time");
    # Clear the screen, and set the prompt to an empty string
    (tmux select-window -t 1 && tmux select-pane -t 2 && tmux send-keys " clear && PS1=""" C-m);

    # Return the cursor to the Pane 7
    (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear" C-m);

    # Select the recorder-transmitter based on the configuration
    if [ "$RECORDER_TRANSMITTER_FILE" = "$CUSTOM_RECORDER_TRANSMITTER_FILE" ]; then
      # Any custom recorder-transmitter
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; bash $COMMBASE_APP_DIR/$CUSTOM_RECORDER_TRANSMITTER_FILE" C-m);
    elif [ "$RECORDER_TRANSMITTER_FILE" = "bundles/commbase-recorder-transmitter-s/reccomm.sh" ]; then
      # recorder-transmitter for Shell
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; bash $COMMBASE_APP_DIR/bundles/commbase-recorder-transmitter-s/reccomm.sh" C-m);
    else
      # recorder-transmitter for Bash
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; bash $COMMBASE_APP_DIR/bundles/commbase-recorder-transmitter-b/reccomm.sh" C-m);
    fi

  # If selected_file = commbase_stt_whisper_proactive_p
  elif [ "$selected_file" = "commbase_stt_whisper_proactive_p" ]; then
    # Stop the running STT engine
    # pkill to gracefully terminate the PID, and if that fails, use kill -9.
    pkill -f "$STT_ENGINE_PATH"

    # Overwrite the variable STT_ENGINE_PATH in config/commbase.conf
    sed -i 's#STT_ENGINE_PATH=.*#STT_ENGINE_PATH="$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-proactive-p/commbase_stt_whisper_proactive_p.py"#' "$COMMBASE_APP_DIR"/config/commbase.conf && sleep "$time"

    # Re-source the configuration file to apply the changes
    source "$COMMBASE_APP_DIR"/config/commbase.conf

    # On window 0, select pane 2, activate the conda environment if it exists,
    # send the enter key, and sleep.
    (tmux select-window -t 1 && tmux select-pane -t 2 && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep "$time");
    # Run the STT_ENGINE_STRING and then press the enter
    (tmux select-window -t 1 && tmux select-pane -t 2 && tmux send-keys " clear; cpulimit --limit=$STT_PROCESS_CPU_LIMIT_PERCENTAGE -- $STT_ENGINE_STRING" C-m && sleep "$time");
    # Clear the screen, and set the prompt to an empty string
    (tmux select-window -t 1 && tmux select-pane -t 2 && tmux send-keys " clear && PS1=""" C-m);

    # Return the cursor to the Pane 7
    (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear" C-m);

  # Add more STT engines here ...

  else
    echo "The selected STT engine '$selected_file' is not recognized or supported."
    echo "Please rerun the script to select a valid STT engine or add and set up the new engine properly."

  fi

  exit 99
}

# Call terminal_only_select_stt_engine if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (terminal_only_select_stt_engine)
fi

exit 99
