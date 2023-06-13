#!/usr/bin/env python
################################################################################
#                            commbase_tts_pyttsx3.py                           #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
#                                                                              #
# Change History                                                               #
# 06/10/2023  Esteban Herrera Original code.                                   #
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
# Utilizes text-to-speech capabilities to read out the content of a file or any
# input text provided.

# Requirements
import argparse
import fileinput
import os.path
import pyttsx3
import sys

class TextToSpeech:
	def __init__(self):
		self.engine = None
		self.voices = None

	def set_up_text_to_speech(self, rate, voice_index):
		"""
		Initializes the text-to-speech engine, retrieves the available voices, and
		sets properties for the engine's rate and voice.
		"""
		self.engine = pyttsx3.init()
		self.voices = self.engine.getProperty('voices')
		self.engine.setProperty('rate', rate)
		self.engine.setProperty('voice', self.voices[voice_index].id)

	def talk(self, text):
		"""
		Sets up the text-to-speech engine, utilizes it to speak out the provided 
		text, and ensures the speech synthesis is completed before proceeding.
		"""
		self.engine.say(text)
		self.engine.runAndWait()

	def read_file(self, file_path):
		"""
		Attempts to read the contents of the specified file, handles potential
		errors such as file not found or IO errors, and returns the file's content
		if it is successfully read.
		"""
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

	def main(self):
		"""
		Serves as the entry point of the program.
		This method is responsible for reading input text from either a file or
		standard input, storing it in the file_content variable, and then passing it
		to the talk() method for speech synthesis. If no input text is provided, it
		displays an appropriate message.
		"""
		parser = argparse.ArgumentParser(description='Text-to-Speech with pyttsx3')
		parser.add_argument('--rate', type=int, default=145, help='Voice speed')
		parser.add_argument('--voice-index', type=int, default=0, help='Index of the voice to use')
		args = parser.parse_args()

		self.set_up_text_to_speech(args.rate, args.voice_index)

		file_content = ''
		for line in sys.stdin:
			file_content += line

		if file_content:
			self.talk(file_content)
		else:
			print("No input text provided.")


if __name__ == '__main__':
    tts = TextToSpeech()
    tts.main()

