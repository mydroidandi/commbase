#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 06/12/2024  Esteban Herrera Original code.                                   #
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

# restart_stt_engine_no_recorder.sh
# Restarts the STT engine based on the value of the variable STT_ENGINE_PATH,
# but does not starts any commbase recorder in case the engine implements one.
# The recorder can be then activated using commands such as 'commbase recorder'.
restart_stt_engine_no_recorder() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # time=
  # declare time
  time=0.3

  # Stop the running STT engine
  # pkill to gracefully terminate the PID, and if that fails, use kill -9.
  pkill -f "$STT_ENGINE_PATH"

  # If running STT engine = commbase_stt_whisper_reactive_p
  if [ "$STT_ENGINE_PATH" = "$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-reactive-p/commbase_stt_whisper_reactive_p.py" ]; then
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

    # Gracefully terminate the recorder-transmitter PID, and if that fails, use kill -9.
    pkill -f "$COMMBASE_APP_DIR/$RECORDER_TRANSMITTER_FILE"

  # If running STT engine = commbase_stt_whisper_proactive_p
  elif [ "$STT_ENGINE_PATH" = "$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-proactive-p/commbase_stt_whisper_proactive_p.py" ]; then
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
    echo "There was an error at restarting the running STT engine."
    echo "Please rerun the script to set up the engine properly."

  fi

  exit 99
}

# Call restart_stt_engine_no_recorder if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (restart_stt_engine_no_recorder)
fi

exit 99
