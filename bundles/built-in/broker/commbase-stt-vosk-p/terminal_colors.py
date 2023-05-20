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

# This file provides utility functions for working with terminal colors. It
# includes functions to modify the text color, background color, and text 
# formatting in the terminal output. These functions can be used to enhance the
# visual appearance and readability of command-line interfaces.

# Requirements
import os.path


def get_terminal_colors():
	""" 
	Gets the terminal colors from the config file.

	Reads the environment variables from the environment configuration file.
	Returns a tuple containing the string values of the variables if found, or
	None if any of the variables are not present.

	Returns:
			tuple or None: A tuple containing the terminal colors, or None, if any
			of the variables are not found.
	"""
	# Specify the path of the env file containing the variables
	file_path = os.environ["COMMBASE_APP_DIR"] + '/config/app.conf'

	# Initialize variables for the background colors
	red_background_color_code_start = None
	green_background_color_code_start = None
	yellow_background_color_code_start = None
	blue_background_color_code_start = None
	magenta_background_color_code_start = None
	cyan_background_color_code_start = None
	white_background_color_code_start = None
	black_background_color_code_start = None

	# Initialize variables for the text colors
	red_text_color_code_start = None
	green_text_color_code_start = None
	yellow_text_color_code_start = None
	blue_text_color_code_start = None
	magenta_text_color_code_start = None
	cyan_text_color_code_start = None
	white_text_color_code_start = None
	black_text_color_code_start = None
	
	# Initialize the varoable for the end of the color
	color_code_end = None

	# Open the file and read its contents
	with open(file_path, 'r') as f:
		for line in f:
			# Split the line into variable name and value
			variable_name, value = line.strip().split('=')

			# Check if the variable we are looking for exists in the file
			if variable_name == 'TERMINAL_RED_BACKGROUND_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  red_background_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_GREEN_BACKGROUND_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  green_background_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_YELLOW_BACKGROUND_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  yellow_background_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_BLUE_BACKGROUND_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  blue_background_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_MAGENTA_BACKGROUND_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  magenta_background_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_CYAN_BACKGROUND_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  cyan_background_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_WHITE_BACKGROUND_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  white_background_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_BLACK_BACKGROUND_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  black_background_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_RED_TEXT_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  red_text_color_code_start = value.strip()[1:-1]

			# Check if the variable we are looking for exists in the line
			elif variable_name == 'TERMINAL_GREEN_TEXT_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  green_text_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_YELLOW_TEXT_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  yellow_text_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_BLUE_TEXT_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  blue_text_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_MAGENTA_TEXT_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  magenta_text_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_CYAN_TEXT_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  cyan_text_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_WHITE_TEXT_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  white_text_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_BLACK_TEXT_COLOR_CODE_START':
			  # Remove the quotes from the value of the variable
			  black_text_color_code_start = value.strip()[1:-1]

			elif variable_name == 'TERMINAL_COLOR_CODE_END':
			  # Remove the quotes from the value of the variable
			  color_code_end = value.strip()[1:-1]

	# Check if all the variables were found
	if red_background_color_code_start is not None and green_background_color_code_start is not None and yellow_background_color_code_start is not None and blue_background_color_code_start is not None and magenta_background_color_code_start is not None and cyan_background_color_code_start is not None and white_background_color_code_start is not None and black_background_color_code_start is not None and red_text_color_code_start is not None and green_text_color_code_start is not None and yellow_text_color_code_start is not None and blue_text_color_code_start is not None and magenta_text_color_code_start is not None and cyan_text_color_code_start is not None and white_text_color_code_start is not None and black_text_color_code_start is not None and color_code_end is not None:
		return red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end

	# If any of the variables are not found, return None
	return None


def get_chat_participant_colors():
	""" 
	Gets the chat participant background and text colors from the config file.

	Reads the assistant, system, and end user variables from the environment
	configuration file. Returns a tuple containing the string values of the
	variables if found, or None if any of the variables are not present.

	Returns:
			tuple or None: A tuple containing the assistant, system, and end user
			background and text colors in the chat pane, or None, if any of the
			variables are not found.
	"""
	# Specify the path of the env file containing the variables
	file_path = os.environ["COMMBASE_APP_DIR"] + '/config/app.conf'

	# Initialize variables for the colors of the chat participants
	end_user_background_color = None
	assistant_background_color = None
	system_background_color = None
	end_user_text_color = None
	assistant_text_color = None
	system_text_color = None

	# Open the file and read its contents
	with open(file_path, 'r') as f:
		for line in f:
			# Split the line into variable name and value
			variable_name, value = line.strip().split('=')

			# Check if the variable we are looking for exists in the line
			if variable_name == 'END_USER_BACKGROUND_COLOR_IN_CHAT_PANE':
				# Remove the quotes from the value of the variable
				end_user_background_color = value.strip()[1:-1]
				
			elif variable_name == 'ASSISTANT_BACKGROUND_COLOR_IN_CHAT_PANE':
				# Remove the quotes from the value of the variable
				assistant_background_color = value.strip()[1:-1]

			elif variable_name == 'SYSTEM_BACKGROUND_COLOR_IN_CHAT_PANE':
				# Remove the quotes from the value of the variable
				system_background_color = value.strip()[1:-1]

			elif variable_name == 'END_USER_TEXT_COLOR_IN_CHAT_PANE':
				# Remove the quotes from the value of the variable
				end_user_text_color = value.strip()[1:-1]

			elif variable_name == 'ASSISTANT_TEXT_COLOR_IN_CHAT_PANE':
				# Remove the quotes from the value of the variable
				assistant_text_color = value.strip()[1:-1]

			elif variable_name == 'SYSTEM_TEXT_COLOR_IN_CHAT_PANE':
				# Remove the quotes from the value of the variable
				system_text_color = value.strip()[1:-1]

	# Check if all six variables were found
	if end_user_background_color is not None and assistant_background_color is not None and system_background_color is not None and end_user_text_color is not None and assistant_text_color is not None and system_text_color is not None:
		return end_user_background_color, assistant_background_color, system_background_color, end_user_text_color, assistant_text_color, system_text_color

	# If any of the variables are not found, return None
	return None


def get_assistant_avatar_color():
	""" 
	Gets the assistant avatar color from the config file.

	Reads the 'ASSISTANT_AVATAR_COLOR_IN_CHAT_PANE' variable from the
	environment configuration file. Returns the string value of the variable if
	found, or None if the variable is not present.

	Returns:
			srt or None: A string containing the assitant avatar color in the chat
			pane, or None, if the variable is not found.
	"""
	# Specify the path of the env file containing the variable
	file_path = os.environ["COMMBASE_APP_DIR"] + '/config/app.conf'

	# Initialize variable for the avatar color
	avatar_color = None

	# Open the file and read its contents
	with open(file_path, 'r') as f:
		for line in f:
			# Split the line into variable name and value
			variable_name, value = line.strip().split('=')

			# Check if the variable we are looking for exists in the line
			if variable_name == 'ASSISTANT_AVATAR_COLOR_IN_CHAT_PANE':
			  # Remove the quotes from the value of the variable
			  avatar_color = value.strip()[1:-1]
			  
	# Check if the variable was found
	if avatar_color is not None:
		return avatar_color 

	# If the variable was not found, return None
	return None

