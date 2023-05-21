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
import json
from functions import read_plain_text_file
from terminal_colors import get_terminal_colors, get_chat_participant_colors, get_assistant_avatar_color


def commbase_stt_vosk_p():
	"""
	Takes audio input, processes it, and outputs the recognized text. The 
	recognized text is then cleaned up, and saved in files.
	"""

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
		# Assign the values returned by get_terminal_colors()
		red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

		# Assign the values returned by get_assistant_avatar_color()
		avatar_color = get_assistant_avatar_color()
		
		# Set the assistant avatar color
		if avatar_color == "red":
		  avatar_color_start = red_text_color_code_start
		if avatar_color == "green":
		  avatar_color_start = green_text_color_code_start
		if avatar_color == "yellow":
		  avatar_color_start = yellow_text_color_code_start
		if avatar_color == "blue":
		  avatar_color_start = blue_text_color_code_start
		if avatar_color == "magenta":
		  avatar_color_start = magenta_text_color_code_start
		if avatar_color == "cyan":
		  avatar_color_start = cyan_text_color_code_start
		if avatar_color == "white":
		  avatar_color_start = white_text_color_code_start
		if avatar_color == "black":
		  avatar_color_start = black_text_color_code_start

		# Load an ASCII art file, store its content in a variable, and then print it
		# in a specific color using terminal escape sequences.
		file_path = os.environ["COMMBASE_APP_DIR"] + '/assets/ascii/avatar.asc'
		assistant_avatar = read_plain_text_file(file_path)
		print(f'\033[{avatar_color_start}\033[{assistant_avatar}\033[{color_code_end}')
	

	def get_chat_participant_names():
		""" 
		Gets the chat participant names from the config file.

		Reads the 'ASSISTANT_NAME_IN_CHAT_PANE', 'SYSTEM_NAME_IN_CHAT_PANE', and 
		'END_USER_NAME_IN_CHAT_PANE' variables from the environment configuration
		file. Returns a tuple containing the string values of the variables if
		found, or None if any of the variables are not present.

		Returns:
				tuple or None: A tuple containing the assistant, system, and end user
				names in the chat pane, or None, if any of the variables are not found.
		"""
		# Specify the path of the env file containing the variables
		file_path = os.environ["COMMBASE_APP_DIR"] + '/config/app.conf'

		# Initialize variables for the chat names
		assistant_name = None
		system_name = None
		end_user_name = None

		# Open the file and read its contents
		with open(file_path, 'r') as f:
			for line in f:
				# Split the line into variable name and value
				variable_name, value = line.strip().split('=')

				# Check if the variable we are looking for exists in the line
				if variable_name == 'END_USER_NAME_IN_CHAT_PANE':
				  # Remove the quotes from the value of the variable
				  end_user_name = value.strip()[1:-1]
				  
				elif variable_name == 'ASSISTANT_NAME_IN_CHAT_PANE':
				  # Remove the quotes from the value of the variable
				  assistant_name = value.strip()[1:-1]
				  
				elif variable_name == 'SYSTEM_NAME_IN_CHAT_PANE':
				  # Remove the quotes from the value of the variable
				  system_name = value.strip()[1:-1]
				  
		# Check if all three variables were found
		if assistant_name is not None and system_name is not None and end_user_name is not None:
			return end_user_name, assistant_name, system_name 

		# If any of the variables are not found, return None
		return None


	def get_tts_engine_string():
		"""
    Retrieves the TTS (Text-to-Speech) engine string from the configuration file.

    Returns:
        str or None: The TTS engine string if found in the configuration file,
        otherwise None.
    """
		# Specify the path of the env file containing the variable
		file_path = os.environ["COMMBASE_APP_DIR"] + '/config/app.conf'

		# Initialize variable for the tts engine string
		tts_engine_str = None

		# Open the file and read its contents
		with open(file_path, 'r') as f:
			for line in f:
				# Split the line into variable name and value
				variable_name, value = line.strip().split('=')

				# Check if the variable we are looking for exists in the line
				if variable_name == 'TTS_ENGINE_STRING':
					# Remove the quotes from the value of the variable
					tts_engine_str = value.strip()[1:-1]
					
		# Check if the variable was found
		if tts_engine_str is not None:
			return tts_engine_str 

		# If the variable was not found, return None
		return None


	def int_or_str(text):
		"""
		Parses a string input and returns either an integer or the original string.

		This function takes a string input and tries to convert it to an integer. If
		successful, it returns the integer value. If not, it returns the original
		string.

		Parameters:
		    text (str): The input string to be parsed.

		Returns:
		    int or str: If the input string can be converted to an integer, the
		    function returns the integer value. If not, the function returns the
		    original string.

		Raises:
		    None.
		"""
		try:
		  return int(text)
		except ValueError:
		  return text


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


	def find_text(string):
		"""
		Finds the index of the 'text' substring in the input string.

		Parameters:
		    string (str): The string to search for 'text'.

		Returns:
		    int: The index of the start of 'text' substring in the input string.
		    If 'text' substring is not found, returns None.
		"""
		text_start = string.find('"text" : "')
		return text_start if text_start != -1 else None


	def strip_string(string):
		"""
		Strip unwanted characters and whitespaces from the 'text' field of a JSON
		string.

		Parameters:
				string (str): The input string, assumed to be a valid JSON string with a
				'text' field.

		Returns:
				str or None: The resulting string after being stripped of unwanted
				characters and whitespaces.
				Returns None if the input string is None, is not a valid JSON string, or
				does not contain
				a 'text' field.
		"""
		if string is None:
			return None

		# Load the JSON string into a dictionary
		try:
			data = json.loads(string)
		except ValueError:
			return None

		# Get the text field from the dictionary
		if "text" not in data:
			return None
		text = data["text"]

		# Replace unwanted characters and whitespaces
		text = text.replace('"', '').strip()

		# Remove 'the' from the beginning of the text, if present
		if text.startswith('the'):
			text = text[3:].strip()

		# Remove 'the' from the end of the text, if present
		if text.endswith('the'):
			text = text[:-3].strip()

		return text


	def print_result():
		"""
		Prints the result on the screen and write to files.

		Parameters:
		    None.

		Returns:
		    None.
		"""
		# Assign the values returned by get_terminal_colors()
		red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

		# Assign the values returned by get_chat_participant_colors()
		end_user_background_color, assistant_background_color, system_background_color, end_user_text_color, assistant_text_color, system_text_color = get_chat_participant_colors()

		# Assign the values returned by get_chat_participant_names()
		end_user_name, assistant_name, system_name = get_chat_participant_names()

		# Set the END USER user background color
		if end_user_background_color == 'red':
		  end_user_background_color_start = red_background_color_code_start
		elif end_user_background_color == 'green':
		  end_user_background_color_start = green_background_color_code_start
		elif end_user_background_color == 'yellow':
			end_user_background_color_start = yellow_background_color_code_start
		elif end_user_background_color == 'blue':
		  end_user_background_color_start = blue_background_color_code_start
		elif end_user_background_color == 'magenta':
		  end_user_background_color_start = magenta_background_color_code_start
		elif end_user_background_color == 'cyan':
		  end_user_background_color_start = cyan_background_color_code_start
		elif end_user_background_color == 'white':
		  end_user_background_color_start = white_background_color_code_start
		elif end_user_background_color == 'black':
		  end_user_background_color_start = black_background_color_code_start

		# Set the ASSISTANT user background color
		if assistant_background_color == 'red':
		  assistant_background_color_start = red_background_color_code_start
		elif assistant_background_color == 'green':
		  assistant_background_color_start = green_background_color_code_start
		elif assistant_background_color == 'yellow':
			assistant_background_color_start = yellow_background_color_code_start
		elif assistant_background_color == 'blue':
		  assistant_background_color_start = blue_background_color_code_start
		elif assistant_background_color == 'magenta':
		  assistant_background_color_start = magenta_background_color_code_start
		elif assistant_background_color == 'cyan':
		  assistant_background_color_start = cyan_background_color_code_start
		elif assistant_background_color == 'white':
		  assistant_background_color_start = white_background_color_code_start
		elif assistant_background_color == 'black':
		  assistant_background_color_start = black_background_color_code_start

		# Set the SYSTEM user background color
		if system_background_color == 'red':
		  system_background_color_start = red_background_color_code_start
		elif system_background_color == 'green':
		  system_background_color_start = green_background_color_code_start
		elif system_background_color == 'yellow':
			system_background_color_start = yellow_background_color_code_start
		elif system_background_color == 'blue':
		  system_background_color_start = blue_background_color_code_start
		elif system_background_color == 'magenta':
		  system_background_color_start = magenta_background_color_code_start
		elif system_background_color == 'cyan':
		  system_background_color_start = cyan_background_color_code_start
		elif system_background_color == 'white':
		  system_background_color_start = white_background_color_code_start
		elif system_background_color == 'black':
		  system_background_color_start = black_background_color_code_start

		# Set the END USER user text color
		if end_user_text_color == 'red':
		  end_user_text_color_start = red_text_color_code_start
		elif end_user_text_color == 'green':
		  end_user_text_color_start = green_text_color_code_start
		elif end_user_text_color == 'yellow':
			end_user_text_color_start = yellow_text_color_code_start
		elif end_user_text_color == 'blue':
		  end_user_text_color_start = blue_text_color_code_start
		elif end_user_text_color == 'magenta':
		  end_user_text_color_start = magenta_text_color_code_start
		elif end_user_text_color == 'cyan':
		  end_user_text_color_start = cyan_text_color_code_start
		elif end_user_text_color == 'white':
		  end_user_text_color_start = white_text_color_code_start
		elif end_user_text_color == 'black':
		  end_user_text_color_start = black_text_color_code_start

		# Set the ASSISTANT user text color
		if assistant_text_color == 'red':
		  assistant_text_color_start = red_text_color_code_start
		elif assistant_text_color == 'green':
		  assistant_text_color_start = green_text_color_code_start
		elif assistant_text_color == 'yellow':
			assistant_text_color_start = yellow_text_color_code_start
		elif assistant_text_color == 'blue':
		  assistant_text_color_start = blue_text_color_code_start
		elif assistant_text_color == 'magenta':
		  assistant_text_color_start = magenta_text_color_code_start
		elif assistant_text_color == 'cyan':
		  assistant_text_color_start = cyan_text_color_code_start
		elif assistant_text_color == 'white':
		  assistant_text_color_start = white_text_color_code_start
		elif assistant_text_color == 'black':
		  assistant_text_color_start = black_text_color_code_start

		# Set the SYSTEM user text color
		if system_text_color == 'red':
		  system_background_color_start = red_text_color_code_start
		elif system_text_color == 'green':
		  system_text_color_start = green_text_color_code_start
		elif system_text_color == 'yellow':
			system_text_color_start = yellow_text_color_code_start
		elif system_text_color == 'blue':
		  system_text_color_start = blue_text_color_code_start
		elif system_text_color == 'magenta':
		  system_text_color_start = magenta_text_color_code_start
		elif system_text_color == 'cyan':
		  system_background_color_start = cyan_text_color_code_start
		elif system_text_color == 'white':
		  system_text_color_start = white_text_color_code_start
		elif system_text_color == 'black':
		  system_text_color_start = black_text_color_code_start

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
			display_assistant_avatar()
			
			# Assign the values returned by get_terminal_colors()
			red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

			# Assign the values returned by get_chat_participant_colors()
			end_user_background_color, assistant_background_color, system_background_color, end_user_text_color, assistant_text_color, system_text_color = get_chat_participant_colors()

			# Assign the values returned by get_chat_participant_names()
			end_user_name, assistant_name, system_name = get_chat_participant_names()
			
			# Assign the values returned by get_tts_engine_string()
			tts_engine_str = get_tts_engine_string()

			# Set the END USER user background color
			if end_user_background_color == 'red':
				end_user_background_color_start = red_background_color_code_start
			elif end_user_background_color == 'green':
				end_user_background_color_start = green_background_color_code_start
			elif end_user_background_color == 'yellow':
				end_user_background_color_start = yellow_background_color_code_start
			elif end_user_background_color == 'blue':
				end_user_background_color_start = blue_background_color_code_start
			elif end_user_background_color == 'magenta':
				end_user_background_color_start = magenta_background_color_code_start
			elif end_user_background_color == 'cyan':
				end_user_background_color_start = cyan_background_color_code_start
			elif end_user_background_color == 'white':
				end_user_background_color_start = white_background_color_code_start
			elif end_user_background_color == 'black':
				end_user_background_color_start = black_background_color_code_start

			# Set the ASSISTANT user background color
			if assistant_background_color == 'red':
				assistant_background_color_start = red_background_color_code_start
			elif assistant_background_color == 'green':
				assistant_background_color_start = green_background_color_code_start
			elif assistant_background_color == 'yellow':
				assistant_background_color_start = yellow_background_color_code_start
			elif assistant_background_color == 'blue':
				assistant_background_color_start = blue_background_color_code_start
			elif assistant_background_color == 'magenta':
				assistant_background_color_start = magenta_background_color_code_start
			elif assistant_background_color == 'cyan':
				assistant_background_color_start = cyan_background_color_code_start
			elif assistant_background_color == 'white':
				assistant_background_color_start = white_background_color_code_start
			elif assistant_background_color == 'black':
			  assistant_background_color_start = black_background_color_code_start

			# Set the SYSTEM user background color
			if system_background_color == 'red':
				system_background_color_start = red_background_color_code_start
			elif system_background_color == 'green':
				system_background_color_start = green_background_color_code_start
			elif system_background_color == 'yellow':
				system_background_color_start = yellow_background_color_code_start
			elif system_background_color == 'blue':
				system_background_color_start = blue_background_color_code_start
			elif system_background_color == 'magenta':
				system_background_color_start = magenta_background_color_code_start
			elif system_background_color == 'cyan':
				system_background_color_start = cyan_background_color_code_start
			elif system_background_color == 'white':
				system_background_color_start = white_background_color_code_start
			elif system_background_color == 'black':
				system_background_color_start = black_background_color_code_start

			# Set the END USER user text color
			if end_user_text_color == 'red':
			  end_user_text_color_start = red_text_color_code_start
			elif end_user_text_color == 'green':
				end_user_text_color_start = green_text_color_code_start
			elif end_user_text_color == 'yellow':
				end_user_text_color_start = yellow_text_color_code_start
			elif end_user_text_color == 'blue':
			 end_user_text_color_start = blue_text_color_code_start
			elif end_user_text_color == 'magenta':
			  end_user_text_color_start = magenta_text_color_code_start
			elif end_user_text_color == 'cyan':
			  end_user_text_color_start = cyan_text_color_code_start
			elif end_user_text_color == 'white':
			  end_user_text_color_start = white_text_color_code_start
			elif end_user_text_color == 'black':
			  end_user_text_color_start = black_text_color_code_start

			# Set the ASSISTANT user text color
			if assistant_text_color == 'red':
			  assistant_text_color_start = red_text_color_code_start
			elif assistant_text_color == 'green':
			  assistant_text_color_start = green_text_color_code_start
			elif assistant_text_color == 'yellow':
				assistant_text_color_start = yellow_text_color_code_start
			elif assistant_text_color == 'blue':
			  assistant_text_color_start = blue_text_color_code_start
			elif assistant_text_color == 'magenta':
			  assistant_text_color_start = magenta_text_color_code_start
			elif assistant_text_color == 'cyan':
			  assistant_text_color_start = cyan_text_color_code_start
			elif assistant_text_color == 'white':
			  assistant_text_color_start = white_text_color_code_start
			elif assistant_text_color == 'black':
			  assistant_text_color_start = black_text_color_code_start

			# Set the SYSTEM user text color
			if system_text_color == 'red':
			  system_text_color_start = red_text_color_code_start
			elif system_text_color == 'green':
			  system_text_color_start = green_text_color_code_start
			elif system_text_color == 'yellow':
				system_text_color_start = yellow_text_color_code_start
			elif system_text_color == 'blue':
			  system_text_color_start = blue_text_color_code_start
			elif system_text_color == 'magenta':
			  system_text_color_start = magenta_text_color_code_start
			elif system_text_color == 'cyan':
			  system_background_color_start = cyan_text_color_code_start
			elif system_text_color == 'white':
			  system_text_color_start = white_text_color_code_start
			elif system_text_color == 'black':
			  system_text_color_start = black_text_color_code_start

			# Read the content of a file that provides instructions about muting the
			# microphone to pause recording. It then prints the content, including the
			# formatted assistant name and colors.
			file_path = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/libcommbase/resources/discourses/mute_the_microphone_to_pause_the_recording_instruction'
			discourse = read_plain_text_file(file_path)
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
	
	Args:
			None
    
	Returns:
  		None
	"""
	# Global declarations
	global ML_MODEL, RESULT_DATA_FILE, PREV_DATA_FILE, OUTPUT_HISTORY_FILE, STOP_STR, q

	# The path to the model
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

