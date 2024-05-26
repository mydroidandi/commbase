#!/usr/bin/env bash
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

# app.sh
# Creates the Commbase application interface and enters the Commbase session.
app() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Imports from libcommbase
  source "$COMMBASE_APP_DIR"/bundles/libcommbase/libcommbase/routines/check_data_exchange_server_connection.sh
  assistant_discourse=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/assistant_discourse.sh
  store_chat_log_copy=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/store_log_copy.sh
  tail_chat_log=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/tail_chat_log.sh
  text_animation=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/text_animation.sh

  # Give .3 seconds to tmux to draw its content before continuing
  export time=0.3;

  # Kill any existent tmux Commbase session in order to avoid duplicates
  (tmux kill-session -t Commbase-0);

  # Create a new session, detach from it to continue, and sleep
  (tmux new-session -d -t "Commbase" && sleep $time);

  # Activate the conda environment if it exists
  (tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep $time);

  # Enable key bindings with xbindkeys
  (killall xbindkeys && sleep $time)
  (xbindkeys)

  # Create windows and panels

  # Window 0: Commbase
  # Rename the first tmux window, window 0, split it horizontally, and focus the
  # cursor in pane 0 (above).
  (tmux rename-window "Commbase" && tmux split-window -h && tmux select-pane -t 2);

  # Split horizontally the pane 2
  (tmux split-window -v && tmux select-pane -t 2 && sleep $time);

  # Split vertically the pane 2
  (tmux split-window -h && tmux select-pane -t 2 && sleep $time);

  # Split horizontally the pane 2
  (tmux split-window -v && tmux select-pane -t 2 && sleep $time);

  # Split vertically the pane 2
  (tmux split-window -h && tmux select-pane -t 2 && sleep $time);

  # Pane 1
  # On window 0, if the chat file exists and is not empty, save a copy to the
  # CHAT_LOG_FILE. This is to keep a backup copy of the chat progress after
  # events that might have prevented the application from closing gracefully
  # with the 'commbase stop' command.
  if [ -s "$COMMBASE_APP_DIR/$CHAT_LOG_FILE" ]; then
    (bash "$store_chat_log_copy" "chat_log_" "txt")
  fi
  # Select pane 1, open or create the chatroom file
  (tmux select-pane -t 1 && tmux send-keys " touch $COMMBASE_APP_DIR/$CHAT_LOG_FILE" C-m && sleep $time);
  # Run tail_chat_log and then press the enter key
  (tmux select-pane -t 1 && tmux send-keys " clear; bash $tail_chat_log" C-m && sleep $time);

  # Pane 3
  # On window 0, select pane 3, activate the conda environment if it exists,
  # send the enter key, and sleep.
  (tmux select-pane -t 3 && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep $time);
  # Run commbase-data-exchange server and then press enter
  (tmux select-pane -t 3 && tmux send-keys " clear; $PYTHON_ENV_VERSION $COMMBASE_DATA_EXCHANGE_SERVER_CONNECTION_FILE_PATH" C-m && sleep $time);
  # Check the connection to the server before starting the client
  (check_data_exchange_server_connection)

  # Pane 2
  # On window 0, select pane 2, activate the conda environment if it exists,
  # send the enter key, and sleep.
  (tmux select-pane -t 2 && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep $time);
  # Run the STT_ENGINE_STRING and then press the enter
  (tmux select-pane -t 2 && tmux send-keys " clear; cpulimit --limit=$STT_PROCESS_CPU_LIMIT_PERCENTAGE -- $STT_ENGINE_STRING" C-m && sleep $time);
  # Clear the screen, and set the prompt to an empty string
  (tmux select-pane -t 2 && tmux send-keys " clear && PS1=""" C-m);

  # Pane 4
  # On window 0, select pane 4, activate the conda environment if it exists,
  # send the enter key, and sleep.
  (tmux select-pane -t 4 && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep $time);
  # Run commbase-data-exchange client and then press enter
  (tmux select-pane -t 4 && tmux send-keys " clear; $PYTHON_ENV_VERSION $COMMBASE_DATA_EXCHANGE_CLIENT_CONNECTION_FILE_PATH" C-m && sleep $time);

  # Split vertically the pane 4
  (tmux select-pane -t 4 && tmux split-pane -h && sleep $time);

  # Pane 5
  # On window 0, select pane 5, activate the conda environment if it exists,
  # send the enter key, and sleep.
  (tmux select-pane -t 5 && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep $time);
  # Run text_animation and then press enter
  (tmux select-pane -t 5 && tmux send-keys " clear; bash $text_animation '$CURRENT_MODE ($CURRENT_SUB_MODE)' 0.3" C-m && sleep $time);

  # Pane 6
  # On window 0, select pane 6, activate the conda environment if it exists,
  # send the enter key, and sleep.
  (tmux select-pane -t 6 && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep $time);
  # Run alsamixer and then press enter
  (tmux select-pane -t 6 && tmux send-keys " clear; alsamixer --view=capture" C-m);

  # In this section, activate/deactivate or add custom extra windows

  if [ "$TMUX_EXTRA_WINDOWS_ON" = "True" ]; then
    if [ "$TMUX_EXTRA_WINDOW_DASHBOARD_ON" = "True" ]; then
      # Window 1
      # Auto-create a new window 1 for a system dashboard
      (tmux new-window -t Commbase-0:2 -n "Dashboard" && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS ; clear" C-m && sleep $time);
      #tmux select-window -t 2 && tmux send-keys " tclock" C-m;  # The app clock-tui requires Rust with Cargo.
    fi

    if [ "$TMUX_EXTRA_WINDOW_SERVER1_ON" = "True" ];then
      # Window 2
      # Auto-create a new window 2 for a ssh connection to a server 1
      (tmux new-window -t Commbase-0:3 -n "Server 1" && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS ; clear" C-m && sleep $time);
    fi

    if [ "$TMUX_EXTRA_WINDOW_SERVER2_ON" = "True" ];then
      # Window 3
      # Auto-create a new window 3 for a ssh connection to a server 1
      (tmux new-window -t Commbase-0:4 -n "Server 2" && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS ; clear" C-m && sleep $time);
    fi

    if [ "$TMUX_EXTRA_WINDOW_FILES1_ON" = "True" ]; then
      # Window 4
      # Auto-create a new window 4 for a directory/file manager or text editor
      (tmux new-window -t Commbase-0:5 -n "Files 1" && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS ; clear" C-m && sleep $time);
      #tmux select-window -t 4 && tmux send-keys "nnn" C-m
    fi
  fi

  # On window 0, select pane 7, activate the conda environment if it exists,
  # send the enter key, and sleep.
  (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " conda activate $CONDA_ENV_NAME_IF_EXISTS" C-m && sleep $time);

  # Whether the SST engine is commbase-stt-whisper-reactive-p, set up the pane
  # 7 accordingly.
  if [ "$STT_ENGINE_PATH" = "$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-reactive-p/commbase_stt_whisper_reactive_p.py" ]; then

    # Select the recorder-transmitter based on the configuration
    if [ "$RECORDER_TRANSMITTER_FILE" = "$CUSTOM_RECORDER_TRANSMITTER_FILE" ]; then
      # Any custom recorder-transmitter
      (tmux select-pane -t 7 && tmux send-keys " clear; bash $COMMBASE_APP_DIR/$CUSTOM_RECORDER_TRANSMITTER_FILE" C-m && sleep $time);
    elif [ "$RECORDER_TRANSMITTER_FILE" = "bundles/commbase-recorder-transmitter-s/reccomm.sh" ]; then
      # recorder-transmitter for Shell
      (tmux select-pane -t 7 && tmux send-keys " clear; bash $COMMBASE_APP_DIR/bundles/commbase-recorder-transmitter-s/reccomm.sh" C-m && sleep $time);
    else
      # recorder-transmitter for Bash
      (tmux select-pane -t 7 && tmux send-keys " clear; bash $COMMBASE_APP_DIR/bundles/commbase-recorder-transmitter-b/reccomm.sh" C-m && sleep $time);
    fi
  fi

  # Whether the SST engine is commbase-stt-whisper-proactive-p, set up the pane
  # 1 accordingly.
  if [ "$STT_ENGINE_PATH" = "$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-proactive-p/commbase_stt_whisper_proactive_p.py" ]; then

    # Call assistant_discourse with the arguments: pane, i18n, origin,
    # log_severity_level_1, discourse_key.
    (tmux select-pane -t 7 && tmux send-keys " clear; bash \"$assistant_discourse\" \"7\" \"2\" \"app\" \"$LOG_SEVERITY_LEVEL_1\" \"instruction_to_pause_recording\"" C-m && sleep $time);
  fi

  # Enter the Commbase session
  (tmux attach-session -t Commbase-0);

  (exit 99)
}
