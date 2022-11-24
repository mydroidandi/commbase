#!/usr/bin/env python3.7
# File: commbase-speech-recognition-vosk.py
# Description: Returns a speech recognition as a string for commbase-process-vosk-pc-default.sh or
# any other of its current versions.

import argparse
import os
import queue
import sounddevice as sd
import vosk
import sys
import subprocess
import string
import os.path
import colorama

# Initialize colored prints
#colorama.init()

# Highlight text output
#print (colorama.Back.GREEN + "")

# Get environment variables
# The Commbase directory + the path to the model:
COMMBASE_MODEL = '$HOME/Developer/Commbase/commbase/base-vosk/voice-recognition/model'
#COMMBASE_MODEL = '$HOME/Commbase/commbase/base-vosk/voice-recognition/model'
#print (string.Template(COMMBASE_MODEL).substitute(os.environ))

# Update the path to .result.data in the function 'writetofile'
# Update the path to .previous_result.data in the function 'writetofiletwo'
# Update the path to .result_list in the function 'append_new_line'
# Update the path to commbase-process-vosk-pc-default.sh in the if statement that follows the
# function 'append_new_line'

q = queue.Queue()

def int_or_str(text):
    """Helper function for argument parsing."""
    try:
        return int(text)
    except ValueError:
        return text

def callback(indata, frames, time, status):
    """This is called (from a separate thread) for each audio block."""
    if status:
        print(status, file=sys.stderr)
    q.put(bytes(indata))

# Print the result to screen
def print_result():
	string = rec.Result()

	# Find the index of the sub_string '"text" : "' in the string
	def find_str(string, char):
		index = 0

		if char in string:
			c = char[0]
			for ch in string:
				if ch == c:
					if string[index:index+len(char)] == char:
				    		return index

				index += 1

		return -1

	# Removes all the counted chars before the string
	# text = 'lipsum'
	# text[3:]
	# 'sum'
	lrtrimstring = string[find_str(str(string), '"text" : "'):]

	# Replace substrings with new substrings in string
	a = '"text" : "'
	b = ''
	c = '"'
	d = ''
	e = '}'
	f = ''
	#g = 'the'
	#h = ''
	lrtrimstring = lrtrimstring.replace(a, b).replace(c, d).replace(e, f)

	# Removes (beginning and end) any leading and trailing whitespaces including tabs (\t)
	lrtrim_str_the = lrtrimstring.strip()

	# Removes the sub string 'the ' from the beginning of lrtrimstring
	#ltrim_str_the = lrtrimstring[4:]
	if lrtrim_str_the.startswith('the'):
		rtrim_str_the = lrtrim_str_the[3:]
	else:
		rtrim_str_the = lrtrim_str_the

	# Removes a substring from the end of a string
	# On Python 3.8 and older you can use endswith and slicing
	#if rtrim_str_the.endswith('the \n'):
	#if rtrim_str_the.endswith('the\t'):
	if rtrim_str_the.endswith('the'):
		trim_string = rtrim_str_the[:-3]
		print("VOICE: " + trim_string)
	else:
		trim_string = rtrim_str_the
		print("VOICE: " + trim_string)

	# Write strings to files

	def writetofile():
		RESULT_DATA_FILE = os.environ["HOME"] + '/Developer/Commbase/commbase/base-vosk/.result.data'
		#RESULT_DATA_FILE = os.environ["HOME"] + '/Commbase/commbase/base-vosk/.result.data'
		outputfile = open(RESULT_DATA_FILE, 'w')  # 'w' overwrites the file or creates it and writes in it
		outputfile.write(trim_string)
		outputfile.close()

	def writetofiletwo():
		RESULT_DATA_FILE = os.environ["HOME"] + '/Developer/Commbase/commbase/base-vosk/.previous_result.data'
		#RESULT_DATA_FILE = os.environ["HOME"] + '/Commbase/commbase/base-vosk/.previous_result.data'
		outputfile = open(RESULT_DATA_FILE, 'w')  # 'w' overwrites the file or creates it and writes in it
		outputfile.write(trim_string)
		outputfile.close()

	def append_new_line():
		COMMBASE_HISTORY = os.environ["HOME"] + '/Developer/Commbase/commbase/base-vosk/.result_list'
		#RESULT_DATA_FILE = os.environ["HOME"] + '/Commbase/commbase/base-vosk/.result_list'
		outputfile = open(COMMBASE_HISTORY, 'a')  # 'wa' the file or creates it and writes in it
		outputfile.write(trim_string)
		outputfile.write("\n")
		outputfile.close()

	if trim_string != '':
		stop_str = "okay stop"
		if stop_str in trim_string:
			writetofile()
			#append_new_line()
			print("TRACE: Processing Okay Stop ...")
		else:
			writetofile()
			writetofiletwo()
			#append_new_line()

		COMMBASE_PROCESS_FILE = 'bash ' + os.environ["HOME"] + '/Developer/Commbase/commbase/base-vosk/commbase-process-vosk-pc-default.sh'
		#COMMBASE_PROCESS_FILE = 'bash ' + os.environ["HOME"] + '/Commbase/commbase/base-vosk/commbase-process-vosk-pc-default.sh'
		o = subprocess.run (COMMBASE_PROCESS_FILE, shell=True, capture_output=True)
		# Prints clean, as text:
		print(o.stdout.decode())

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument(
    '-l', '--list-devices', action='store_true',
    help='show list of audio devices and exit')
args, remaining = parser.parse_known_args()
if args.list_devices:
    print(sd.query_devices())
    parser.exit(0)
parser = argparse.ArgumentParser(
    description=__doc__,
    formatter_class=argparse.RawDescriptionHelpFormatter,
    parents=[parser])
parser.add_argument(
    '-f', '--filename', type=str, metavar='FILENAME',
    help='audio file to store recording to')
parser.add_argument(
    '-m', '--model', type=str, metavar='MODEL_PATH',
    help='Path to the model')
parser.add_argument(
    '-d', '--device', type=int_or_str,
    help='input device (numeric ID or substring)')
parser.add_argument(
    '-r', '--samplerate', type=int, help='sampling rate')
args = parser.parse_args(remaining)

try:
    if args.model is None:
        args.model = string.Template(COMMBASE_MODEL).substitute(os.environ)
        #args.model = "voice-recognition/model"
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
            print('#' * 80)
 	        #print('Press Ctrl+C to stop the recording')
            print('Mute the Microphone to pause the recording')
            print('#' * 80)

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