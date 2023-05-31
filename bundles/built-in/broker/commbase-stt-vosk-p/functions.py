################################################################################
#                               commbase-stt-vosk                              #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
#                                                                              #
# Change History                                                               #
# 05/20/2023  Esteban Herrera Original code.                                   #
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

# functions.py
# This file contains a collection of utility functions for various tasks. It
# provides a set of commonly used functions related to data manipulation, file
# handling, and mathematical operations.

# Requirements
import json
import os.path
from config import CONFIG_FILE_PATH


def read_plain_text_file(file_path):
	"""
	Read the contents of a plain text file and return it as a string.

	Parameters:
		  file_path (str): The path to the plain text file.

	Returns:
		  str: The content of the file as a string.
	"""
	file_variable = ""

	# Open the file in read mode
	with open(file_path, "r") as file:
		# Read the entire contents of the file
		file_variable = file.read().rstrip()

	# Return the variable with the file contents
	return file_variable


def read_lines_from_file(file_path):
	"""
	Read all lines from a file and return them as a list.

	Parameters:
		  file_path (str): The path to the file to be read.

	Returns:
		  list: A list containing all the lines from the file.

	Example:
		  >>> lines = read_lines_from_file('file.txt')
		  >>> print(lines)
		  ['This is line 1.\n', 'This is line 2.\n', 'This is line 3.\n']
	"""
	with open(file_path, 'r') as f:
		# Store all the file lines in a list
		lines = f.readlines()  # Read all lines from the file

	# Return all the lines in a list
	return lines


def load_config_file():
	"""
	Loads the configuration file path.

	Returns:
			str: The path of the configuration file.

	Raises:
        KeyError: If the environment variable 'COMMBASE_APP_DIR' is not set.
	"""
	try:
		# Specify the path of the env file containing the variables
		CONFIG_FILE_PATH = os.environ["COMMBASE_APP_DIR"] + '/config/app.conf'
		return CONFIG_FILE_PATH
	except KeyError:
		print("Error: Environment variable 'COMMBASE_APP_DIR' is not set.")
		# You can choose to handle the error in different ways, such as returning a default value or raising an exception.
		# Here, we choose to return None to indicate the absence of the configuration file path.
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
	# Initialize variables for the chat names
	assistant_name = None
	system_name = None
	end_user_name = None

	# Open the file and read its contents
	with open(CONFIG_FILE_PATH, 'r') as f:
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
	# Initialize variable for the tts engine string
	tts_engine_str = None

	# Open the file and read its contents
	with open(CONFIG_FILE_PATH, 'r') as f:
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


def get_manage_result_message_on_and_output_skill_errors_in_pane_on():
	"""
	Retrieve the value of the
	MANAGE_RESULT_MESSAGE_ON_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON variable from the
	configuration file.

	Returns:
		  str or None: The value of the variable if found, or None if not found.
	"""
	# Initialize variable for the tts engine string
	true_or_false_str = None

	# Open the file and read its contents
	with open(CONFIG_FILE_PATH, 'r') as f:
		for line in f:
			# Split the line into variable name and value
			variable_name, value = line.strip().split('=')

			# Check if the variable we are looking for exists in the line
			if variable_name == 'MANAGE_RESULT_MESSAGE_ON_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON':
				# Remove the quotes from the value of the variable
				true_or_false_str = value.strip()[1:-1]

	# Check if the variable was found
	if true_or_false_str is not None:
		return true_or_false_str

	# If the variable was not found, return None
	return None


def get_commbase_stt_vosk_p_parse_control_messages_on():
	"""
	Retrieve the value of the COMMBASE_STT_VOSK_P_PARSE_CONTROL_MESSAGES_ON
	variable from the configuration file.

	Returns:
		  str or None: The value of the variable if found, or None if not found.
	"""
	# Initialize variable for the tts engine string
	parse_control_messages = None

	# Open the file and read its contents
	with open(CONFIG_FILE_PATH, 'r') as f:
		for line in f:
			# Split the line into variable name and value
			variable_name, value = line.strip().split('=')

			# Check if the variable we are looking for exists in the line
			if variable_name == 'COMMBASE_STT_VOSK_P_PARSE_CONTROL_MESSAGES_ON':
				# Remove the quotes from the value of the variable
				parse_control_messages = value.strip()[1:-1]

	# Check if the variable was found
	if parse_control_messages is not None:
		return parse_control_messages

	# If the variable was not found, return None
	return None

