################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 05/02/2023  Esteban Herrera Original code.                                   #
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

# controller
# Parses messages saved in JSON object format files by the STT engine, searching
# for the messages that match control patterns. The recognized text is then
# saved in JSON files.
# In case the STT engine is commbase-stt-vosk-p, it requires the configuration
# variable COMMBASE_STT_VOSK_P_PARSE_CONTROL_MESSAGES_ON set to "False".
controller() {
	# The app configuration file
	source $COMMBASE_APP_DIR/config/app.conf

	# The function that reads the lines from the control message pattern files
	source $COMMBASE_APP_DIR/bundles/built-in/broker/libcommbase/libcommbase/routines/read_lines_from_file

	# Read a whole file into a variable
	json_object=$(<$COMMBASE_APP_DIR$CONTROLLER_MESSAGE_RECORDING_FILE);

	# Extract message from the JSON object
	new_message=$(echo $json_object | jq --raw-output '."message"');

	# Set the control message pattern file paths from the environment config file
	control_stop_previous_command_patterns_file=$COMMBASE_APP_DIR$CONTROL_STOP_PREVIOUS_COMMAND_PATTERNS_FILE;
	control_accept_changes_patterns_file=$COMMBASE_APP_DIR$CONTROL_ACCEPT_CHANGES_PATTERNS_FILE;
	control_deny_changes_patterns_file=$COMMBASE_APP_DIR$CONTROL_DENY_CHANGES_PATTERNS_FILE;
	control_select_option_number_one_patterns_file=$COMMBASE_APP_DIR$CONTROL_SELECT_OPTION_NUMBER_ONE_PATTERNS_FILE;
	control_select_option_number_two_patterns_file=$COMMBASE_APP_DIR$CONTROL_SELECT_OPTION_NUMBER_TWO_PATTERNS_FILE;
	control_select_option_number_three_patterns_file=$COMMBASE_APP_DIR$CONTROL_SELECT_OPTION_NUMBER_THREE_PATTERNS_FILE;
	control_select_option_number_four_patterns_file=$COMMBASE_APP_DIR$CONTROL_SELECT_OPTION_NUMBER_FOUR_PATTERNS_FILE;
	control_skip_question_patterns_file=$COMMBASE_APP_DIR$CONTROL_SKIP_QUESTION_PATTERNS_FILE;
	control_request_the_current_mode_patterns_file=$COMMBASE_APP_DIR$CONTROL_REQUEST_THE_CURRENT_MODE_PATTERNS_FILE;
	control_enter_the_normal_mode_patterns_file=$COMMBASE_APP_DIR$CONTROL_ENTER_THE_NORMAL_MODE_PATTERNS_FILE;
	control_enter_the_conversation_mode_patterns_file=$COMMBASE_APP_DIR$CONTROL_ENTER_THE_CONVERSATION_MODE_PATTERNS_FILE;
	control_enter_the_expert_mode_patterns_file=$COMMBASE_APP_DIR$CONTROL_ENTER_THE_EXPERT_MODE_PATTERNS_FILE;
	control_enter_the_follow_mode_patterns_file=$COMMBASE_APP_DIR$CONTROL_ENTER_THE_FOLLOW_MODE_PATTERNS_FILE;

	# Load all the control pattern files in variables
	control_stop_previous_command_patterns=$(read_lines_from_file $control_stop_previous_command_patterns_file);
	control_accept_changes_patterns=$(read_lines_from_file $control_accept_changes_patterns_file);
	control_deny_changes_patterns=$(read_lines_from_file $control_deny_changes_patterns_file);
	control_select_option_number_one_patterns=$(read_lines_from_file $control_select_option_number_one_patterns_file);
	control_select_option_number_two_patterns=$(read_lines_from_file $control_select_option_number_two_patterns_file);
	control_select_option_number_three_patterns=$(read_lines_from_file $control_select_option_number_three_patterns_file);
	control_select_option_number_four_patterns=$(read_lines_from_file $control_select_option_number_four_patterns_file);
	control_skip_question_patterns=$(read_lines_from_file $control_skip_question_patterns_file);
	control_request_the_current_mode_patterns=r$(read_lines_from_file $control_request_the_current_mode_patterns_file);
	control_enter_the_normal_mode_patterns=$(read_lines_from_file $control_enter_the_normal_mode_patterns_file);
	control_enter_the_conversation_mode_patterns=r$(read_lines_from_file $control_enter_the_conversation_mode_patterns_file);
	control_enter_the_expert_mode_patterns=$(read_lines_from_file $control_enter_the_expert_mode_patterns_file);
	control_enter_the_follow_mode_patterns=$(read_lines_from_file $control_enter_the_follow_mode_patterns_file);

	# In case the message includes a control, replace it with a control message

	# If new_message is not empty
	if [[ -n $new_message ]]; then
		# Check if the pattern contained in $new_message is present in the control
		# patterns variable.
		if echo "$control_stop_previous_command_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_STOP_PREVIOUS_COMMAND\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_accept_changes_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_ACCEPT_CHANGES\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_deny_changes_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_DENY_CHANGES\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_select_option_number_one_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_SELECT_OPTION_NUMBER_ONE\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_select_option_number_two_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_SELECT_OPTION_NUMBER_TWO\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_select_option_number_three_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_SELECT_OPTION_NUMBER_THREE\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_select_option_number_four_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_SELECT_OPTION_NUMBER_FOUR\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_skip_question_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_SKIP_QUESTION\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_request_the_current_mode_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_REQUEST_THE_CURRENT_MODE\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_enter_the_normal_mode_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_ENTER_THE_NORMAL_MODE\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_enter_the_conversation_mode_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_ENTER_THE_CONVERSATION_MODE\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_enter_the_expert_mode_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_ENTER_THE_EXPERT_MODE\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		elif echo "$control_enter_the_follow_mode_patterns" | grep -q "$new_message"; then
			# Create the JSON object
			json_data="{\"control\": \"CONTROL_ENTER_THE_FOLLOW_MODE\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		else
			# Create the JSON object
			json_data="{\"message\": \"$new_message\"}";
			# Record the control message string as a JSON object
			(echo "$json_data" > $COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE);
			(echo "$json_data" > $COMMBASE_APP_DIR$PREVIOUS_RESULT_MESSAGE_RECORDING_FILE);
			# Manage the result message
			(bash "$COMMBASE_APP_DIR/src/skill");
		fi
	fi

	exit 99
}

# Call controller if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	(controller)
fi

exit 99

