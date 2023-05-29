#!/usr/bin/env bash
################################################################################
#                                   Commbase                                   #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
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

# reset_commbase.conf.sh
# Restores the file config/commbase.conf to its inital status.

# Copy the content of cat
cd ../../config/
touch app.conf
cat <<EOT > commbase.conf
PYTHON_ENV_VERSION="python"
STT_PROCESS_CPU_LIMIT_PERCENTAGE="75"
CONDA_ENV_NAME_IF_EXISTS="commbase_env"
IP_ADDRESS_UPDATE_IN_SECS="600"
MY_APP_AUDIO_CAPTURE_DEVICE_NAME="alsa_input.usb-_Webcam_C170-02.mono-fallback"
SYSTEM_AUDIO_CAPTURE_DEVICE_NAME="alsa_input.pci-0000_00_1b.0.analog-stereo"
VIDEO_CAPTURE_DEVICE_01_INDEX="0"
VIDEO_CAPTURE_DEVICE_02_INDEX="1"
STT_ENGINE_STRING="$PYTHON_ENV_VERSION $COMMBASE_APP_DIR/bundles/built-in/broker/commbase-stt-vosk-p/commbase_stt_vosk_p.py"
TTS_ENGINE_STRING="festival --tts"
TMUX_EXTRA_WINDOWS_ON="True"
TMUX_EXTRA_WINDOW_EDITOR_ON="True"
TMUX_EXTRA_WINDOW_TIMER=_ON"True"
TMUX_EXTRA_WINDOW_SERVER1_ON="True"
TMUX_EXTRA_WINDOW_SERVER2_ON="False"
TERMINAL_RED_BACKGROUND_COLOR_CODE_START="1;41m"
TERMINAL_GREEN_BACKGROUND_COLOR_CODE_START="1;42m"
TERMINAL_YELLOW_BACKGROUND_COLOR_CODE_START="1;43m"
TERMINAL_BLUE_BACKGROUND_COLOR_CODE_START="1;44m"
TERMINAL_MAGENTA_BACKGROUND_COLOR_CODE_START="1;45m"
TERMINAL_CYAN_BACKGROUND_COLOR_CODE_START="1;46m"
TERMINAL_WHITE_BACKGROUND_COLOR_CODE_START="1;47m"
TERMINAL_BLACK_BACKGROUND_COLOR_CODE_START="1;40m"
TERMINAL_RED_TEXT_COLOR_CODE_START="31m"
TERMINAL_GREEN_TEXT_COLOR_CODE_START="32m"
TERMINAL_YELLOW_TEXT_COLOR_CODE_START="33m"
TERMINAL_BLUE_TEXT_COLOR_CODE_START="34m"
TERMINAL_MAGENTA_TEXT_COLOR_CODE_START="35m"
TERMINAL_CYAN_TEXT_COLOR_CODE_START="36m"
TERMINAL_WHITE_TEXT_COLOR_CODE_START="37m"
TERMINAL_BLACK_TEXT_COLOR_CODE_START="30m"
TERMINAL_COLOR_CODE_END="1;0m"
END_USER_BACKGROUND_COLOR_IN_CHAT_PANE="blue"
ASSISTANT_BACKGROUND_COLOR_IN_CHAT_PANE="green"
SYSTEM_BACKGROUND_COLOR_IN_CHAT_PANE="white"
END_USER_TEXT_COLOR_IN_CHAT_PANE="white"
ASSISTANT_TEXT_COLOR_IN_CHAT_PANE="white"
SYSTEM_TEXT_COLOR_IN_CHAT_PANE="red"
ASSISTANT_AVATAR_COLOR_IN_CHAT_PANE="cyan"
END_USER_NAME_IN_CHAT_PANE="END USER"
ASSISTANT_NAME_IN_CHAT_PANE="COMMBASE"
SYSTEM_VISIBLE_IN_CHAT_PANE_ON="False"
SYSTEM_NAME_IN_CHAT_PANE="SYSTEM"
MANAGE_RESULT_MESSAGE_ON_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON="True"
VOSK_ML_MODEL_DIRECTORY="/bundles/built-in/broker/vosk/models/vosk-model-en-us-0.22-lgraph/model"
SECRETS_FILE_PATH="/config/secrets"
ASCII_ART_FILE_PATH="/assets/ascii/avatar.asc"
ASSISTANT_MICROPHONE_INSTRUCTION_FILE="/bundles/built-in/broker/libcommbase/resources/discourses/mute_the_microphone_to_pause_the_recording_instruction"
RESULT_MESSAGE_RECORDING_FILE="/data/.result_message.json"
PREVIOUS_RESULT_MESSAGE_RECORDING_FILE="/data/.previous_result_message.json"
RESULT_MESSAGES_HISTORY_FILE="/history/.result_messages_history"
CONTROL_STOP_PREVIOUS_COMMAND_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_stop_patterns"
CONTROL_ACCEPT_CHANGES_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_accept_patterns"
CONTROL_DENY_CHANGES_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_deny_patterns"
CONTROL_SELECT_OPTION_NUMBER_ONE_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_select_the_option_number_one_patterns"
CONTROL_SELECT_OPTION_NUMBER_TWO_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_select_the_option_number_two_patterns"
CONTROL_SELECT_OPTION_NUMBER_THREE_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_select_the_option_number_three_patterns"
CONTROL_SELECT_OPTION_NUMBER_FOUR_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_select_the_option_number_four_patterns"
CONTROL_SKIP_QUESTION_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_skip_that_question_patterns"
CONTROL_REQUEST_THE_CURRENT_MODE_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_which_mode_are_you_in_patterns"
CONTROL_ENTER_THE_NORMAL_MODE_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_enter_the_normal_mode_patterns"
CONTROL_ENTER_THE_CONVERSATIONAL_MODE_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_enter_the_conversational_mode_patterns"
CONTROL_ENTER_THE_EXPERT_MODE_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_enter_the_expert_mode_patterns"
CONTROL_ENTER_THE_FOLLOW_UP_MODE_PATTERNS_FILE="/bundles/built-in/broker/libcommbase/resources/control_patterns/okay_enter_the_follow_up_mode_patterns"
EXTERNAL_STORAGE_DRIVE_01_TAG="WD1"
EXTERNAL_STORAGE_DRIVE_02_TAG="WD2"
DEV_PROJECT_DIRECTORY_NAME="YOUR_DEV_PROJECT_DIRECTORY_NAME_HERE"
EOT

exit 99

