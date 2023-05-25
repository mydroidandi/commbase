#!/usr/bin/env python
################################################################################
#                               commbase-stt-vosk                              #
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

# commbase-stt-vosk-p.py
# This is a speech recognition program that uses the Vosk library. It takes
# audio input, processes it, and outputs the recognized text. The recognized
# text is then cleaned up, and saved in files.
# Requires a minimun version of python3.7 for running the code correctly.

# Requirements
import argparse
import os.path
import queue
import string
import subprocess
import sys

import sounddevice as sd
import vosk

from functions import (
    read_plain_text_file,
    read_lines_from_file,
    load_config_file,
    int_or_str,
    find_text,
    strip_string,
    get_chat_participant_names,
    get_tts_engine_string,
)
from text_formatting import (
    get_terminal_colors,
    get_chat_participant_colors,
    get_assistant_avatar_color,
    set_end_user_background_color,
    set_assistant_user_background_color,
    set_system_user_background_color,
    set_end_user_text_color,
    set_assistant_user_text_color,
    set_system_user_text_color,
    set_assistant_avatar_color,
)


def commbase_stt_vosk_p():
	"""
	Takes audio input, processes it, and outputs the recognized text. The 
	recognized text is then cleaned up, and saved in files.
	"""

	def callback(indata, frames, time, status):
		"""
		This function is called (from a separate thread) for each audio block.

		This function puts the input data into a queue for processing.
		If the status parameter is not None, it prints an error message to the
		standard error stream.

		Parameters:
			  indata : numpy.ndarray
			      The input audio data as a NumPy array.
			  frames : int
			      The number of frames in the input data.
			  time : CData
			      A ctypes structure containing timing information about the input
			      data.
			  status : CallbackFlags
			      A flag that indicates the status of the input data.

		Returns:
			   None.
		"""
		if status:
			print(status, file=sys.stderr)
		q.put(bytes(indata))


	def display_assistant_avatar():
			"""
			Displays the assistant avatar in the terminal.

			This function retrieves the ASCII art avatar of the assistant, assigns the
			appropriate color based on the configured avatar color, and then prints it
			to the terminal.

			Note:
					The color codes used in the avatar display are obtained from the
					`get_terminal_colors()` function.
					The avatar color is obtained from the `get_assistant_avatar_color()`
					function.
					The ASCII art avatar is obtained from the `get_assistant_avatar()`
					function.

			Example:
					Terminal output:

					>>> display_assistant_avatar()
					[COLOR CODES] ASCII ART [RESET]
			"""
			# Load an ASCII art file, store its content in a variable, and then print it
			# in a specific color using terminal escape sequences.
			assistant_avatar = read_plain_text_file(ASCII_FILE_PATH)
			print(f'\033[{avatar_color_start}\033[{assistant_avatar}\033[{color_code_end}')


	def print_result():
		"""
		Prints the result on the screen and write to files.

		Parameters:
			  None.

		Returns:
			  None.
		"""
		# The original result
		string = rec.Result()
		
		# The modified result
		trimmed_string = strip_string(string)
		
		# The control signal and END USER message matching
		found_match = False

		if trimmed_string != '' and trimmed_string != 'ok':
			# Print the END USER user message in the chat pane
			print(f'\033[{end_user_background_color_start}\033[{end_user_text_color_start}{end_user_name}:\033[{color_code_end}\033[{color_code_end}\033[{end_user_text_color_start} {trimmed_string}.\033[{color_code_end}')

			# Attempt to match the END USER user message and the existent control
			# signals.

			# CONTROL_TO_STOP_PREVIOUS_COMMAND
			for line in control_to_stop_previous_command_patterns:
				# If END USER message matches the control signal, print an ASSISTANT
				# message with the corrected version of the user's message.
				if trimmed_string == line.strip():
					print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_STOP_PREVIOUS_COMMAND}" for processing.\033[{color_code_end}')
					# Record the control signal string to MESSAGE_FILE
					with open(MESSAGE_FILE, 'w') as f:
						f.write(CONTROL_TO_STOP_PREVIOUS_COMMAND)
					found_match = True
					if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
						# Manage the result message
						subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_ACCEPT_CHANGES
			if not found_match:
				for line in control_to_accept_changes_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_ACCEPT_CHANGES}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_ACCEPT_CHANGES)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			#	CONTROL_TO_DENY_CHANGES
			if not found_match:
				for line in control_to_deny_changes_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_DENY_CHANGES}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_DENY_CHANGES)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_SELECT_OPTION_NUMBER_ONE
			if not found_match:
				for line in control_to_select_option_number_one_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_SELECT_OPTION_NUMBER_ONE}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_SELECT_OPTION_NUMBER_ONE)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_SELECT_OPTION_NUMBER_TWO
			if not found_match:
				for line in control_to_select_option_number_two_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_SELECT_OPTION_NUMBER_TWO}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_SELECT_OPTION_NUMBER_TWO)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_SELECT_OPTION_NUMBER_THREE
			if not found_match:
				for line in control_to_select_option_number_three_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_SELECT_OPTION_NUMBER_THREE}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_SELECT_OPTION_NUMBER_THREE)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_SELECT_OPTION_NUMBER_FOUR
			if not found_match:
				for line in control_to_select_option_number_four_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_SELECT_OPTION_NUMBER_FOUR}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_SELECT_OPTION_NUMBER_FOUR)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_SKIP_QUESTION
			if not found_match:
				for line in control_to_skip_question_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_SKIP_QUESTION}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_SKIP_QUESTION)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_REQUEST_CURRENT_MODE
			if not found_match:
				for line in control_to_request_current_mode_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_REQUEST_CURRENT_MODE}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_REQUEST_CURRENT_MODE)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_ENTER_NORMAL_MODE
			if not found_match:
				for line in control_to_enter_normal_mode_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_ENTER_NORMAL_MODE}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_ENTER_NORMAL_MODE)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_ENTER_CONVERSATIONAL_MODE
			if not found_match:
				for line in control_to_enter_conversational_mode_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_ENTER_CONVERSATIONAL_MODE}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_ENTER_CONVERSATIONAL_MODE)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_ENTER_EXPERT_MODE
			if not found_match:
				for line in control_to_enter_expert_mode_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_ENTER_EXPERT_MODE}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_ENTER_EXPERT_MODE)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# CONTROL_TO_ENTER_FOLLOW_UP_MODE
			if not found_match:
				for line in control_to_enter_follow_up_mode_patterns:
					# If END USER message matches the control signal, print an ASSISTANT
					# message with the corrected version of the user's message.
					if trimmed_string == line.strip():
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" as control "{CONTROL_TO_ENTER_FOLLOW_UP_MODE}" for processing.\033[{color_code_end}')
						# Record the control signal string to MESSAGE_FILE
						with open(MESSAGE_FILE, 'w') as f:
							f.write(CONTROL_TO_ENTER_FOLLOW_UP_MODE)
						found_match = True
						if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

			# Fallback to dispatch the message as it was originally
			if not found_match:
				# Record a normal END USER message instead of a control signal message
				print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" for processing.\033[{color_code_end}')
				# Record the trimmed_string data to MESSAGE_FILE and PREVIOUS_MESSAGE_FILE
				with open(MESSAGE_FILE, 'w') as f:
					f.write(trimmed_string)
				with open(PREVIOUS_MESSAGE_FILE, 'w') as f:
					f.write(trimmed_string)
				if MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON == "True":
					# Manage the result message
					subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])


	# Create ArgumentParser object with add_help=False to disable default help
	# message.
	parser = argparse.ArgumentParser(add_help=False)

	# Add a command-line argument for listing audio devices
	parser.add_argument(
		'-l', '--list-devices', action='store_true', # store_true indicates that the argument does not require a value and sets it to True if present
		help='show list of audio devices and exit'
	)

	# Parse the command-line arguments, with any unrecognized arguments returned
	# as a list in 'remaining'.
	args, remaining = parser.parse_known_args()

	# If the 'list-devices' argument was passed, print the list of audio devices
	# and exit the program.
	if args.list_devices:
		print(sd.query_devices())
		parser.exit(0) # exit the program with status code 0

	# create a new ArgumentParser object with a description and formatter
	parser = argparse.ArgumentParser(
		description=__doc__, # use the script's docstring as the description
		formatter_class=argparse.RawDescriptionHelpFormatter, # use a raw formatter for the description
		parents=[parser] # inherit the 'list-devices' argument from the previous parser
	)

	# Add additional arguments for specifying a filename, model path, input
	# device, and sampling rate.
	parser.add_argument(
		'-f', '--filename', type=str, metavar='FILENAME',
		help='audio file to store recording to'
	)
	parser.add_argument(
		'-m', '--model', type=str, metavar='MODEL_PATH',
		help='Path to the model'
	)
	parser.add_argument(
		'-d', '--device', type=int_or_str,
		help='input device (numeric ID or substring)'
	)
	parser.add_argument(
		'-r', '--samplerate', type=int, help='sampling rate'
	)

	# Parse the remaining command-line arguments
	args = parser.parse_args(remaining)


	try:
		if args.model is None:
			args.model = string.Template(ML_MODEL).substitute(os.environ)
		if not os.path.exists(args.model):
			print ("Please download a model for your language from https://alphacephei.com/vosk/models")
			print ("and unpack as 'model' in the current folder.")
			parser.exit(0)
		if args.samplerate is None:
			device_info = sd.query_devices(args.device, 'input')
			# soundfile expects an int, sounddevice provides a float:
			args.samplerate = int(device_info['default_samplerate'])

		model = vosk.Model(args.model)

		if args.filename:
			dump_fn = open(args.filename, "wb")
		else:
			dump_fn = None

		with sd.RawInputStream(samplerate=args.samplerate, blocksize = 8000, device=args.device, dtype='int16',
	channels=1, callback=callback):

			# Get colors
	
			# Assign the values returned by get_terminal_colors()
			red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

			# Assign the values returned by get_chat_participant_colors()
			end_user_background_color, assistant_background_color, system_background_color, end_user_text_color, assistant_text_color, system_text_color = get_chat_participant_colors()

			# Assign the values returned by get_assistant_avatar_color()
			avatar_color = get_assistant_avatar_color()

			# Get names and strings

			# Assign the values returned by get_chat_participant_names()
			end_user_name, assistant_name, system_name = get_chat_participant_names()
			
			# Assign the values returned by get_tts_engine_string()
			tts_engine_str = get_tts_engine_string()

			# Preload all the engine pattern files

			# CONTROL_TO_STOP_PREVIOUS_COMMAND
			# Load the patterns file and store its content in a variable
			control_to_stop_previous_command_patterns = read_lines_from_file(CONTROL_TO_STOP_PREVIOUS_COMMAND_PATTERNS_FILE)

			# CONTROL_TO_ACCEPT_CHANGES
			# Load the patterns file and store its content in a variable
			control_to_accept_changes_patterns = read_lines_from_file(CONTROL_TO_ACCEPT_CHANGES_PATTERNS_FILE)

			#	CONTROL_TO_DENY_CHANGES
			# Load the patterns file and store its content in a variable
			control_to_deny_changes_patterns = read_plain_text_file(CONTROL_TO_DENY_CHANGES_PATTERNS_FILE)

			#	CONTROL_TO_SELECT_OPTION_NUMBER_ONE
			# Load the patterns file and store its content in a variable
			control_to_select_option_number_one_patterns = read_plain_text_file(CONTROL_TO_SELECT_OPTION_NUMBER_ONE_PATTERNS_FILE)

			#	CONTROL_TO_SELECT_OPTION_NUMBER_TWO
			# Load the patterns file and store its content in a variable
			control_to_select_option_number_two_patterns = read_plain_text_file(CONTROL_TO_SELECT_OPTION_NUMBER_TWO_PATTERNS_FILE)

			#	CONTROL_TO_SELECT_OPTION_NUMBER_THREE
			# Load the patterns file and store its content in a variable
			control_to_select_option_number_three_patterns = read_plain_text_file(CONTROL_TO_SELECT_OPTION_NUMBER_THREE_PATTERNS_FILE)

			#	CONTROL_TO_SELECT_OPTION_NUMBER_FOUR
			# Load the patterns file and store its content in a variable
			control_to_select_option_number_four_patterns = read_plain_text_file(CONTROL_TO_SELECT_OPTION_NUMBER_FOUR_PATTERNS_FILE)

			#	CONTROL_TO_SKIP_QUESTION
			# Load the patterns file and store its content in a variable
			control_to_skip_question_patterns = read_plain_text_file(CONTROL_TO_SKIP_QUESTION_PATTERNS_FILE)

			#	CONTROL_TO_REQUEST_CURRENT_MODE
			# Load the patterns file and store its content in a variable
			control_to_request_current_mode_patterns = read_plain_text_file(CONTROL_TO_REQUEST_CURRENT_MODE_PATTERNS_FILE)

			#	CONTROL_TO_ENTER_NORMAL_MODE
			# Load the patterns file and store its content in a variable
			control_to_enter_normal_mode_patterns = read_plain_text_file(CONTROL_TO_ENTER_NORMAL_MODE_PATTERNS_FILE)

			#	CONTROL_TO_ENTER_CONVERSATIONAL_MODE
			# Load the patterns file and store its content in a variable
			control_to_enter_conversational_mode_patterns = read_plain_text_file(CONTROL_TO_ENTER_CONVERSATIONAL_MODE_PATTERNS_FILE)

			#	CONTROL_TO_ENTER_EXPERT_MODE
			# Load the patterns file and store its content in a variable
			control_to_enter_expert_mode_patterns = read_plain_text_file(CONTROL_TO_ENTER_EXPERT_MODE_PATTERNS_FILE)

			#	CONTROL_TO_ENTER_FOLLOW_UP_MODE
			# Load the patterns file and store its content in a variable
			control_to_enter_follow_up_mode_patterns = read_plain_text_file(CONTROL_TO_ENTER_FOLLOW_UP_MODE_PATTERNS_FILE)

			# Set colors

			# Set the background color for the end user
			end_user_background_color_start = set_end_user_background_color(end_user_background_color)

			# Set the background color for the assistant user
			assistant_background_color_start = set_assistant_user_background_color(assistant_background_color)

			# Set the background color for the system user
			system_background_color_start = set_system_user_background_color(system_background_color)

			# Set the text color for the end user
			end_user_text_color_start = set_end_user_text_color(end_user_text_color)

			# Set the text color for the assistant user
			assistant_text_color_start = set_assistant_user_text_color(assistant_text_color)

			# Set the text color for the system user
			system_text_color_start = set_system_user_text_color(system_text_color)

			# Set the color of the assistant's avatar
			avatar_color_start = set_assistant_avatar_color(avatar_color)

			# Show avatar

			# Display the assitant avatar
			display_assistant_avatar()

			# Read the content of a file that provides instructions about muting the
			# microphone to pause recording. It then prints the content, including the
			# formatted assistant name and colors.
			discourse = read_plain_text_file(INSTRUCTION_FILE_PATH)
			print(f'\n\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} {discourse}\033[{color_code_end}')
			# TODO: Replace system commands with new libcommbase routines mute and unmute
			# Mute the microphone before the assistant speaks
			subprocess.run('(amixer set Capture nocap)', stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, shell=True)
			# Tell the end user to mute the microphone to pause the recording
			subprocess.run(f'(echo "{discourse}" | {tts_engine_str})', shell=True)
			# Unmute the microphone after the assistant speaks
			subprocess.run('(amixer set Capture cap)', stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, shell=True)

			# Create a new instance of the KaldiRecognizer class from the Vosk library
			rec = vosk.KaldiRecognizer(model, args.samplerate)

			while True:
			  data = q.get()
			  if rec.AcceptWaveform(data):
			    print_result()
			  #else:
			    #print(rec.PartialResult())
			  if dump_fn is not None:
			    dump_fn.write(data)


	except KeyboardInterrupt:
		print('\nDone')
		parser.exit(0)
	except Exception as e:
		parser.exit(type(e).__name__ + ': ' + str(e))


def main():
	"""
	Entry point of the program.

	This function serves as the entry point for the program. It is responsible for
	initiating the execution of the program and coordinating the different
	components or functions within it.
	
	Usage:
    - Ensure that all required dependencies are installed before running this
    program.
    - Run this script using the Python interpreter: `commbase-stt-vosk-p.py`

	Paramenters:
			None

	Returns:
  		None
	"""
	# Global declarations
	global CONFIG_FILE_PATH, ASCII_FILE_PATH, INSTRUCTION_FILE_PATH, ML_MODEL, MESSAGE_FILE, PREVIOUS_MESSAGE_FILE, MESSAGING_HISTORY_FILE, MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON

	global CONTROL_TO_STOP_PREVIOUS_COMMAND_PATTERNS_FILE
	global CONTROL_TO_ACCEPT_CHANGES_PATTERNS_FILE
	global CONTROL_TO_DENY_CHANGES_PATTERNS_FILE
	global CONTROL_TO_SELECT_OPTION_NUMBER_ONE_PATTERNS_FILE
	global CONTROL_TO_SELECT_OPTION_NUMBER_TWO_PATTERNS_FILE
	global CONTROL_TO_SELECT_OPTION_NUMBER_THREE_PATTERNS_FILE
	global CONTROL_TO_SELECT_OPTION_NUMBER_FOUR_PATTERNS_FILE
	global CONTROL_TO_SKIP_QUESTION_PATTERNS_FILE
	global CONTROL_TO_REQUEST_CURRENT_MODE_PATTERNS_FILE
	global CONTROL_TO_ENTER_NORMAL_MODE_PATTERNS_FILE
	global CONTROL_TO_ENTER_CONVERSATIONAL_MODE_PATTERNS_FILE
	global CONTROL_TO_ENTER_EXPERT_MODE_PATTERNS_FILE
	global CONTROL_TO_ENTER_FOLLOW_UP_MODE_PATTERNS_FILE

	global CONTROL_TO_STOP_PREVIOUS_COMMAND
	global CONTROL_TO_ACCEPT_CHANGES
	global CONTROL_TO_DENY_CHANGES
	global CONTROL_TO_SELECT_OPTION_NUMBER_ONE
	global CONTROL_TO_SELECT_OPTION_NUMBER_TWO
	global CONTROL_TO_SELECT_OPTION_NUMBER_THREE
	global CONTROL_TO_SELECT_OPTION_NUMBER_FOUR
	global CONTROL_TO_SKIP_QUESTION
	global CONTROL_TO_REQUEST_CURRENT_MODE
	global CONTROL_TO_ENTER_NORMAL_MODE
	global CONTROL_TO_ENTER_CONVERSATIONAL_MODE
	global CONTROL_TO_ENTER_EXPERT_MODE
	global CONTROL_TO_ENTER_FOLLOW_UP_MODE

	global q

	# The path of the env configuration file
	CONFIG_FILE_PATH = load_config_file()

	# The path of the ASCII art file for the avatar
	ASCII_FILE_PATH = os.environ["COMMBASE_APP_DIR"] + '/assets/ascii/avatar.asc'

	# The path of the instruction file
	INSTRUCTION_FILE_PATH = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/libcommbase/resources/discourses/mute_the_microphone_to_pause_the_recording_instruction'

	# The path to the ML model
	ML_MODEL = '$COMMBASE_APP_DIR/bundles/built-in/broker/vosk/model'
	#print (string.Template(ML_MODEL).substitute(os.environ))

	# Output files
	MESSAGE_FILE = os.environ["COMMBASE_APP_DIR"] + '/data/.message.dat'
	PREVIOUS_MESSAGE_FILE = os.environ["COMMBASE_APP_DIR"] + '/data/.previous_message.dat'
	MESSAGING_HISTORY_FILE = os.environ["COMMBASE_APP_DIR"] + '/history/.messaging_history'

	# Set to True, it outputs current skills error messages or new "custom skills"
	# error messages in the chat pane or any other pane.
	MANAGE_RESULT_MESSAGE_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON = "False"

	# The path of the control signal pattern files
	CONTROL_TO_STOP_PREVIOUS_COMMAND_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_stop_patterns'
	CONTROL_TO_ACCEPT_CHANGES_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_accept_patterns'
	CONTROL_TO_DENY_CHANGES_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_deny_patterns'
	CONTROL_TO_SELECT_OPTION_NUMBER_ONE_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_select_the_option_number_one_patterns'
	CONTROL_TO_SELECT_OPTION_NUMBER_TWO_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_select_the_option_number_two_patterns'
	CONTROL_TO_SELECT_OPTION_NUMBER_THREE_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_select_the_option_number_three_patterns'
	CONTROL_TO_SELECT_OPTION_NUMBER_FOUR_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_select_the_option_number_four_patterns'
	CONTROL_TO_SKIP_QUESTION_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_skip_that_question_patterns'	
	CONTROL_TO_REQUEST_CURRENT_MODE_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_which_mode_are_you_in_patterns'
	CONTROL_TO_ENTER_NORMAL_MODE_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_enter_the_normal_mode_patterns'
	CONTROL_TO_ENTER_CONVERSATIONAL_MODE_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_enter_the_convesational_mode_patterns'
	CONTROL_TO_ENTER_EXPERT_MODE_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_enter_the_expert_mode_patterns'
	CONTROL_TO_ENTER_FOLLOW_UP_MODE_PATTERNS_FILE = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/commbase-stt-vosk-p/resources/control_patterns/okay_enter_the_follow_up_mode_patterns'

	# The controls
	CONTROL_TO_STOP_PREVIOUS_COMMAND = "okay stop"
	CONTROL_TO_ACCEPT_CHANGES = "okay accept"
	CONTROL_TO_DENY_CHANGES = "okay deny"
	CONTROL_TO_SELECT_OPTION_NUMBER_ONE = "okay select the option number one"
	CONTROL_TO_SELECT_OPTION_NUMBER_TWO = "okay select the option number two"
	CONTROL_TO_SELECT_OPTION_NUMBER_THREE = "okay select the option number three"
	CONTROL_TO_SELECT_OPTION_NUMBER_FOUR = "okay select the option number four"
	CONTROL_TO_SKIP_QUESTION = "okay skip that question"
	CONTROL_TO_REQUEST_CURRENT_MODE = "okay which mode are you in"
	CONTROL_TO_ENTER_NORMAL_MODE = "okay enter the normal mode"
	CONTROL_TO_ENTER_CONVERSATIONAL_MODE = "okay enter the conversational mode"
	CONTROL_TO_ENTER_EXPERT_MODE = "okay enter the expert mode"
	CONTROL_TO_ENTER_FOLLOW_UP_MODE = "okay enter the follow up mode"

	# q is used to store a Queue object, which is then used to keep track of the
	# nodes that need to be visited during the breadth-first search algorithm.
	q = queue.Queue()

	# Call commbase_stt_vosk_p
	commbase_stt_vosk_p()
	
# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
	main()

