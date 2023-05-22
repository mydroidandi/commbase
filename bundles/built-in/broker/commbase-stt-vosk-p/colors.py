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

# colors.py
# This file provides utility functions for working with terminal colors. It
# includes functions to modify the text color, background color, and text 
# formatting in the terminal output. These functions can be used to enhance the
# visual appearance and readability of command-line interfaces.

# Requirements
import os.path
from functions import load_config_file


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
	# The path of the env configuration file
	file_path = load_config_file()

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
	# The path of the env configuration file
	file_path = load_config_file()

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
	# The path of the env configuration file
	file_path = load_config_file()

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


def set_end_user_background_color(end_user_background_color):
	"""
	Sets the background color for the END USER.

	Parameters:
		  end_user_background_color (str): The desired background color for the
		  END USER.
		      Valid options are: 'red', 'green', 'yellow', 'blue', 'magenta',
		      'cyan', 'white', 'black'.

	Returns:
		  str: The start code for the selected background color.

	Notes:
		  This function internally uses the get_terminal_colors() function to
		  obtain the necessary color codes.
	"""
	# Assign the values returned by get_terminal_colors()
	red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

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

	return end_user_background_color_start


def set_assistant_user_background_color(assistant_background_color):
	"""
	Sets the background color for the ASSISTANT user.

	Parameters:
		  assistant_background_color (str): The desired background color for the
		  ASSISTANT user.
		      Valid options are: 'red', 'green', 'yellow', 'blue', 'magenta',
		      'cyan', 'white', 'black'.

	Returns:
		  str: The start code for the selected background color.

	Notes:
		  This function internally uses the get_terminal_colors() function to obtain
		  the necessary color codes.
	"""
	# Assign the values returned by get_terminal_colors()
	red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

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

	return assistant_background_color_start


def set_system_user_background_color(system_background_color):
	"""
	Sets the background color for the SYSTEM user.

	Parameters:
		  system_background_color (str): The desired background color for the SYSTEM
		  user.
		      Valid options are: 'red', 'green', 'yellow', 'blue', 'magenta',
		      'cyan', 'white', 'black'.

	Returns:
		  str: The start code for the selected background color.

	Notes:
		  This function internally uses the get_terminal_colors() function to obtain
		  the necessary color codes.
	"""
	# Assign the values returned by get_terminal_colors()
	red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

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

	return system_background_color_start


def set_end_user_text_color(end_user_text_color):
	"""
	Sets the text color for the END USER user.

	Parameters:
		  end_user_text_color (str): The desired text color for the END USER user.
		      Valid options are: 'red', 'green', 'yellow', 'blue', 'magenta',
		      'cyan', 'white', 'black'.

	Returns:
		  str: The start code for the selected text color.

	Notes:
		  This function internally uses the get_terminal_colors() function to obtain
		  the necessary color codes.
	"""
	# Assign the values returned by get_terminal_colors()
	red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

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

	return end_user_text_color_start


def set_assistant_user_text_color(assistant_text_color):
	"""
	Sets the text color for the ASSISTANT user.

	Parameters:
		  assistant_text_color (str): The desired text color for the ASSISTANT user.
		      Valid options are: 'red', 'green', 'yellow', 'blue', 'magenta',
		      'cyan', 'white', 'black'.

	Returns:
		  str: The start code for the selected text color.

	Notes:
		  This function internally uses the get_terminal_colors() function to obtain
		  the necessary color codes.
	"""
	# Assign the values returned by get_terminal_colors()
	red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

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

	return assistant_text_color_start


def set_system_user_text_color(system_text_color):
	"""
	Sets the text color for the SYSTEM user.

	Parameters:
		  system_text_color (str): The desired text color for the SYSTEM user.
		      Valid options are: 'red', 'green', 'yellow', 'blue', 'magenta',
		      'cyan', 'white', 'black'.

	Returns:
		  str: The start code for the selected text color.

	Notes:
		  This function internally uses the get_terminal_colors() function to obtain
		  the necessary color codes.
	"""
	# Assign the values returned by get_terminal_colors()
	red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

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

	return system_text_color_start


def set_assistant_avatar_color(avatar_color):
	"""
	Sets the avatar color for the assistant.

	Parameters:
		  avatar_color (str): The desired color for the assistant's avatar.
		      Valid options are: 'red', 'green', 'yellow', 'blue', 'magenta',
		      'cyan', 'white', 'black'.

	Returns:
		  str: The start code for the selected avatar color.

	Notes:
		  This function internally uses the get_terminal_colors() function to obtain
		  the necessary color codes.
	"""
	# Assign the values returned by get_terminal_colors()
	red_background_color_code_start, green_background_color_code_start, yellow_background_color_code_start, blue_background_color_code_start, magenta_background_color_code_start, cyan_background_color_code_start, white_background_color_code_start, black_background_color_code_start, red_text_color_code_start, green_text_color_code_start, yellow_text_color_code_start, blue_text_color_code_start, magenta_text_color_code_start, cyan_text_color_code_start, white_text_color_code_start, black_text_color_code_start, color_code_end = get_terminal_colors()

	# Set the assistant avatar color
	if avatar_color == "red":
		avatar_color_start = red_text_color_code_start
	elif avatar_color == "green":
		avatar_color_start = green_text_color_code_start
	elif avatar_color == "yellow":
		avatar_color_start = yellow_text_color_code_start
	elif avatar_color == "blue":
		avatar_color_start = blue_text_color_code_start
	elif avatar_color == "magenta":
		avatar_color_start = magenta_text_color_code_start
	elif avatar_color == "cyan":
		avatar_color_start = cyan_text_color_code_start
	elif avatar_color == "white":
		avatar_color_start = white_text_color_code_start
	elif avatar_color == "black":
		avatar_color_start = black_text_color_code_start

	return avatar_color_start

