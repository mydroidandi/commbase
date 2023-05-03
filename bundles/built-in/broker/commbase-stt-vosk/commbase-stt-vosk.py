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

# commbase-stt-vosk.py
# This is a speech recognition program that uses the Vosk library. It takes
# audio input, processes it, and outputs the recognized text. The recognized
# text is then cleaned up, and saved in a file.
# Requires a minimun version of python3.7 for running the code correctly.

# Imports
import argparse
import os
import queue
import sounddevice as sd
import vosk
import sys
import subprocess
import string
import os.path

# The Commbase environment directory and the path to the model:
COMMBASE_MODEL = '$COMMBASE_ROOT_DIR/commbase/bundled/broker/vosk/model'
#print (string.Template(COMMBASE_MODEL).substitute(os.environ))

# Color codes for different background colors
red_bg_color_code_start = "1;41m"
green_bg_color_code_start = "1;42m"
yellow_bg_color_code_start = "1;43m"
blue_bg_color_code_start = "1;44m"
magenta_bg_color_code_start = "1;45m"
cyan_bg_color_code_start = "1;46m"
black_bg_color_code_start = "1;40m"

color_code_end = "1;m"

# Files
RESULT_DATA_FILE = os.environ["COMMBASE_ROOT_DIR"] + '/commbase/data/.data.dat'
PREV_DATA_FILE = os.environ["COMMBASE_ROOT_DIR"] + '/commbase/data/.prev_data.dat'
COMMBASE_HISTORY_FILE = os.environ["COMMBASE_ROOT_DIR"] + '/commbase/history/.commbase_history'

STOP_STR = "okay stop"

q = queue.Queue()


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
  If the status parameter is not None, it prints an error message to the standard error stream.

  Parameters:
      indata : numpy.ndarray
          The input audio data as a NumPy array.
      frames : int
          The number of frames in the input data.
      time : CData
          A ctypes structure containing timing information about the input data.
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
  Strip a given string of unwanted characters and whitespaces.

  Args:
      string (str): The input string to be processed.

  Returns:
      str or None: The resulting string after being stripped of unwanted
      characters and whitespaces. Returns None if the input string is None or
      does not contain the 'text' substring.
  """
  if string is None:
    return None

  # Get the substring containing the text
  text_start = find_text(string)
  if text_start is None:
      return None
  text = string[text_start+len('"text" : "'):]

  # Replace unwanted characters and whitespaces
  text = text.replace('"', '').replace('}', '').strip()

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
  string = rec.Result()
  trimmed_string = strip_string(string)
  if trimmed_string is None:
    return

  print(f'\033[{black_bg_color_code_start}END USER:\033[{color_code_end} {trimmed_string} \033[0m')

  # Write to data files
  with open(RESULT_DATA_FILE, 'w') as f:
    f.write(trimmed_string)
  with open(PREV_DATA_FILE, 'w') as f:
    f.write(trimmed_string)

  # Append to history file
  with open(COMMBASE_HISTORY_FILE, 'a') as f:
    f.write(trimmed_string + "\n")

  # Process the command if it doesn't contain the stop string
  if STOP_STR not in trimmed_string:
    #subprocess.run(['bash', os.environ["COMMBASE_ROOT_DIR"] + '/commbase/src/broker/central-processing.sh'])
    print(f'\033[{red_bg_color_code_start}COMMBASE:\033[{color_code_end} Processing ... {trimmed_string} \033[0m')
  else:
    print(f'\033[{red_bg_color_code_start}COMMBASE:\033[{color_code_end} Processing ... okay stop \033[0m')


def display_avatar():
  """
  Prints the Commbase avatar.

  Parameters:
      None.

  Returns:
      None.
  """
  avatar = '''
  ____  ________  _ ____ _________
  _ _ ___ __-___╔⌂_┐ __________ _
  __ _'_ ║⌂j░-╬]j` ▒╨¿r«Ñ__r- ___
  ___  tU 7╩╫╫DÜ╨« ╓DÜ╫n╫]≥╫*_____
  __ __]7X^╟*╗║▀╨ª╢▒▀▌ßBÜ>«"___«_'
  ___*,"7Ü¼═▀#Ñ▌╫▒╫╬Q╫¼▌U╬░%.≡ ___
  __ _`ju└╠╦j░╟▒╫▌▓▀╠Å▀╬╫Å¡╚n _ _ 
  ___-«░τ╬Ñ▌≡╣▒╫▀╫M╬▄Å▀╬]Ü; ` __ 
  _____`,√²j╙▒╬▓▒▀╫▒╫φÑ╠H]d^_ _  ^
  __   ÖKÖ5▒Ω7╬▌▄▓▀▒▒▀░«H«`r ⌐__ _
  ___ _~-_²``rΩ"W╫6╬]î═''" ______ 
  ,___ ╘_-____  │ÅÑ╩_  __ _ⁿ╧~__ ┌
  ^%╟¿,««__,∩ _« ▒Ñ___╔__  ]æⁿjU'_
  __ⁿ╨┤╢▄▒╟╜Q_ __╟ß__j½Φ░╫╢╫S╨╚` _
  __ ~²╠▒▓▌▌ÑH __╫╕__`²D╫╨╫╜^^____
  _____\8╫RÑÅ░___╟P___╠≤NΩⁿⁿ______
  _____ __Ñ¼░H_  ╠M   ╦░_╘________
  _____ _ "]ñ▄╪═,--."Y*╛___ _____ 
  ___________  ______~  __________
  __  __________``,_______ -______
  ⁿ___  ________╚ _ ____`_________

  '''
  print(avatar)


# Create ArgumentParser object with add_help=False to disable default help
# message.
parser = argparse.ArgumentParser(add_help=False)

# Add a command-line argument for listing audio devices
parser.add_argument(
  '-l', '--list-devices', action='store_true', # store_true indicates that the argument does not require a value and sets it to True if present
  help='show list of audio devices and exit'
)

# Parse the command-line arguments, with any unrecognized arguments returned as
# a list in 'remaining'.
args, remaining = parser.parse_known_args()

# If the 'list-devices' argument was passed, print the list of audio devices and
# exit the program.
if args.list_devices:
  print(sd.query_devices())
  parser.exit(0) # exit the program with status code 0

# create a new ArgumentParser object with a description and formatter
parser = argparse.ArgumentParser(
  description=__doc__, # use the script's docstring as the description
  formatter_class=argparse.RawDescriptionHelpFormatter, # use a raw formatter for the description
  parents=[parser] # inherit the 'list-devices' argument from the previous parser
)

# Add additional arguments for specifying a filename, model path, input device,
# and sampling rate.
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
    args.model = string.Template(COMMBASE_MODEL).substitute(os.environ)
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
    display_avatar()
    #print('Press Ctrl+C to stop the recording')
    print(f'\033[{red_bg_color_code_start}COMMBASE:\033[{color_code_end} Mute the microphone to pause the recording ... \033[0m')
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

