#!/usr/bin/env python
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

# commbase_tts_pyttsx3.py
# TODO: Desc

# Requirements
import os.path
import pyttsx3

# Initialize the text-to-speech engine, retrieve the available voices, and set
# properties for the engine's rate and voice.
engine = pyttsx3.init()
voices = engine.getProperty('voices')
engine.setProperty('rate', 145)
engine.setProperty('voice', voices[18].id)


def talk(text):
	"""
	"""
	engine.say(text)
	engine.runAndWait()


def read_file(file_path):
    try:
        with open(file_path, 'r') as file:
            content = file.read()
            return content
    except FileNotFoundError:
        print("File not found!")
        return None
    except IOError:
        print("An error occurred while reading the file!")
        return None


#file_path = 'jokes.txt'  # Replace with your file path
file_path = os.environ["COMMBASE_APP_DIR"] + '/src/default/broker/discourses/jokes/9_jokes_joke'
file_content = read_file(file_path)


"""
def main():
	for voice in voices:
		print(voice)
"""


def main():
	"""
	Servers as the entry point of the program and orchestrates the speech 
	recognition process.
	"""
	talk(file_content)
	print(file_content)


# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
	main()
