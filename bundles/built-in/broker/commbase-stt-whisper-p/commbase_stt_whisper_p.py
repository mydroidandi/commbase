#!/usr/bin/env python
################################################################################
#                            commbase-stt-whisper-p                            #
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

# commbase_stt_whisper_p.py
# Records audio input from the microphone, performs speech recognition on the
# recorded audio, and prints the recognized text.
# Requires the Whisper model used in the code. The first execution of the
# program downloads it automatically.
# Requires to run redirecting the standard error output (stderr) to the null 
# device (/dev/null) like this to avoid ALSA output messages:
# shell> python commbase_stt_whisper_p.py 2>& /dev/null

# Requirements
import io
from pydub import AudioSegment
import speech_recognition as sr
import whisper
import tempfile
import os

# A temporary directory and a file path within that directory
temp_file = tempfile.mkdtemp()
save_path = os.path.join(temp_file, 'temp.wav')

# Initialize the text-to-speech engine, retrieve the available voices, and set
# properties for the engine's rate and voice.
def listen():
	"""
	Initializes a speech recognizer, captures audio input from a microphone,
	adjusts for ambient noise, saves the recorded audio as a WAV file, and handles
	any exceptions that may occur during the process, and then returns the path of
	the saved audio file.
	"""
	listener = sr.Recognizer()  # Create an instance of Recognizer
	try:
		with sr.Microphone() as source:
			print("END USER:")
			listener.adjust_for_ambient_noise(source)
			audio = listener.listen(source)
			data = io.BytesIO(audio.get_wav_data())
			audio_clip = AudioSegment.from_file(data)
			audio_clip.export(save_path, format='wav')
	except Exception as e:
		print(e)
	return save_path
	

def recognize_audio(save_path):
	"""
	Uses the Whisper library to load a pre-trained audio recognition model and
	transcribes an audio file located at save_path using that model. It then
	returns the transcribed text extracted from the transcription result.
	"""
	audio_model = whisper.load_model('base')
	transcription = audio_model.transcribe(save_path, language='english', fp16=False)
	return transcription['text']


def main():
	"""
	Servers as the entry point of the program and orchestrates the speech 
	recognition process.
	"""
	response = recognize_audio(listen())
	print(response)


# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
	main()
