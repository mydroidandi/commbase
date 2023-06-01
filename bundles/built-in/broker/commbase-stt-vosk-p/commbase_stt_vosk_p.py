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
import json
import os.path
import queue
import string
import subprocess
import sys

import sounddevice as sd
import vosk

from config import CONFIG_FILE_PATH
from file_paths import (
	get_ascii_art_file_path,
	get_assistant_microphone_instruction_file,
	get_control_accept_changes_patterns_file,
	get_control_deny_changes_patterns_file,
	get_control_enter_the_conversational_mode_patterns_file,
	get_control_enter_the_expert_mode_patterns_file,
	get_control_enter_the_follow_up_mode_patterns_file,
	get_control_enter_the_normal_mode_patterns_file,
	get_control_request_the_current_mode_patterns_file,
	get_control_select_option_number_four_patterns_file,
	get_control_select_option_number_one_patterns_file,
	get_control_select_option_number_three_patterns_file,
	get_control_select_option_number_two_patterns_file,
	get_control_skip_question_patterns_file,
	get_control_stop_previous_command_patterns_file,
	get_previous_result_message_recording_file,
	get_result_message_recording_file,
	get_result_messages_history_file,
	get_secrets_file_path,
	get_vosk_ml_model_directory,
)
from functions import (
	find_text,
	get_chat_participant_names,
	get_commbase_stt_vosk_p_parse_control_messages_on,
	get_manage_result_message_on_and_output_skill_errors_in_pane_on,
	get_tts_engine_string,
	int_or_str,
	read_lines_from_file,
	read_plain_text_file,
	strip_string,
)
from text_formatting import (
	get_assistant_avatar_color,
	get_chat_participant_colors,
	get_terminal_colors,
	set_assistant_avatar_color,
	set_assistant_user_background_color,
	set_assistant_user_text_color,
	set_end_user_background_color,
	set_end_user_text_color,
	set_system_user_background_color,
	set_system_user_text_color,
)


def commbase_stt_vosk_p():
	"""
	Takes audio input, processes it, and outputs the recognized text. The
    recognized text is then cleaned up, and saved in file(s).
	"""
	# Assign the result of calling get_vosk_ml_model_directory()
	vosk_ml_model_directory = get_vosk_ml_model_directory()

	# Define control messages
	# To change a control command do not do that here; use its patterns file
	# instead
	CONTROL_STOP_PREVIOUS_COMMAND = "okay stop"
	CONTROL_ACCEPT_CHANGES = "okay accept"
	CONTROL_DENY_CHANGES = "okay deny"
	CONTROL_SELECT_OPTION_NUMBER_ONE = "okay select the option number one"
	CONTROL_SELECT_OPTION_NUMBER_TWO = "okay select the option number two"
	CONTROL_SELECT_OPTION_NUMBER_THREE = "okay select the option number three"
	CONTROL_SELECT_OPTION_NUMBER_FOUR = "okay select the option number four"
	CONTROL_SKIP_QUESTION = "okay skip that question"
	CONTROL_REQUEST_THE_CURRENT_MODE = "okay which mode are you in"
	CONTROL_ENTER_THE_NORMAL_MODE = "okay enter the normal mode"
	CONTROL_ENTER_THE_CONVERSATIONAL_MODE = "okay enter the conversational mode"
	CONTROL_ENTER_THE_EXPERT_MODE = "okay enter the expert mode"
	CONTROL_ENTER_THE_FOLLOW_UP_MODE = "okay enter the follow up mode"

	# q is used to store a Queue object, which is then used to keep track of the
	# nodes that need to be visited during the breadth-first search algorithm.
	q = queue.Queue()


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
			# Load an ASCII art file, store its content in a variable, and then print
			# it in a specific color using terminal escape sequences.
			assistant_avatar = read_plain_text_file(ascii_art_file_path)
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

		# Check if the trimmed_string is not empty and control message parsing is
		# enabled for commbase-stt-vosk-p engine
		if trimmed_string != '' and commbase_stt_vosk_p_parse_control_messages_on == "True":

			# Define the control messages dictionary
			control_dictionary = {
				'CONTROL_STOP_PREVIOUS_COMMAND': {
						'patterns': control_stop_previous_command_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_STOP_PREVIOUS_COMMAND}" for processing.'
				},
				'CONTROL_ACCEPT_CHANGES': {
						'patterns': control_accept_changes_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_ACCEPT_CHANGES}" for processing.'
				},
				'CONTROL_DENY_CHANGES': {
						'patterns': control_deny_changes_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_DENY_CHANGES}" for processing.'
				},
				'CONTROL_SELECT_OPTION_NUMBER_ONE': {
						'patterns': control_select_option_number_one_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_SELECT_OPTION_NUMBER_ONE}" for processing.'
				},
				'CONTROL_SELECT_OPTION_NUMBER_TWO': {
						'patterns': control_select_option_number_two_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_SELECT_OPTION_NUMBER_TWO}" for processing.'
				},
				'CONTROL_SELECT_OPTION_NUMBER_THREE': {
						'patterns': control_select_option_number_three_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_SELECT_OPTION_NUMBER_THREE}" for processing.'
				},
				'CONTROL_SELECT_OPTION_NUMBER_FOUR': {
						'patterns': control_select_option_number_four_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_SELECT_OPTION_NUMBER_FOUR}" for processing.'
				},
				'CONTROL_SKIP_QUESTION': {
						'patterns': control_skip_question_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_SKIP_QUESTION}" for processing.'
				},
				'CONTROL_REQUEST_THE_CURRENT_MODE': {
						'patterns': control_request_the_current_mode_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_REQUEST_THE_CURRENT_MODE}" for processing.'
				},
				'CONTROL_ENTER_THE_NORMAL_MODE': {
						'patterns': control_enter_the_normal_mode_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_ENTER_THE_NORMAL_MODE}" for processing.'
				},
				'CONTROL_ENTER_THE_CONVERSATIONAL_MODE': {
						'patterns': control_enter_the_conversational_mode_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_ENTER_THE_CONVERSATIONAL_MODE}" for processing.'
				},
				'CONTROL_ENTER_THE_EXPERT_MODE': {
						'patterns': control_enter_the_expert_mode_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_ENTER_THE_EXPERT_MODE}" for processing.'
				},
				'CONTROL_ENTER_THE_FOLLOW_UP_MODE': {
						'patterns': control_enter_the_follow_up_mode_patterns,
						'message': f'I am dispatching "{trimmed_string}" as control "{CONTROL_ENTER_THE_FOLLOW_UP_MODE}" for processing.'
				}
			}

			# The control message and END USER message matching
			found_match = False

			# Check if the trimmed_string is not empty
			for control, info in control_dictionary.items():
				patterns = info['patterns']  # Get the patterns for the current control
				message = info['message']  # Get the message for the current control

				for line in patterns:
					if trimmed_string == line.strip():  # Check for exact match
						# If a match is found, print the message and record the control
						# message
						print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} {message}\033[{color_code_end}')
						# Create the JSON object
						json_data = {
							"control": control
						}
						# Record the control message string to result_message_recording_file
						# as a JSON object.
						with open(result_message_recording_file, 'w') as f:
							json.dump(json_data, f)
						found_match = True
						if manage_result_message_on_and_output_skill_errors_in_pane_on == "True":
							# Manage the result message
							subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])
						break  # Exit the inner loop if a match is found

				if found_match:
					break  # Exit the outer loop if a match is found

			# Handle the case when no match is found
			if not found_match:
				# Record a normal END USER message instead of a control message
				print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" for processing.\033[{color_code_end}')
				# Create the JSON object
				json_data = {
					"message": trimmed_string
				}
				# Record the control message string to result_message_recording_file
				# as a JSON object.
				with open(result_message_recording_file, 'w') as f:
					json.dump(json_data, f)
				with open(previous_result_message_recording_file, 'w') as f:
					json.dump(json_data, f)
				if manage_result_message_on_and_output_skill_errors_in_pane_on == "True":
					# Manage the result message
					subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])

		# Check if the trimmed_string is not empty and control message parsing is
		# disabled for commbase-stt-vosk-p engine
		elif trimmed_string != '' and commbase_stt_vosk_p_parse_control_messages_on == "False":
			print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} I am dispatching "{trimmed_string}" no controls for processing.\033[{color_code_end}')
			# Create the JSON object
			json_data = {
				"message": trimmed_string
			}
			# Record the control message string to result_message_recording_file
			# as a JSON object.
			with open(result_message_recording_file, 'w') as f:
				json.dump(json_data, f)
			with open(previous_result_message_recording_file, 'w') as f:
				json.dump(json_data, f)
			if manage_result_message_on_and_output_skill_errors_in_pane_on == "True":
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
			args.model = string.Template(vosk_ml_model_directory).substitute(os.environ)
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
			# Assign functions imported from text_formatting

			# Set the values returned by get_terminal_colors()
			red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

			# Set the values returned by get_chat_participant_colors()
			end_user_background_color, assistant_background_color, system_background_color, end_user_text_color, assistant_text_color, system_text_color = get_chat_participant_colors()

			# Set the values returned by get_assistant_avatar_color()
			avatar_color = get_assistant_avatar_color()

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


			# Assign functions imported from functions

			# Set the values returned by get_tts_engine_string()
			tts_engine_str = get_tts_engine_string()

			# Set the values returned by get_chat_participant_names()
			end_user_name, assistant_name, system_name = get_chat_participant_names()

			# Set the value of manage_result_message_on_and_output_skill_errors_in_pane_on
			manage_result_message_on_and_output_skill_errors_in_pane_on =  get_manage_result_message_on_and_output_skill_errors_in_pane_on()

			# Set the value of commbase_stt_vosk_p_parse_control_messages_on
			commbase_stt_vosk_p_parse_control_messages_on = get_commbase_stt_vosk_p_parse_control_messages_on()


			# Assign functions imported from file_paths

			# Set the values returned by get_secrets_file_path()
			secrets_file_path = get_secrets_file_path()

			# Set the values returned by get_ascii_art_file_path()
			ascii_art_file_path = get_ascii_art_file_path()

			# Set the values returned by get_assistant_microphone_instruction_file()
			assistant_microphone_instruction_file = get_assistant_microphone_instruction_file()

			# Set the values returned by get_result_message_recording_file()
			result_message_recording_file = get_result_message_recording_file()

			# Set the values returned by get_previous_result_message_recording_file()
			previous_result_message_recording_file = get_previous_result_message_recording_file()

			# Set the values returned by get_result_messages_history_file()
			result_messages_history_file = get_result_messages_history_file()

			# Set the values returned by get_control_stop_previous_command_patterns_file()
			control_stop_previous_command_patterns_file = get_control_stop_previous_command_patterns_file()

			# Set the values returned by get_control_accept_changes_patterns_file()
			control_accept_changes_patterns_file = get_control_accept_changes_patterns_file()

			# Set the values returned by get_control_deny_changes_patterns_file()
			control_deny_changes_patterns_file = get_control_deny_changes_patterns_file()

			# Set the values returned by get_control_select_option_number_one_patterns_file()
			control_select_option_number_one_patterns_file = get_control_select_option_number_one_patterns_file()

			# Set the values returned by get_control_select_option_number_two_patterns_file()
			control_select_option_number_two_patterns_file = get_control_select_option_number_two_patterns_file()

			# Set the values returned by get_control_select_option_number_three_patterns_file()
			control_select_option_number_three_patterns_file = get_control_select_option_number_three_patterns_file()

			# Set the values returned by get_control_select_option_number_four_patterns_file()
			control_select_option_number_four_patterns_file = get_control_select_option_number_four_patterns_file()

			# Set the values returned by get_control_skip_question_patterns_file()
			control_skip_question_patterns_file = get_control_skip_question_patterns_file()

			# Set the values returned by get_control_request_the_current_mode_patterns_file()
			control_request_the_current_mode_patterns_file = get_control_request_the_current_mode_patterns_file()

			# Set the values returned by get_control_enter_the_normal_mode()
			control_enter_the_normal_mode_patterns_file = get_control_enter_the_normal_mode_patterns_file()

			# Set the values returned by get_control_enter_the_conversational_mode_patterns_file()
			control_enter_the_conversational_mode_patterns_file = get_control_enter_the_conversational_mode_patterns_file()

			# Set the values returned by get_control_enter_the_expert_mode_patterns_file()
			control_enter_the_expert_mode_patterns_file = get_control_enter_the_expert_mode_patterns_file()

			# Set the values returned by get_control_enter_the_follow_up_mode_patterns_file()
			control_enter_the_follow_up_mode_patterns_file = get_control_enter_the_follow_up_mode_patterns_file()


			# Preload all the control pattern files

			# CONTROL_STOP_PREVIOUS_COMMAND
			# Load the control patterns file and store its content in a variable
			control_stop_previous_command_patterns = read_lines_from_file(control_stop_previous_command_patterns_file)

			# CONTROL_ACCEPT_CHANGES
			# Load the control patterns file and store its content in a variable
			control_accept_changes_patterns = read_lines_from_file(control_accept_changes_patterns_file)

			#	CONTROL_DENY_CHANGES
			# Load the control patterns file and store its content in a variable
			control_deny_changes_patterns = read_lines_from_file(control_deny_changes_patterns_file)

			#	CONTROL_SELECT_OPTION_NUMBER_ONE
			# Load the control patterns file and store its content in a variable
			control_select_option_number_one_patterns = read_lines_from_file(control_select_option_number_one_patterns_file)

			#	CONTROL_SELECT_OPTION_NUMBER_TWO
			# Load the control patterns file and store its content in a variable
			control_select_option_number_two_patterns = read_lines_from_file(control_select_option_number_two_patterns_file)

			#	CONTROL_SELECT_OPTION_NUMBER_THREE
			# Load the patterns file and store its content in a variable
			control_select_option_number_three_patterns = read_lines_from_file(control_select_option_number_three_patterns_file)

			#	CONTROL_SELECT_OPTION_NUMBER_FOUR
			# Load the control patterns file and store its content in a variable
			control_select_option_number_four_patterns = read_lines_from_file(control_select_option_number_four_patterns_file)

			#	CONTROL_SKIP_QUESTION
			# Load the control patterns file and store its content in a variable
			control_skip_question_patterns = read_lines_from_file(control_skip_question_patterns_file)

			#	CONTROL_REQUEST_THE_CURRENT_MODE
			# Load the control patterns file and store its content in a variable
			control_request_the_current_mode_patterns = read_lines_from_file(control_request_the_current_mode_patterns_file)

			#	CONTROL_ENTER_THE_NORMAL_MODE
			# Load the control patterns file and store its content in a variable
			control_enter_the_normal_mode_patterns = read_lines_from_file(control_enter_the_normal_mode_patterns_file)

			#	CONTROL_ENTER_THE_CONVERSATIONAL_MODE

			control_enter_the_conversational_mode_patterns = read_lines_from_file(control_enter_the_conversational_mode_patterns_file)

			#	CONTROL_ENTER_THE_EXPERT_MODE
			# Load the control patterns file and store its content in a variable
			control_enter_the_expert_mode_patterns = read_lines_from_file(control_enter_the_expert_mode_patterns_file)

			#	CONTROL_ENTER_THE_FOLLOW_UP_MODE
			# Load the control patterns file and store its content in a variable
			control_enter_the_follow_up_mode_patterns = read_lines_from_file(control_enter_the_follow_up_mode_patterns_file)


			# Show avatar

			# Display the assitant avatar
			display_assistant_avatar()


			# Read the content of a file that provides instructions about muting the
			# microphone to pause recording. It then prints the content, including the
			# formatted assistant name and colors.
			discourse = read_plain_text_file(assistant_microphone_instruction_file)
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
				#else
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
	global q

	# Call commbase_stt_vosk_p
	commbase_stt_vosk_p()

# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
	main()

