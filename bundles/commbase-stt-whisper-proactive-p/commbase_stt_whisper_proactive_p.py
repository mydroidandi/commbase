#!/usr/bin/env python
################################################################################
#                       commbase-stt-whisper-proactive-p                       #
#                                                                              #
# A proactive version of STT ASR (Automatic Speech Recognition) engine.        #
#                                                                              #
# Change History                                                               #
# 02/29/2024  Esteban Herrera Original code.                                   #
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

# commbase_stt_whisper_proactive_p.py
# Records audio input from the microphone, performs speech recognition on the
# recorded audio, and prints the recognized text.
# Requires the Whisper model used in the code. The first execution of the
# program downloads it automatically.
# Requires to run redirecting the standard error output (stderr) to the null
# device (/dev/null) like this to avoid ALSA output messages:
# shell> python commbase_stt_whisper_p.py 2>& /dev/null

# Imports
import io
import os
from pydub import AudioSegment
import speech_recognition as sr  # Requires pyaudio
import tempfile
import whisper
from config import CONFIG_FILE_PATH
from file_paths import get_chat_log_file
from functions import (
    get_assistant_log_severity_levels_on,
    get_chat_participant_names,
    get_log_severity_level_2,
    get_stt_engine_language,
    get_stt_whisper_proactive_timeout
)

# A temporary directory and a file path within that directory
temp_file = tempfile.mkdtemp()
save_path = os.path.join(temp_file, 'temp.wav')

# A temporary file path
temp_file_path = get_chat_log_file()

# Set the values returned by get_chat_participant_names()
end_user_name, assistant_name = get_chat_participant_names()


def listen():
    """
    Initializes a speech recognizer, captures audio input from a microphone,
    adjusts for ambient noise, saves the recorded audio as a WAV file, and
    handles any exceptions that may occur during the process, and then returns
    the path of the saved audio file.

    The timeout for speech input is determined by the duration allowed for
    the user to provide speech input before raising a WaitTimeoutError.

    Returns:
    str: The path of the saved audio file.

    Raises:
    sr.WaitTimeoutError: If the speech recognition times out due to inactivity.

    Dependencies:
    - speech_recognition (imported as sr)
    - io
    - pydub (imported as AudioSegment)

    Example:
    save_path = listen()
    print(f"Audio file saved at: {save_path}")
    """
    # Set the values returned by get_stt_whisper_proactive_timeout().
    stt_engine_timeout = get_stt_whisper_proactive_timeout()
    listener = sr.Recognizer()  # Create an instance of Recognizer
    with sr.Microphone() as source:
        discourse = "Listening..."
        print(f"{assistant_name} {discourse}")
        # for index, name in enumerate(sr.Microphone.list_microphone_names()):
        #     print("Microphone with name \"{1}\" found for `Microphone(device_index={0})`".format(index, name))
        # listener.adjust_for_ambient_noise(source)

        try:
            audio = listener.listen(source, timeout=int(stt_engine_timeout))  # Set a timeout=15 (in seconds)
            discourse = "Processing..."
            print(f"{assistant_name} {discourse}")
            data = io.BytesIO(audio.get_wav_data())
            audio_clip = AudioSegment.from_file(data)
            audio_clip.export(save_path, format='wav')
        except sr.WaitTimeoutError:
            discourse = "Speech stopped. Recognizing..."
            print(f"{assistant_name} {discourse}")
    return save_path


def recognize_audio(save_path):
    """
    Uses the Whisper library to load a pre-trained audio recognition model and
    transcribes an audio file located at save_path using that model.

    Parameters:
    - save_path (str): The path to the audio file for transcription.

    Returns:
    - str: The transcribed text extracted from the transcription result.

    Example:
    ```python
    transcription_result = recognize_audio("path/to/audio/file.wav")
    print(transcription_result)
    ```
    """
    # Set the value returned by get_stt_engine_language()
    stt_engine_language = get_stt_engine_language()
    audio_model = whisper.load_model('base')
    transcription = audio_model.transcribe(save_path, language=stt_engine_language, fp16=False)  # Syntax: language='english'
    return transcription['text']


def write_to_temp_file(text):
    """
    Writes the provided text to a temporary file.

    Parameters:
        text (str): The text to be written to the temporary file.

    Returns:
        None

    Raises:
        IOError: If there is an issue writing to the temporary file.

    Note:
        If logging severity levels are enabled, the severity level is appended
        to the end user's name along with the text. If not enabled, only the
        end user's name and the text are appended.
    """
    # Set the value returned by get_assistant_log_severity_levels_on()
    assistant_log_severity_levels_on = get_assistant_log_severity_levels_on()
    # Set the value returned by get_log_severity_level_2()
    log_severity_level_2 = get_log_severity_level_2()

    if assistant_log_severity_levels_on == "True":
        severity_level = log_severity_level_2
        end_user_text = end_user_name + " [" + severity_level + "]:" + text + "\n"
        with open(temp_file_path, 'a') as temp_file:
            temp_file.write(end_user_text)
    else:
        end_user_text = end_user_name + text + "\n"
        with open(temp_file_path, 'a') as temp_file:
            temp_file.write(end_user_text)


# Closes the temporary file
def close_temp_file():
    """
    Removes a temporary file if it exists.

    This function checks if the temporary file specified by the variable
    'temp_file_path' exists.
    If it does, the file is removed using the 'os.remove' method. If the file
    does not exist, the function does nothing.

    Note:
    - Ensure that 'temp_file_path' is properly defined before calling this
      function.

    Example:
    >>> temp_file_path = '/path/to/temp/file.txt'
    >>> close_temp_file()
    """
    if os.path.exists(temp_file_path):
        os.remove(temp_file_path)


def main():
    """
    The main function for audio recognition and transcription.

    This function runs an infinite loop that continuously listens for audio
    input, recognizes the audio using the `recognize_audio` function, prints
    the response from the recognition process, and writes the transcribed text
    to a temporary file using the `write_to_temp_file` function. It ensures
    proper cleanup of the temporary file by closing it in the `finally` block.
    """
    try:
        while True:
            response = recognize_audio(listen())
            print(f"{end_user_name} {response}")

            # Write the transcribed text to a temporary file
            write_to_temp_file(response)
    finally:
        # Ensure the temporary file is closed and cleaned up
        close_temp_file()


# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
    main()
