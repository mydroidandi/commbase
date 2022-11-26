# Commbase <img align="center" alt="Visual Studio Code" width="10%" src="../commbase.png" /> User's Guide

<p>
<img align="center" alt="Visual Studio Code" width="100%" src="../commbase.png" />
</p>

# Content

- [1 Introduction](#1-introduction)
- [2 Start, Stop, and Teleport Commbase application](#2-start-stop-and-teleport-commbase-application)
	- [commbase start](#commbase-start)
	- [commbase stop](#commbase-stop)
	- [commbase teleport](#commbase-teleport)
- [3 Useful system commands](#3-useful-system-commands)
- [4 The Commbase user interface](#4-the-commbase-user-interface)
	- [The window Extension](#the-window-extension)
- [5 Default Commbase commands](#5-default-commbase-commands)
	- [Commbase Commmands unique for the Command Line](#commbase-commmands-unique-for-the-command-line)
	- [Commbase Management Commands](#commbase-management-commands)
	- [Commbase Common Commands](#commbase-common-commands)
- [6 Create new voice commands basics](#6-create-new-voice-commands-basics)
	- [Verbosity Levels](#verbosity-levels)
	- [Proposed Command Conventions](#proposed-command-conventions)
		- [Modes](#modes)
		- [Step by Step Mode](#step-by-step-mode)
		- [Normal Mode](#normal-mode)
			- [Cancel Commands Already Ordered](#cancel-commands-already-ordered)
			- [Verify/Modify Commbase Status](#verifymodify-commbase-status)
			- [Activate/Deactivate Local Hardware or Things](#activatedeactivate-local-hardware-or-things)
			- [Open/Close Applications](#openclose-applications)
			- [Star/Stop Services](#starstop-services)
			- [Install Applications](#install-applications)
			- [System Clipboard](#system-clipboard)
			- [File Operations](#file-operations)
			- [Search Web Pages](#search-web-pages)
			- [Translate](#translate)
			- [Calendar](#calendar)
			- [Entertainment](#entertainment)
			- [System Status](#system-status)
			- [Security](#security)
			- [Networking](#networking)
			- [Remote Access](#remote-access)
			- [Development](#development)
- [7 Hints on saying and creating voice commands](#7-hints-on-saying-and-creating-voice-commands)
- [8 Commands setup](#8-commands-setup)
	- [The $COMMBASE directory](#the-commbase-directory)
	- [The Commbase processing file](#the-commbase-processing-file)
- [9 Training Commbase by Assembling Skillsets](#9-training-commbase-by-assembling-skillsets)
- [10 Keyboard Shortcuts](#10-keyboard-shortcuts)
	- [Keyboard Shortcuts Cheat Sheet](#keyboard-shortcuts-cheat-sheet)
		- [Commbase Key Bindings](#commbase-key-bindings)
		- [Desktop Environment and Operating System](#desktop-environment-and-operating-system)
		- [Gnome Terminal](#gnome-terminal)
		- [Neovim / Emacs](#neovim--emacs)
		- [OBS](#obs)
		- [SimpleScreenRecorder](#simplescreenrecorder)
		- [Text Editors and IDEs](#text-editors-and-ides)
		- [Tmux](#tmux)
		- [VS Code](#vs-code)
		- [Web Browser](#web-browser)
	- [Input Remapper](#input-remapper)
- [11 Commbase for Software Development](#11-commbase-for-software-development)
	- [Get Commbase up and running for development](#get-commbase-up-and-running-for-development)
	- [Create a Virtual Machine for Software Development](#create-a-virtual-machine-for-software-development)
	- [Commbase Commands for Development with Neovim](#commbase-commands-for-development-with-neovim)

# 1 Introduction

Commbase is a programmable assistant for computers and other appliances, originally developed by the
Computer Scientist Esteban Herrera, in 2022. It works on general purpose operating systems without
requiring internet connection. He/She can be improved, by using Natural Language Processing, Deep
Learning, Artificial Intelligence, and programming languages as described in your User's Guide.

# 2 Start, Stop, and Teleport Commbase application

## commbase start

You can start the Commbase session in any terminal's command line, by using one of two
methods:
1. Just by running this command:
`$ commbase start`
To run Commbase as a command:
The command must be set up. Checkout how to set up the command in the file "INSTALL."
2. Exotic, or probably considered awkward alternatives to get Commbase up and running:
`$ cd $HOME/Commbase/commbase/base-vosk`
`$ bash commbase-vosk-start.sh`
Or use:
`$ ./commbase-vosk-start.sh`
Or wherever you are in the file system, do run:
`.$HOME/Commbase/commbase/base-vosk/commbase-vosk-start.sh`

## commbase stop

Stop/Close the Commbase session:
1. The best way to stop Commbase is using the killer voice command "disconnect yourself"
2. A second option consists of the invocation of commbase in the command line:
$ commbase stop
3. A third way requires to kill the Commbase session like this:
$ tmux list-sessions
$ tmux kill-session -t Commbase-0

## commbase teleport

Syntax:
$ commbase teleport
Teleport can be used in the following cases:
1. Outside Commbase it will re-spawn in a new terminal or terminal tab, including all the existent
Commbase window output characters.
2. Whenever you completely close the Commbase terminal UX, Commbase can't be seen but still has the
ability to interact via voice with you, but incapable of running graphical applications. In such
case, just teleport and Commbase re-appears without requiring to stop it and start it once again.
3. It can be used as a 3rd alternative to start commbase.

# 3 Useful system commands

List all the active sessions:
$ tmux list-sessions

Kill the Commbase session:
$ tmux kill-session -t Commbase-0

To display the Commbase session pane numbers:
In the tmux session, press CTRL+B, release and then press q

Close duplicated tmux sessions:
It does not happen, but in case of that the Commbase session does not terminate itself appropriately
before it restarts, its terminal UX would look incomplete due to session duplicates. In such cases,
just close all the duplicated Commbase sessions and restart the Commbase application session like
this:
Close the current terminal and reopen it or go to the Extension window:
CTRL + b, 2
List the tmux sessions:
$ tmux list-sessions
Close the all the duplicated sessions:
$ tmux kill-session -t Commbase-2
$ tmux kill-session -t Commbase-1
$ tmux kill-session -t Commbase-0
Alternatively, you can kill all the tmux sessions at once:
$ pkill tmux
Start Commbase again:
$ ./commbase-vosk-start.sh

# 4 The Commbase user interface

Commbase is composed by 5 panes in 2 windows:

Window 1: Commbase, contains four panes:

Pane 1: It is the speech recognizer pane.

Pane 2: It is the VU-meter pane.

Pane 3: It is the audio mixer pane.

Pane 4: It is the Commbase input and output interface among Commbase, the user and the operating
system.

Window 2: Extension, contains just 1 pane:

Pane: It is used as a long logs pane, for long standard inputs and outputs. Use it for creating 
and/or running applications such as Neofetch and others, which don't not load out of the box from
the Pane 4, due to their application's nature. Also, use it to create and/or run program commands
in any Commbase version specific for devices without screens.

## The window Extension

Go to the window Extension:
Press CTRL + b, then press 2

Return to the window Commbase:
Press CTRL + b, then press 1

# 5 Default Commbase commands

## Commbase Commmands unique for the Command Line

```shell
$ commbase start|stop|teleport
$ commbase {TYPOS}
```

## Commbase Management Commands

`"okay stop"`.

`"tell me about yourself"` / `"introduce yourself"`.

`"stop capturing sound"` / `"stop listening"`.

`"reload recognition"` / `"reload speech recognition"` / `"reload your speech recognition"` / `"reload your recognition"`.

`"disconnect yourself"`.

`"wake up"` / `"wake-up"`.

`{WRONG VOICE COMMANDS}`.

## Commbase Common Commands

`"update applications"`.

`"open the brave browser"`.

`"open my linux documentation"`.

`"show me my location"`.

`"open the network browser"`.

`"g i t status"`.

`"open a new terminal"`.

`"open a/the simple browser"`.

`(MODAL + SUBJECT +) "kill the simple browser"` / `(MODAL + SUBJECT +) "close the/tha/that simple browser"`.

`"reproduce a chapter of robinson crusoe"` / `"reproduce robinson crusoe"`.

`"open the terminal editor"`.

`"show me basic system information"`.

`"connect me to the development server"`.

`"let me know when the internet is back"` / `"tell me when the internet is back"`.

`"list the addresses in the local network"`.

`"verify the internet connection"`.

`"connect me to the private network"`.

`"disconnect me from the private network"`.

`"push to the local web server"`.

`"synchronize development from desktop"`.

`"set a timer of <NUMBER-IN-WORDS> minutes"`.

```shell 
$ commbase "set a timer of" "one minute"
$ commbase "set a timer of" "one" "minute"
```

`"open my current editor workspace"` / `"open my current code workspace"` /
`"open my current editor workspace that i am working on"`.

# 6 Create new voice commands basics

## Verbosity Levels

Commands beginning with "Show me" (Shows a result)

Commands beginning with "Tell me" (Tells us something, not too large)

Commands beginning with "Tell me more (about that)"  (A long explanation about something)

Commands can be made with alternatives to WH question, i.e: 
		IN "show me the time" (Shows a clock app on screen)
	 	IN "tell me the time"  (Just tells us the time using the voice)
		IN "what time is it"   (Shows a clock and tells the time using the voice)

## Proposed Command Conventions

### Modes

> tell me what mode are you

> enter/exit normal mode

> enter/exit step by step mode

> enter/exit conversation mode

> enter/exit dictation mode

> enter/exit follow mode
> follow me

> enter/exit vehicle mode
> enter/exit autonomous mode

### Step by Step Mode

For commands that must be verified before execution, due to their execution is risky

### Normal Mode

#### Cancel Commands Already Ordered

> cancel/wait

#### Verify/Modify Commbase Status

> do you copy
> wake up
> disconnect yourself/goodbye/turn you off

#### Activate/Deactivate Local Hardware or Things

> activate/deactivate <SOMETHING (I.e.: Webcam, microphone)>

> turn off/turn on <SOMETHING (I.e.: lights)>

> turn down/turn up <SOMETHING (I.e.: output volume, input volume/microphone volume)>

#### Open/Close Applications

> open/close program/application/action-script <PROGRAM/APP/ACTION-SCRIPT>
> kill program/application/action <PROGRAM/APP/ACTION>
> exit program/application/action <PROGRAM/APP/ACTION>

#### Star/Stop Services

> start/stop service <SERVICE>

#### Install Applications

> install/remove the application <PROGRAM/APP/ACTION-SCRIPT>

> search the application <PROGRAM/APP/ACTION-SCRIPT> 

> where is/find the application <PROGRAM/APP/ACTION-SCRIPT> 

#### System Clipboard

> select <WORD>
> copy to clipboard
> paste from clipboard

#### File Operations

> create a new file <NEWFILE>
> delete file <FILE>
> move the file <FILE> to <PATH-TO-DIRECTORY>
> move the file <FILE> to the current directory 
> rename the file <FILE-NAME> as <NEW-FILE-NAME> 

#### Search Web Pages

> browse/search <SOMETHING/SOMEWHERE (I.e.: my location)>
> browser/search/show me the map of <GOOGLE-MAP-PLACE>

> show me information about <WIKIPEDIA-TOPIC>
> tell me information about <WIKIPEDIA-TOPIC>

> search/browse the translation of i love my mom into spanish

> search/browse and play the album <ALBUM> by <ARTIST>

#### Translate

> translate i love my mom into spanish
> show me i love my mom in spanish
> tell me i love my mom into spanish

#### Calendar

> show me the time 
> what time is it
> tell me the time
> create a new meeting called <SUBJECT> on <MONTH> <DAY> <YEAR> from <TIME> to <TIME>

#### Entertainment

> play the album <ALBUM> by <ARTIST>
> play the album <ALBUM> by <ARTIST> on <PLAYER>

> play <ARTIST>
> play <LBUM>

> play music

> tell/say me a joke

> tell me a story/tails

#### System Status

> tell me the system version
> show me the system version

#### Security

> show me a system security report/version
> show me the firewall rules

#### Networking

> tell me my i p address/addresses
> show me a map of the/my local network
> sniff the local area network
> show me my i p address configuration

#### Remote Access

> open/close s s h connection with host <HOSTNAME/IP ADDRESS>
> show/tell me the host in my current domain

#### Development

> show me the git status
> git commit all
> open visual studio code
> open the development project <PROYECT-NAME>
> open the current development project

# 7 Hints on saying and creating voice commands

Different output in well said command repetitions:
Say a different phrase, or example "clear" before repeat a failed/non accurate phrase, so Vosk
forgets about giving alternative results for repetitions that would lead you to make impossible to
say what you want correctly even when you are saying it perfectly.

On the other hand, new Vosk alternatives can be helpful, so it could understand a voiced phrase the
second or third repetition, for example, practice saying "no way", then pause for the feedback, then
repeat that operation once again. If you are lucky, the second or third time repeating Vosk will
understand your phrase instead of just the word "way".

For Vosk, accuracy means fast pace and pronunciation (correct phonemic sounds) but not necessarily
intonation. Also, the Festival TTS (Text To Speech)'s intonation sounds like a robot with human
voice, not like a real human voice with intonation variances, etc.

Prefer to start command phrases using direct voice orders, for example, say: "play music", "go/go and
play music", or "let's play music". That will help Vosk understand better the command as an order
than if you change from simple present to past voice or add subjects without (uncertain) time space
to emulate commas like as in phrases like "James, play the piano".) Those phrases can make Commbase
get kind of confused and tend to display articles such as "the" and other words to complete a normal
phrase the most similar to two people talking to one another like in a movie. For that reason, Vosk
is used as a part of audio file transcription software in the Linux world.

# 8 Commands setup

Run the test script test_microphone.py, as described in the section "4. Testing the Vosk model" of
the file INSTALL, to test your new command accuracy until you feel comfortable with the command
string or "language pattern" to be used as a voice command. For example, repeat:
> open a text file
> assistant open a text file

> open web browser
> go and open a browser
> open the browser

You can guide yourself the creation of commands using the existent commands in
commbase-process-vosk.sh. For that you will have to be or get familiar with bash scripting.

Some commands will require the exact executable path of the application you want to run. Find that
path using the command whereis:
$ whereis sudo
OUTPUT:
sudo: /usr/bin/sudo
END OF OUTPUT.

Steps:

1. Declare the new voice command function in the section functions in the file
commbse-process-vosk.sh, for example:

```bash
# --------------------------------------------------B------------------------------------------------
# brave:
. $dir/functions/show-me-my-location.func
```

2. Add the new custom function into an elif in the combase commands section

```bash
# --------------------------------------------------B------------------------------------------------
# brave:
elif echo $trim_str | grep -q "open the brave browser"; then
  open-the-brave-browser.func
elif echo $trim_str | grep -q "show me my location"; then
  show-me-my-location.func
```

3. Create the function file in the Commbase/commbase/functions directory. You can use other functions
as your function template:
$ touch show-me-my-location.func
$ chown $USER show-me-my-location.func
$ chgrp $USER show-me-my-location.func
$ chmod 755 show-me-my-location.func

4. Code the function content using your favorite code editor.
$ nano show-me-my-location.func

5. In case of that the function runs bash scripts, add or create and add the scripts to the function
and then save the file changes.
Prefer using bash scripts over just functions to be able to execute the scripts using double click or
using the command bash directly with the script, and also to reuse it somewhere else (recycling it.)
Set up every new directory or script file permissions, for example:
$ chown $USER brave/
$ chgrp $USER brave/
$ chmod 755 brave/
$ chown $USER ./brave/locate-my-current-internet-ip.sh
$ chgrp $USER ./brave/locate-my-current-internet-ip.sh
$ chmod 755 ./brave/locate-my-current-internet-ip.bash
Make scripts executable:
chmod +x ./brave/locate-my-current-internet-ip.sh

6. Add the function to an 'elif' statement code block in the section Commbase commands in the file
commbase-process-vosk.sh

7. Debug and test the new voice command to make sure that is not negatively affecting or stucking the
well functioning of the Commbase application.

8. You can add any new custom voice command or specific commands under testing to the Commbase
'commbase' application executable put in to the directory /usr/bin/ during the Commbase installation
(Checkout the section "7. Add the Commbase executable command"). The decision to add commands to that
file is up to you. It would help test voice commands as parameter for the Commbase application
executable, but could lead you to avoid using your shell or bash scripting and affect and slow down
your speech recognition model learning process.

The next piece of code is a case inside /usr/bin/commbase

```bash
'stop')
  echo "Stopping application"
  tmux kill-session -t Commbase-0
  ;;

```

This command is going to help cleaning up the 'commbase' file before pasting a new versions that
includes the a new command:

```code
# cd /usr/bin
# echo "" > commbase
# nano commbase

```

In case of you are using a the terminal to edit the file with nano, use CTRL + SHIFT + v to paste
the copied content from the Commbase source code file, into the new version of the Commbase
executable file. If you are in a Desktop Environment, Window Manager, or application, use right
click and then select paste.

Once every new command has been tested or new Commbase files has been downloaded, remember to verify
the new directory and files permissions for security reasons.

The most common scenario is a command script that Commbase will run on the local user environment.
The next command usually does the job. It changes any file and directory permissions 'owner' and
'group' to your $USER so your user is able to read, write, and execute the directory or file, other
system users are able to read it and execute it, but your user is the only who can overwrite it:
$ chown $USER FILE-OR-DIRECTORY-NAME
$ chgrp $USER FILE-OR-DIRECTORY-NAME
$ chmod 755 FILE-OR-DIRECTORY-NAME
And if you want to list all the groups:
Switch to root user:

```shell
$ su -
# cat /etc/group | less
# exit

```

If you need, you should set up your commbase.conf file with your own constant values.

This file, in  the directory commbase/config/, was created during the Commbase installation,
as is described in the document INSTALL.

If you want or require to re-create it from scratch, checkout the section "Set up the file
commbase.conf" in the mentioned document.

Commbase uses this file to store the list of skill-scripts' logins, usernames with passwords,
and APIs credentials.

Some custom commands could run a local or remote command using another user rather than yours, or
even your system's root from a remote server machine. Those commands and other commands that you
could create containing passwords, passphrases, private keys and other secrets are better kept typed
in an external list and managed carefully as a part of the security policy for your systems.

Within this file you can even create constants for allowing Commbase to connect through networks,
using sign ins and technologies such as Secure SHell (SSH).

By the way, commbase.conf file is listed in the file commbase/.gitignore.

Note: If you want to generate new uuid for any purpose, for example, create one unique id for every
device in your Commbase device network, you can use uuid-runtime:
$ uuidgen

Occasionally, more commands will be merged in the official Commbase source repository. Don't forget
to backup your customized Commbase files before download a new version and upgrade your Commbase
or you will loose your customizations because none of them is in the official source repo.

To propose a new command for the Commbase repository, checkout the information on how to contribute
to the project in the document README.md.

## The $COMMBASE directory

Commbase uses an environment constant $COMMBASE set up for the user environment/session. Such as in many Linux distributions, this type of constants can be exported in $HOME/.bashrc, $HOME/.zshrc or any other custom shell rc configuration file.

Example of the custom lines added to a bashrc file:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

Example of use of the constant:

```bash
tmux send-keys "bash $COMMBASE/commbase/core/<PATH/TO/SCRIPT/FILE/script.sh> &"
```

The constant can be used in any custom script file inside the Commbase root directory and its subdirectories.

Example in a script header:

```bash
# The configuration constants file.
source $COMMBASE/commbase/config/commbase.conf
```
Example of use of the constant in the same bash script:

```bash
mpv $COMMBASE/commbase/bundled/audiobooks/Robinson-Crusoe/crusoe_anew_02_baldwin_64kb.mp3
```

## The Commbase processing file

The Commbase execution script file 'commbase' and also the speech recognition script file 
'commbase-speech-recognition-vosk.py' contain the variable COMMBASE_PROCESS_VOSK, which must be 
changed to point to any specified default or custom version of the file commbase-process-vosk.sh,
which processes voice commands and scripts that run tasks we use and are able to program for Commbase
to run them.

```bash

# The Commbase processing file for this device:
COMMBASE_PROCESS_VOSK="commbase-process-vosk-pc-default.sh"

```

```python

		COMMBASE_PROCESS_FILE = 'bash ' + os.environ["HOME"] + '/Developer/Commbase/commbase/base-vosk/commbase-process-vosk-pc-default.sh'
		#COMMBASE_PROCESS_FILE = 'bash ' + os.environ["HOME"] + '/Commbase/commbase/base-vosk/commbase-process-vosk-pc-default.sh'
		o = subprocess.run (COMMBASE_PROCESS_FILE, shell=True, capture_output=True)
		# Prints clean, as text:
		print(o.stdout.decode())

```

This file would change from host to host in a Commbase network, based on the device's nature and
configuration.

To set the permissions for new commbase-process-vosk.sh file versions:
$ chown $USER commbase-process-vosk-NEW-SUFFIX-NAME.sh
$ chgrp $USER commbase-process-vosk-NEW-SUFFIX-NAME.sh
$ chmod 755 commbase-process-vosk-NEW-SUFFIX-NAME.sh

Examples:
commbase-process-vosk-android-phone.sh
commbase-process-vosk-suv-vehicle.sh
commbase-process-vosk-spacecraft.sh
commbase-process-vosk-virtual-mentor.sh

# 9 Training Commbase by Assembling Skillsets

Commbase can be trained in a variety of manners. For example, you can train the AI Model, which would directly affect the existent commands precision, and would require to verify every command afterwards. Furthermore, you can train any preffered/specialized AI (added kind of as a plugin), to be used by Commbase in talkative mode. Also, we can train Commbase scripts that use sensors such as face recognition, voice recognition, etc., or move servos, and so on, and so forth, depending on the device where Commbase runs on.

By training Commbase with Skillsets, any Commbase Trainer assemblies consecutive instructions in single skillset files. Every Skillset file can be used as a single Commbase voice command by Commbase Users, so that they just have to order/tell Commbase to do/run a previously learned skillset once, instead of order every instruction one by one, which contributes to not only automate but also eliminate dangerous repetitive boring tasks.

Commbase Skillsets Trainers have two Workflow alternatives to create a skillset. The first workflow starts from a fresh/restarted Commbase session; the second workflow starts at any time by cleaning up the Commbase History. In brief:

Workflow 1 > commbase start (this action cleans up history) > state learning commands > save skillset + open skillset > (code skillset) > clean up history > learning commands > ... > code skillset

Workflow 2 > commbase commands > list history > clean up history > state learning commands > save skillset + open skillset > code skillset

Workflow 1. Assembling Skillsets from a fresh/restarted Commbase session. Steps:

- Start/Restart Commbase to enter the training mode:

Alternatives:

```shell
$ commbase start
```

```
$ commbase teleport
```

```
$ commbase stop
$ commbase start
```

`"disconnect yourself"`, `$ commbase sta wrt`

- State learning commands: 

Commonly, every command function writes logs to history before ending itself. The function can be done or updated to verify the command execution, but it is not recommended to create voice command for critical tasks that potentially could lead someone, include Commbase himself/herself, to safety concerns or total disasters.

For example:

```shell
# Lots of lines here
echo "connect me to the development server" >> .commbase_history

```

Note: A Safety Concern is defined as any condition, practice, or violation that causes a substantial probability of physical harm, property loss, and/or environmental impact such as: Loose railing on a stairwell. Tripping hazards. Anything you feel has the potential to cause harm to people, property, or the environment.

- Save Skillset:

Once you trained Commbase in a sequence of commands, use this command to save that as a skillset and open it in edit mode in nano (text editor):

"save this as a new skillset" / "save this as a learning"

- Code Skillset:

At this point you can reorganize/modify your new Skillset and then save the file with the new changes or just save it in case that you believe that the training went well.

The skillsets are saved in the directory Commbase/commbase/base-vosk/skillsets as custom_skillset_name + uuid.TMP, for example, bake_a_cake_7237dee4-6954-4989-8f88-115f76bd5500.TMP), but this is temporary extension that allows Commbase trainers to save skillsets temporarily for later editing.

- Clean up History:

This command can be used if your Skillset was wrong and you decide no to edit it in the previous step and just saved it. In this way you can start over and over again from the step "State learning commands" with an empty Commbase history.

It can also be used in case of you decide to interrupt that particular Commbase but you need or want the history clean by any reason.

"clean up your history"

"clean up your history records"

- Setting up the new Skillset:

Once you are ready for creating the skillset using that temporary skillset file:
Go to the skillsets directory.
Change the skillset extension from .TMP to .skst.
List the file in the file commbase-process-vosk-pc-default.sh, in the section Skillsets and add it as a new voice command in the section Commbase Commands, after the section COMMBASE-INTERNALS, and immediately before the final ELSE.
Test your new Skillset before put it in production.

Section: Functions

```shell
.$/dir/functions/my_custom_voice_command_func

```

Section: Skillsets

```shell
.$/dir/skillsets/my_custom_voice_command.skst

```

Section: Commbase Commands

```shell

# --------------------------------------------------Z------------------------------------------------
#
# ----------------------------------------------SKILLSETS--------------------------------------------
# bake a cake:
#elif echo ...
# ------------------------------------------------ELSE-----------------------------------------------
else
  total_no=4

```

Workflow 2. Assembling Skillsets by starting by cleaning up the Commbase history. Steps:

- List your Commbase history:

This command displays the history on screen, so you can check that there is no important information that deserves to be safe.

"list your command history"

"list your learning history"

"list you're learning history"

- Clean up history:

Clean up the Commbase history before proceed with the Commbase training in a cleansed status.

(Commands described and listed above.)

- State learning commands:

(Commands described and listed above.)

- Save Skillset:

(Commands described and listed above.)

- Code Skillset:

(Commands described and listed above.)

- Clean up History:

(Commands described and listed above.)

- Setting up the new Skillset:

(Commands described and listed above.)

Skillsets voice commands examples:

"synchronize all my custom directories in home"
> Skillset: Synchronizes particular directories in the current user's home: ~/Downloads ~/Documents, Developer, and ~/config, for example.

"open my studio universe" "open my development studio"
> Skillset: Opens VS Code, Opens Chrome Browser, Opens Zoom, Connects to the Live Server, Sets a timer of 20 minutes.

"Open my/the audio studio"
> Skillset: Connects Jack, Opens KXStudio.

"Help me identify my local web server"

"Help me identify our neighbors (by network address)"
> Skillset: Opens Etherape, runs nmap, pings neighbors, tests Secure Shell connections to neighbors.

"Help me identify who is attacking our network connection" / "Detect and trace the address of the intruder/attacker computer" (for example, someone who sends a  DDoS attack.)

# 10 Keyboard Shortcuts

## Keyboard Shortcuts Cheat Sheet

### Commbase Key Bindings

`CTRL` + `SHIFT` + `Z` : Toggle active capture device.
<br />`ALT` + `SHIFT` + `1` : Toggle ON/OFF sound capturing.
<br />`ALT` + `SHIFT` + `2` : Stop sound capturing.
<br />`ALT` + `SHIFT` + `3` : Start sound capturing.

These group of shortcuts are defined in the Commbase directory key-bindings/

### Desktop Environment and Operating System

`SHIFT` + `TAB` : Set focus.
<br />`ALT` + `TAB` : Select any application and bring it to foreground.
<br />`ALT` + `SHIFT` + `TAB` : Select any application and bring it to foreground.
<br />`INSERT` Take a full screen screenshot.
<br />`CTRL` + `ALT` + `F1-F12` : Switch among console terminals.
<br />`CTRL` + `ALT` + `ARROWS` : Move through desktop workspaces.
<br />`SUPER` + `Z` : Desktop search.
<br />`CTRL` + `ALT` + `DEL` : Reboot computer.
<br />`ALT` + `SYSRQ` + `R` : un**R**aw (take control of keyboard back from X11)
<br />`ALT` + `SYSRQ` + `E` : t**E**rminate (send SIGTERM to all processes, allowing them to terminate gracefully)
<br />`ALT` + `SYSRQ` + `I` : k**I**ll (send SIGILL to all processes, forcing them to terminate immediately)
<br />`ALT` + `SYSRQ` : `S` : **S**ync (flush data to disk)
<br />`ALT` + `SYSRQ` + `U` : **U**nmount (remount all filesystems read-only)
<br />`ALT` + `SYSRQ` + `B` : re**B**oot.

### Gnome Terminal

`CTRL` + `-` : Resize terminal.
<br />`CTRL` + `+` : Resize terminal.
<br />`CTRL` + `SHIFT` + `X` + `X` : Selects a portion of the terminal text typed in.
<br />`CTRL` + `SHIFT` + `C` : Copy highlighted text from terminal.
<br />`CTRL` + `SHIFT` + `V` : Paste clipboard text into terminal.

### Neovim / Emacs

When using Neovim or Emacs, make sure that the custom keyboard shorcuts do not interfere one another in the complete list.

### OBS

`ALT` + `SHIFT` + `4` : Start recording.
<br />`ALT` + `SHIFT` + `5` : Stop recording.
<br />`ALT` + `SHIFT` + `6` : Start streaming.
<br />`ALT` + `SHIFT` + `7` : Stop streaming.

### SimpleScreenRecorder

`SUPER` + `S` : Start recording.

### Text Editors and IDEs

CTRL	X	Cut.
<br />`CTRL` + `C` : Copy.
<br />`CTRL` + `V` : Paste.
<br />`CTRL` + `F` : Find.
<br />`CTRL` + `N` : Create new file.

### Tmux

`Prefix` + `B` , `1-9` : Switch window by its number id.
<br />`Prefix` + `B` , `Q` : Display pane numbers.
<br />`Prefix` + `B` , `SHIFT` : Split pane vertically.
<br />`Prefix` + `B` , `ARROWS` : Resize active pane.
<br />`Prefix` + `B` , `ARROWS` : Switch pane.

Prefix = CTRL

### VS Code

`CTRL` + `SHIFT` + `P` : View Command Palette.
<br />`CTRL` + `P` : Find file or expression.
<br />`CTRL` + `B` : Open/Close side panel. Bold a word if editing a markdown file while using a markdown extension for VS Code.
<br />`CTRL` + `BACKTICK SYMBOL` : Open VS Code Terminal.

When using VS Code, make sure that the custom keyboard shorcuts do not interfere one another in the complete list.

### Web Browser

Click on a browser's tab and then use the roller to move through the tabs.

## Input Remapper

It's an easy to use tool to change the mapping of your input device buttons. It's kind of a Linux alternative to the popular Karabiner for MacOS.
<br />Supports mice, keyboards, gamepads, X11, Wayland, combined buttons and programmable macros.
<br />Allows mapping non-keyboard events (click, joystick, wheel) to keys of keyboard devices.
<br />Web: <https://github.com/sezanzeb/input-remapper>

This application can help other Apps such as the AI Assitant "Commbase" execute voice commands based on Commbase scripts that run custom keyboard shortcuts created with Input Remapper instead of Cinnamon which can make Commbase independant of Gnome/Cinnamon, but still dependent of the powerful Gnome terminal.

Consider Input Remmaper to create new custom Commbase commands or, for example, replace our chosen Development editor with another editor or IDE enhanced with Commbase with this type of mappings. Include and document a back and restore procedure of your custom mapping files.

# 11 Commbase for Software Development

## Get Commbase up and running for development

Steps (on a daily basis):

Start the computer that will used for development (for example, shark.)

Login your session (shark.)

Test the default sound OUTPUT and INPUT (microphone.)

Optionally, route Commbase INPUT (mic) using JACK. For more information on how to setup JACK you can visit the following documentation: <https://drive.google.com/drive/u/1/folders/1JW07u-g3dIFHHMqCz7XKg6lgyLrvCHdx>

Test the web camera.

Test the internet connection, also using a browser.

Skim the email inbox.

Check the calendar.

Open a terminal with GPU rendering:

```shell
$ wezterm
```

Or without GPU rendering:

```shell
$ gnome terminal
```

Identify the computer (shark) and local server (shark2) IP a address:

```shell
$ ping  ip-address
```

Compare the addresses and update them in the file: **commbase/config/commbase.conf** if required:

```shell
$ nvim commbase.conf
$ nano commbase.conf
```

But, do not access any server yet, to be able to keep the server connections in Commbase Windows that we will create later on.

Activate Bash for Python3.7 for Commbase. With Anaconda's (python) the commands could be:
For a particular envinronment:

```shell
$ conda activate my-env_env
```

For exiting to (base):

```shell
$ bash
```

Restore previous Tmux sessions, which includes Commbase sessions:

```shell
$ tmux list-sessions
$ tmux attach-session -t Commbase-0
```

Or, start a new Commbase session:

```shell
$ commbase start
```

Test the Commbase session for feedback:
Open the microphone and say anything or a voice command at him/her.

Open the Commbase window 2 "Extension". That would be your programming tmux window.
Go to the next window:
Press `CTRL` + `b`, `n`.
Or use:
Go to a window by number:
Press `CTRL` + `b`, `#` (i.e.: 0, 1, 2, 3, etc.)

Create and open a new Commbase window in the current session:

```shell
$ tmux new-window -t Commbase-0:2 -n "Timer" && sleep $time
$ tmux select-window -t 3
```

Now, it is a perfect time to create a new window for a server connection, and then enter the server from there.

```shell
$ tmux new-window -t Commbase-0:2 -n "Server x1" && sleep $time
$ tmux select-window -t 4
```

To Test the local server (shark2):
<br />Login in a second terminal tab:

```shell
$ ssh user@local-server-ip
$ ssh -X user@local-server-ip
```

Go to the window "Timer" and then run the timer script using the shell command:

```shell
$ bash ~/Developer/Commbase/timers/custom-countdown/desktop-shark-countdown.sh -m 20

```

The last command is an alternative to the voice command "set a timer of twenty minutes", thought for developers to take terminal control of their timer. In that way, you can stop using Commbase if you need to, for example, use the microphone in meetings, but still keep using the timer in teh same Commbase session without requiring to get out of the programing terminal with or without the any mouse.

Go back to the Commbase session window 2 "Extension":
Press `CTRL` + `b`, `p`.
Or use:
Go to a window by number:
Press `CTRL` + `b`, `#` (i.e.: 0, 1, 2, 3, etc.)

Now, you are able to open the code editor right there:

```shell
$ nvim
$ nvim path/to/file
$ nvim new_file
```

Don't forget tmux session (Commbase-0) key shortcuts to move forwards and backwards through the session windows, and to select window by its number, all using key shorcuts, only:
`CTRL` + `b`, `n`.
`CTRL` + `b`, `p`.
`CTRL` + `b`, `#`.

If you complete all these steps, you will keep Commbase running in the foreground in a Tmux window. That speeds up the application recognition's feedback besides other factors such as network statuses (for networked instances) and processor features related to AI at execution time, let's say, the model's accuracy, precision and recall (aka sensitivity). 

In the meantime, order Commbase to run Neovim keyboard shortcuts, Neovim commands, nvim terminal commands with options, and Commbase commands related to development.

Also, in future Commbase releases, there will be a Neovim plugin for Commbase to allow him/her to collaborate together with Code Copilots such as GitHub's Copilot in INSERT (dictation) mode. If you are interested in becoming a Commbase contributor, you can send an email or pull request your tested new featured branch to the project.

## Create a Virtual Machine for Software Development

In general, VMs (Virtual Machines) and Containers can be useful for preserving workign copies of complex installations such as the Commbase one.

A computer dedicated for Development can be virtualized in KVM or VirtualBox. Both are recommeded for faster devel envinronment rescueing based on backup restoration compared to re-installation, and hardware portability.
<br />VirtualBox is recommended to be able to use GPU rendering and acceleration, and Platform compatibility (Windows and MacOS). It seems the best option to choose from, currently, just for portability!
<br/ >KVM is recommended to create a non graphical Virtual Machine and native kernel virtualization for velocity and less usage of the system resources.

A good installation would be a Minimal GNU/Debian Linux with Cinnamon for Gnome Terminal, and use Awesome as the Window Manager in order for the system to save resources. A minimun graphical environment is a requirement for Commbase. Ligatures and Tranaparency cannot be used from Gnome Terminal + Commbase, but they are not required and would be a step onto a next level. However, gpu is required for the Copilots plugins to work. A solution to more or less ceed the GPU power to the VM would be use a light Window Manager rather than Desktop Environments.

## Commbase Commands for Development with Neovim
