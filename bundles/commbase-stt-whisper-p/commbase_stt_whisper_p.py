#!/usr/bin/env python
################################################################################
#                            commbase-stt-whisper-p                            #
#                                                                              #
# An ASR (Automatic Speech Recognition) engine.                                #
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

from config import CONFIG_FILE_PATH
from file_paths import get_chat_log_file

# A temporary directory and a file path within that directory
temp_file = tempfile.mkdtemp()
save_path = os.path.join(temp_file, 'temp.wav')

# A temporary file path
temp_file_path = get_chat_log_file()


def listen():
    """
    Initializes a speech recognizer, captures audio input from a microphone,
    adjusts for ambient noise, saves the recorded audio as a WAV file, and
    handles any exceptions that may occur during the process, and then returns
    the path of the saved audio file.
    """
    listener = sr.Recognizer()  # Create an instance of Recognizer
    with sr.Microphone() as source:
        print("COMMBASE: Listening...")
        #for index, name in enumerate(sr.Microphone.list_microphone_names()):
        #    print("Microphone with name \"{1}\" found for `Microphone(device_index={0})`".format(index, name))
        #listener.adjust_for_ambient_noise(source)

        try:
            audio = listener.listen(source, timeout=30)  # Set a timeout of 30 seconds
            print("COMMBASE: Processing...")
            data = io.BytesIO(audio.get_wav_data())
            audio_clip = AudioSegment.from_file(data)
            audio_clip.export(save_path, format='wav')
        except sr.WaitTimeoutError:
            print("COMMBASE: Speech stopped. Recognizing...")
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


def write_to_temp_file(text):
    end_user_text = "END USER:" + text + "\n"
    with open(temp_file_path, 'a') as temp_file:
        temp_file.write(end_user_text)


# Closes the temporary file
def close_temp_file():
    if os.path.exists(temp_file_path):
        os.remove(temp_file_path)


def main():
    try:
        while True:
            response = recognize_audio(listen())
            print(f"END USER: {response}")

            # Write the transcribed text to a temporary file
            write_to_temp_file(response)
    finally:
        # Ensure the temporary file is closed and cleaned up
        close_temp_file()


# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
    main()
