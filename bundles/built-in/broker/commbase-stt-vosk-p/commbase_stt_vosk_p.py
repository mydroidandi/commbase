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
import sounddevice as sd
import vosk
import sys
import subprocess
import string
from functions import read_plain_text_file, load_config_file, int_or_str, find_text, strip_string, get_chat_participant_names, get_tts_engine_string
from text_formatting import get_terminal_colors, get_chat_participant_colors, get_assistant_avatar_color, set_end_user_background_color, set_assistant_user_background_color, set_system_user_background_color, set_end_user_text_color, set_assistant_user_text_color, set_system_user_text_color, set_assistant_avatar_color


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
		string = rec.Result()
		trimmed_string = strip_string(string)
		if trimmed_string is None:
			return

		print(f'\033[{end_user_background_color_start}\033[{end_user_text_color_start}{end_user_name}:\033[{color_code_end}\033[{color_code_end}\033[{end_user_text_color_start} {trimmed_string}\033[{color_code_end}')
		# Write to data files
		with open(RESULT_DATA_FILE, 'w') as f:
			f.write(trimmed_string)
		with open(PREV_DATA_FILE, 'w') as f:
			f.write(trimmed_string)

		## This can be used for debugging
		## Append to history file
		#with open(OUTPUT_HISTORY_FILE, 'a') as f:
		#  f.write(trimmed_string + "\n")

		# Process the command if it doesn't contain the stop string
		if STOP_STR not in trimmed_string:
			# Execute a script written in a language other than Python to manage and
			# process the current result. (This functionality is disabled for
			# debugging purposes.)
			#subprocess.run(['bash', os.environ["COMMBASE_APP_DIR"] + '/src/skill'])
			print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} Processing ... {trimmed_string}\033[{color_code_end}')
		else:
			print(f'\033[{assistant_background_color_start}\033[{assistant_text_color_start}{assistant_name}:\033[{color_code_end}\033[{color_code_end}\033[{assistant_text_color_start} Processing ... okay stop\033[{color_code_end}')


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

			# Assign the values returned by get_terminal_colors()
			red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

			# Assign the values returned by get_chat_participant_colors()
			end_user_background_color, assistant_background_color, system_background_color, end_user_text_color, assistant_text_color, system_text_color = get_chat_participant_colors()

			# Assign the values returned by get_assistant_avatar_color()
			avatar_color = get_assistant_avatar_color()

			# Assign the values returned by get_chat_participant_names()
			end_user_name, assistant_name, system_name = get_chat_participant_names()
			
			# Assign the values returned by get_tts_engine_string()
			tts_engine_str = get_tts_engine_string()

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
	global CONFIG_FILE_PATH, ASCII_FILE_PATH, INSTRUCTION_FILE_PATH, ML_MODEL, RESULT_DATA_FILE, PREV_DATA_FILE, OUTPUT_HISTORY_FILE, STOP_STR, q

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
	RESULT_DATA_FILE = os.environ["COMMBASE_APP_DIR"] + '/data/.data.dat'
	PREV_DATA_FILE = os.environ["COMMBASE_APP_DIR"] + '/data/.prev_data.dat'
	OUTPUT_HISTORY_FILE = os.environ["COMMBASE_APP_DIR"] + '/history/.app_history'

	# String used to process the 'okay stop' control command
	STOP_STR = "okay stop"

	# q is used to store a Queue object, which is then used to keep track of the
	# nodes that need to be visited during the breadth-first search algorithm.
	q = queue.Queue()

	# Call commbase_stt_vosk_p
	commbase_stt_vosk_p()
	
# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
	main()

