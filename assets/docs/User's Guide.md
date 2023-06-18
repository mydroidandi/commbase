# Commbase <img align="center" alt="Visual Studio Code" width="10%" src="./images/commbase.png" /> User's Guide

<p>
<img align="center" alt="Visual Studio Code" width="100%" src="./images/commbase.png" />
</p>

# Content

- [1 Introduction](#1-introduction)
- [2 Start, Stop, and Teleport Commbase Application](#2-start-stop-and-teleport-commbase-application)
	- [commbase start](#commbase-start)
	- [commbase stop](#commbase-stop)
	- [commbase teleport](#commbase-teleport)
- [3 The User Interface](#3-the-user-interface)

- [4 Useful Tmux Actions](#4-useful-tmux-actions)
	- [The window Extension](#the-window-extension)
- [5 Default Configuration Variables](#5-default-configuration-variables)
- [6 Default Commbase commands](#6-default-commbase-commands)
	- [Commbase Commmands unique for the Command Line](#commbase-commmands-unique-for-the-command-line)
	- [Commbase Management Commands](#commbase-management-commands)
	- [Commbase Common Commands](#commbase-common-commands)
- [7 Create new voice commands basics](#7-create-new-voice-commands-basics)
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
- [8 Hints on saying and creating voice commands](#8-hints-on-saying-and-creating-voice-commands)
- [9 Commands setup](#9-commands-setup)
	- [The Commbase root directory](#the-commbase-root-directory)
	- [The Commbase processing file](#the-commbase-processing-file)
- [10 Training Commbase by Assembling Skillsets](#10-training-commbase-by-assembling-skillsets)
- [11 Keyboard Shortcuts](#11-keyboard-shortcuts)
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
- [12 Commbase for Software Development](#12-commbase-for-software-development)
	- [Get Commbase up and running for development](#get-commbase-up-and-running-for-development)
	- [Create a Virtual Machine for Software Development](#create-a-virtual-machine-for-software-development)
	- [Commbase Commands for Development with Neovim](#commbase-commands-for-development-with-neovim)

# 1 Introduction

Commbase is a programmable conversational AI assistant and "distributed AI" or "multi-agent system" (MAS) implemented as a set of separate processes or applications running on a single computer, droid, or smart appliance, originally developed by the Computer Scientist Esteban Herrera, in 2022. It works on general-purpose operating systems without requiring an internet connection. He/She can be improved by AI (Machine Learning and Data Science) and programming languages as described in your User's Guide.

# 2 Start, Stop, and Teleport Commbase Application

These commands assume that the `commbase` command has been properly set up. If you haven't set it up yet, you can find instructions on how to do so in the **INSTALL** file.

## commbase start

To start a Commbase session from the command line, run the following command:

```sh
commbase start
```

## commbase stop

To stop or close the running Commbase session, you have a few options:

The most effective way is to use a specific voice command to instruct Commbase to disconnect itself. Simply say `"disconnect yourself"` to initiate the process of stopping the Commbase session gracefully.

Alternatively, you can stop Commbase by running the following command in the command line:

```sh
commbase stop
```

Another method involves manually terminating the Commbase session using the tmux command. First, you can list all active sessions by running:

```sh
tmux list-sessions
```

Identify the session named "Commbase-0" and remember its session ID. Then, issue the following command to kill that specific session:

```sh
tmux kill-session -t Commbase-0
```

## commbase teleport

The "teleport" command in Commbase provides a convenient way to handle different scenarios.

```sh
commbase teleport
```

When used outside a terminal or a terminal tab running Commbase, executing `commbase teleport` will respawn Commbase in the new terminal or terminal tab. This includes retaining all the existing Commbase window output characters. It allows you to seamlessly switch to a different terminal environment while preserving the ongoing Commbase session.

If you completely close the Commbase terminal, Commbase remains active and capable of interacting with you via voice. However, it loses the ability to run graphical applications. In this situation, by teleporting it, Commbase reappears without requiring you to stop and start it again. It conveniently restores the Commbase session and enables you to continue your work.

Additionally, "teleport" can be used as a third alternative to start Commbase. This suggests that it provides an alternative method to initiate a Commbase session, distinct from the other methods available.

By utilizing the "teleport" command, you can conveniently manage and transition your Commbase session to suit your specific needs.

# 3 The User Interface

Commbase is composed of 4 windows.

The window 1, "Commbase", contains 4 panes:

Pane 1. It is the chat pane.

Pane 2. It is the VU-meter pane.

Pane 3. It is the audio mixer pane.

Pane 4. It is the Commbase terminal or simply a user terminal that can be focused, used, and cleaned from the application.

The window 2, Editor", contains a single pane.

The window 3, "Timer", contains a single pane.

The window 4, "Server 1", contains a single pane.

The extra windows from 2 to 4 can be disabled or enabled as a group or separately, by changing their settings in the configuration file **config/app.conf**. 

To show or hide these windows, you can change the values assigned to the next default configuration variables:

TMUX_EXTRA_WINDOWS_ON, TMUX_EXTRA_WINDOW_EDITOR_ON, TMUX_EXTRA_WINDOW_TIMER_ON, TMUX_EXTRA_WINDOW_SERVER1_ON, and TMUX_EXTRA_WINDOW_SERVER2_ON.

You will find information about the variables in the section **5 Default Configuration Variables**.

# 4 Useful Tmux Actions

**Oh My Tmux** is a configuration framework for the **Tmux** terminal multiplexer. Tmux is a command-line tool that enables multiple virtual terminals within a single terminal window or session. It provides features like window splitting, session management, and detached sessions.

Oh My Tmux builds on top of Tmux and provides a set of enhancements and customizations to improve the Tmux experience. It offers a collection of preconfigured settings, keybindings, and themes that can be easily applied to Tmux, allowing users to customize and personalize their Tmux environment.

By incorporating Oh My Tmux, Commbase can provide its users with a powerful and customizable terminal environment that enhances productivity, simplifies configuration, and benefits from the active support of the Oh My Tmux community.

Overall, by utilizing Oh My Tmux commands and keybindings, Commbase enhances the usability and efficiency of its terminal interface, providing users with a more seamless and intuitive experience while interacting with the application.

Here is a list of Oh My Tmux actions useful when in Commbase.

## Moving among Commbase windows.

Go to the window 2, "Editor":

Press `Ctrl` + `b`, then press `2`.

Go to the window 3, "Timer":

Press `Ctrl` + `b`, then press `3`.

Go to the window 4, "Server 1":

Press `Ctrl` + `b`, then press `4`.

Return to the window 1, "Commbase":

Press `Ctrl` + `b`, then press `1`.

## List all the active sessions.

```sh
tmux list-sessions
```

## Kill the Commbase session.

```sh
tmux kill-session -t Commbase-0
```

## Display the Commbase session pane numbers.

In the tmux session, press `Ctrl` + `b`, release and then press `q`.

## Close duplicated tmux sessions.

In the unlikely event that the Commbase session fails to terminate properly before restarting, it may result in duplicated sessions. To resolve this issue, follow these steps:

Close the current terminal or switch to an alternative Commbase window, for example, "Editor".

Next, list all tmux sessions.

```sh
tmux list-sessions
```

Finally, close the duplicated session(s).

```sh
tmux kill-session -t Commbase-2

tmux kill-session -t Commbase-1

tmux kill-session -t Commbase-0

```

Alternatively, you can terminate all tmux sessions at once.

```sh
pkill tmux
```

Restart Commbase normally.

# 5 Default Configuration Variables

The configuration variables can be accessed by going to the directory **config/** and opening the files **secrets** and **app.conf**.

Use your favorite text editor to open any of those files.

```sh
nano config/app.conf
```

```sh
nano config/secrets
```

The file *secrets* holds all the identities, passwords, usernames, IP addresses, and other private information to be used to log in to external services and identify and connect to other computers from your Commbase-based app. 

The file *app.conf* holds all the other app configuration options, including your custom Commbase commands new variables.

These files are environment files that you can edit following certain rules:
- Every environment variable is a constant.
- Constants must be declared in uppercase.
- Constant names must be alphanumeric characters.
- The constant name is not allowed to have characters such as ";".
- Constants spaces are represented by underscores "_".
- The constants are strictly grouped and ordered as possible.
- All the values assigned to constants are strings and must be double-quoted.
- You can add more constants with values, but their names can not be duplicated in the file or match Commbase or system environment constants, such as `$COMMBASE_APP_DIR` or `$HOME`.
- There should not be empty lines or spaces in the file.

The default version of the file **secrets** which is sourced by the application, does not have default values, and they must be set by the user in order for the app and/or app commands to function correctly. Make sure to replace the placeholder values with the actual required values.

Most of these variables are marked as optional and can be excluded if they are not needed for your specific use case.

- **LOCAL_HOST_UUID** (Optional):
  - Example value:
    - `01234567-89ab-cdef-0123-456789abcdef`: The local host UUID. Use this to identify the local host of the Commbase application before your Commbase machines' network.

- **REMOTE_USER_NAME** (Optional):
  - Example value:
    - `my_username`: The username for remote user authentication. It can be your same local username.

- **REMOTE_USER_PASSWORD** (Optional):
  - Example value:
    - `my_password`: The password for remote user authentication. It can be used inside Commbase commands and/or applications that require bypassing password prompts without user intervention. This method does not encrypt the password but keeps its passphrase centralized outside command or application scripts.

- **PROTONVPN_CLI_USERNAME** (Optional):
  - Example value:
    - `protonvpn_username`: The username for ProtonVPN command-line interface (CLI) authentication. The VPN variables are specifically for use with the ProtonVPN service. You can create new variables for equivalent services of your choice.

- **PROTONVPN_CLI_PASSWORD** (Optional):
  - Example value:
    - `protonvpn_password`: The password for ProtonVPN CLI authentication. The VPN variables are specifically for use with the ProtonVPN service. You can create new variables for equivalent services of your choice.

- **PROTONVPN_API_USERNAME** (Optional):
  - Example value:
    - `protonvpn_api_username`: The username for ProtonVPN API authentication. The VPN variables are specifically for use with the ProtonVPN service. You can create new variables for equivalent services of your choice.

- **PROTONVPN_API_PASSWORD** (Optional):
  - Example value:
    - `protonvpn_api_password`: The password for ProtonVPN API authentication. The VPN variables are specifically for use with the ProtonVPN service. You can create new variables for equivalent services of your choice.

- **SERVER_HOST_001_UUID** (Optional):
  - Example value:
    - `98765432-dcba-fedc-ba98-76543210abcdef`: The UUID of the server host number 001 in a Commbase machines' network. We use numbers to match the tmux Commbase session window 4 "Server 1" but they are not necessarily the same servers.

- **SERVER_HOST_001_HOSTNAME** (Optional):
  - Example value:
    - `foobar`: The hostname of the server host number 001. We use numbers to match the tmux Commbase session window 4 "Server 1" but they are not necessarily the same servers.

- **SERVER_HOST_001_IP_ADDRESS** (Optional):
  - Example value:
    - `192.168.100.2`: The IP address of the server host 001. We use numbers to match the tmux Commbase session window 4 "Server 1" but they are not necessarily the same servers.

- **SERVER_HOST_001_USER_PASSW** (Optional):
  - Example value:
    - `server_host_001_password`: The password for accessing the server host number 001. We use numbers to match the tmux Commbase session window 4 "Server 1" but they are not necessarily the same servers.

- **OPENAI_API_KEY**:
  - Example value:
    - `your_openai_api_key`:  The API key for accessing OpenAI services. It's important to keep your API key secure and not share it with unauthorized individuals, as it provides access to your OpenAI account and the associated usage of the API services.

Please ensure that these environment variables are correctly set with the appropriate values before running the application.

The default version of the file **app.conf** contains the next values:

- **PYTHON_ENV_VERSION**:
  - Example values:
    - `python` (Default): Choosing this value implies that the virtual environment will use the Python version associated with the default system Python interpreter. Choose this value whether your application uses a virtual environment such as commbase_env. For more details, check out the file **INSTALL**.
    - `python3.11`: This value indicates a custom Python version, specifically version 3.11. For more details, check out the file **INSTALL**.
    - `python3`: This value also represents a custom Python version, but the exact version is not specified. For more details, check out the file **INSTALL**.

- **STT_PROCESS_CPU_LIMIT_PERCENTAGE**:
  - Description: The percentage value represents the proportion of CPU resources that the STT process can consume relative to the total available CPU capacity. For more details, check out the file **INSTALL**.
  - Possible values: This variable should be a value between 0 and 100 or between 0 and 400 (for machines with 4 processing cores or more.)
  - Example value:
    - `75` (Default): The STT process is going to use up to 75% of the computer's processing power.

- **CONDA_ENV_NAME_IF_EXISTS**:
  - Example values:
    - `commbase_env` (Default): The default Commbase environment name that is logged in the file commmbase_env.yaml to build the Anaconda Python environment. For more details, check out the file **INSTALL**.
    - `my_env_name`: An alternative name for creating the Commbase virtual environment.

- **IP_ADDRESS_UPDATE_IN_SECS**:
  - Description: This value represents the interval in milliseconds at which the machine's IP address should be updated in the file **.env** in **env/**.
  - Possible values: We recommend using a value between 300 and 600 for security reasons.
  - Example value:
    - `600` (Default): This value will make the ip address update every 10 minutes.

- **MY_APP_AUDIO_CAPTURE_DEVICE_NAME**:
  - Description: This value corresponds to a specific audio capture device using the Advanced Linux Sound Architecture (ALSA) framework for audio input.
  - Possible values: Different devices may have distinct names or identifiers, and by setting the appropriate device name, the application can direct the audio capture process to the desired device. For more details, check out the topic **key bindings**.
  - Example value:
    - `alsa_input.usb-_Webcam_C170-02.mono-fallback`: This value represents an ALSA input device connected via USB, specifically a webcam named "C170-02," configured to provide mono audio input, using a fallback configuration.

- **SYSTEM_AUDIO_CAPTURE_DEVICE_NAME**:
  - Description: This value corresponds to a specific audio capture device using the Advanced Linux Sound Architecture (ALSA) framework for audio input.   - Possible values: Different devices may have distinct names or identifiers, and by setting the appropriate device name, the application can direct the audio capture process to the desired device. For more details, check out the topic **key bindings**.
  - Example value:
    - `alsa_input.pci-0000_00_1b.0.analog-stereo`: This value represents an ALSA input device connected via a PCI bus, specifically an analog stereo audio input device.

- **VIDEO_CAPTURE_DEVICE_01_INDEX**:
  - Description: It is used to specify which video capture device should be utilized by the system or application.
  - Possible values: Use a value between 0 and the maximum number of cameras installed.
  - Example value:
    - `0`: It represents the index or identifier of a video capture device.

- **VIDEO_CAPTURE_DEVICE_02_INDEX**:
  - Description: It is used to specify which video capture device should be utilized by the system or application.
  - Possible values: Use a value between 0 and the maximum number of cameras installed.  
  - Example value:
    - `1`: It represents the index or identifier of a video capture device.

- **STT_ENGINE_STRING**:
  - Description: It represents a string that specifies the path to the current STT engine's executable or script file bundled with Commbase.
  - Possible values:
    - `$PYTHON_ENV_VERSION $COMMBASE_APP_DIR/bundles/built-in/broker/commbase-stt-whisper-p/commbase_stt_whisper_p.py` (Default): It specifies the STT engine commbase-stt-whisper-p.py's executable script.
    - `$PYTHON_ENV_VERSION $COMMBASE_APP_DIR/bundles/built-in/broker/commbase-stt-vosk-p/commbase_stt_vosk_p.py`: It specifies the STT engine commbase-stt-vosk-p.py's executable script.

- **TTS_ENGINE_STRING**:
  - Description: It represents a string that specifies the configuration or command to invoke the TTS engine. You can set up a third-party engine here, including proprietary engines with proprietary voices or voices from other operating systems, TTS systems with the ability to use a clone/fake of your own voice, or API-connection-based TTS services tied to paid subscriptions. Every TTS has its features, advantages, and disadvantages, so its selection is your decision.
  - Possible values:
    - `$PYTHON_ENV_VERSION $COMMBASE_APP_DIR/bundles/built-in/broker/commbase-tts-pyttsx3/commbase_tts_pyttsx3.py --rate 150 --voice-index 18` (Default): It specifies the TTS engine commbase-tts-pyttsx3.py's executable script and arguments. It uses a specified speed rate and voice index to convert the text into speech and play it back. There is one voice index for every language or accent installed by or recognized by pyttsx3 in the system. You can modify those arguments in the string. To select a voice/accent by index, use the utility **list_all_voices_available_for_pyttsx3.py** that you will find out in the directory **scripts/utilities**.
    - `festival --tts`: It specifies the TTS command Festival and its arguments. Festival comes with a unique and some basic English voice tone out of the box. You can install Festival-compatible extra voices from different internet sources. To know how to install Festival-compatible voices and set one as your custom application's voice, read [`this guide.`](./Festival.md)
    - `espeak -v f2`: It specifies the TTS command Espeak and its arguments. The given argument means to speak using the default English female voice number 2. You can install Espeak-compatible extra voices from different internet sources.
    - `espeak -v m3`: It specifies the TTS command Espeak and its arguments. The given argument means to speak using the default English male voice number 3. You can install Espeak-compatible extra voices from different internet sources.
    - `$PYTHON_ENV_VERSION $COMMBASE_APP_DIR/bundles/built-in/broker/commbase-tts-gTTS/commbase_tts_gTTS.py --param1 val1 --param2 val2 --param3 val3:`: It specifies the TTS executable commbase-tts-gTTS.py's script and its arguments. gTTS (Google Text-to-Speech)is a Python library and CLI tool to interface with Google Translate text-to-speech API.

- **TMUX_EXTRA_WINDOWS_ON**:
  - Possible values:
    - `True` (Default): Set to True, it activates the extra windows feature in the Commbase tmux session.
    - `False`: Set to False, it deactivates the extra windows feature in the Commbase tmux session.

- **TMUX_EXTRA_WINDOW_EDITOR_ON**:
  - Possible values:
    - `True` (Default): Set to True, it activates the extra window Editor in the Commbase tmux session.
    - `False`: Set to False, it deactivates the extra window Editor in the Commbase tmux session.

- **TMUX_EXTRA_WINDOW_TIMER_ON**:
  - Possible values:
    - `True` (Default): Set to True, it activates the extra window Timer in the Commbase tmux session.
    - `False`: Set to False, it deactivates the extra window Timer in the Commbase tmux session.

- **TMUX_EXTRA_WINDOW_SERVER1_ON**:
  - Possible values:
    - `True` (Default): Set to True, it activates the extra window Server 1 in the Commbase tmux session.
    - `False`: Set to False, it deactivates the extra window Server 1 in the Commbase tmux session.

- **TMUX_EXTRA_WINDOW_SERVER2_ON**:
  - Possible values:
    - `False` (Default): Set to False, it deactivates the extra window Server 2 in the Commbase tmux session.
    - `True`: Set to True, it activates the extra window Server 2 in the Commbase tmux session.

- **TERMINAL_RED_BACKGROUND_COLOR_CODE_START**:
  - Possible values:
    - `1;41m`: This value enables bold or bright text in terminal emulators and set the background color to red.

- **TERMINAL_GREEN_BACKGROUND_COLOR_CODE_START**:
  - Possible values:
    - `1;42m`: This value enables bold or bright text in terminal emulators and set the background color to green.

- **TERMINAL_YELLOW_BACKGROUND_COLOR_CODE_START**:
  - Possible values:
    - `1;43m`: This value enables bold or bright text in terminal emulators and set the background color to yellow.

- **TERMINAL_BLUE_BACKGROUND_COLOR_CODE_START**:
  - Possible values:
    - `1;44m"`: This value enables bold or bright text in terminal emulators and set the background color to blue.

- **TERMINAL_MAGENTA_BACKGROUND_COLOR_CODE_START**:
  - Possible values:
    - `1;45m`: This value enables bold or bright text in terminal emulators and set the background color to magenta.

- **TERMINAL_CYAN_BACKGROUND_COLOR_CODE_START**:
  - Possible values:
    - `1;46m`: This value enables bold or bright text in terminal emulators and set the background color to cyan.

- **TERMINAL_WHITE_BACKGROUND_COLOR_CODE_START**:
  - Possible values:
    - `1;47m`: This value enables bold or bright text in terminal emulators and set the background color to white.

- **TERMINAL_BLACK_BACKGROUND_COLOR_CODE_START**:
  - Possible values:
    - `1;40m`: This value enables bold or bright text in terminal emulators and set the background color to black.

- **TERMINAL_RED_TEXT_COLOR_CODE_START**:
  - Possible values:
    - `1;31m`: This value enables bold or bright text in terminal emulators and set the text color to red.

- **TERMINAL_GREEN_TEXT_COLOR_CODE_START**:
  - Possible values:
    - `1;32m`: This value enables bold or bright text in terminal emulators and set the text color to green.

- **TERMINAL_YELLOW_TEXT_COLOR_CODE_START**:
  - Possible values:
    - `1;33m`: This value enables bold or bright text in terminal emulators and set the text color to yellow.

- **TERMINAL_BLUE_TEXT_COLOR_CODE_START**:
  - Possible values:
    - `1;34m`: This value enables bold or bright text in terminal emulators and set the text color to blue.

- **TERMINAL_MAGENTA_TEXT_COLOR_CODE_START**:
  - Possible values:
    - `1;35m`: This value enables bold or bright text in terminal emulators and set the text color to magenta.

- **TERMINAL_CYAN_TEXT_COLOR_CODE_START**:
  - Possible values:
    - `1;36m`: This value enables bold or bright text in terminal emulators and set the text color to cyan.

- **TERMINAL_WHITE_TEXT_COLOR_CODE_START**:
  - Possible values:
    - `1;37m`: This value enables bold or bright text in terminal emulators and set the text color to white.

- **TERMINAL_BLACK_TEXT_COLOR_CODE_START**:
  - Possible values:
    - `1;30m`: This value enables bold or bright text in terminal emulators and set the text color to black.

- **TERMINAL_COLOR_CODE_END**:
  - Description: The Commbase terminal colors are set once in the configuration file, so they can be called easily in any Commbase-based application custom code.
  - Possible values:
    - `1;0m`: This value enables bold or bright text in terminal emulators and instructs the terminal to revert to the default style, removing any specific formatting changes that were applied.

- **END_USER_BACKGROUND_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `blue` (Default): Turns blue the End User background color in the chat pane, based on the colors defined in other terminal variables. 

- **ASSISTANT_BACKGROUND_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `green` (Default): Turns green the Assistant background color in the chat pane, based on the colors defined in other terminal variables.

- **SYSTEM_BACKGROUND_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `white` (Default): Turns white the System background color in the chat pane, based on the colors defined in other terminal variables. 

- **END_USER_TEXT_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `white` (Default): Turns white the End User text color in the chat pane, based on the colors defined in other terminal variables.

- **ASSISTANT_TEXT_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `white` (Default): Turns white the Assistant text color in the chat pane, based on the colors defined in other terminal variables.

- **SYSTEM_TEXT_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `red` (Default): Turns red the System text color in the chat pane, based on the colors defined in other terminal variables.

- **ASSISTANT_AVATAR_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `cyan` (Default): Turns cyan the Assistant avatar color in the chat pane, based on the colors defined in other terminal variables. 

- **END_USER_NAME_IN_CHAT_PANE**:
  - Description: It determines how the name of the End User is displayed in the chat pane.
  - Example value:
    - `END USER` (Default): When set to END USER, the name is shown as "END USER".

- **ASSISTANT_NAME_IN_CHAT_PANE**:
  - Description: It determines how the name of the Assistant is displayed in the chat pane.
  - Example value:
    - `COMMBASE` (Default): When set to COMMBASE, the name is shown as "COMMBASE".

- **SYSTEM_VISIBLE_IN_CHAT_PANE_ON**:
  - Possible values: True or False.
  - Example value:
    - `False` (Default): When set to False, it means that the System's name, messages, and notifications will not be displayed in the chat pane.

- **SYSTEM_NAME_IN_CHAT_PANE**:
  - Description: It determines how the name of the System is displayed in the chat pane.
  - Example value:
    - `SYSTEM` (Default): When set to SYSTEM, the name is shown as "SYSTEM".

- **MANAGE_RESULT_MESSAGE_ON_AND_OUTPUT_SKILL_ERRORS_IN_PANE_ON**:
  - Possible values:
    - `True` (Default): When set to True, the feature is enabled, and it manages the result message while also displaying skill errors in the specific the chat pane of the tmux Commbase session.
    - `False`: Whe this value is set to False, the feature is disabled or turned off. In this case, the system would not manage the result message or display skill errors in the specific chat pane of the tmux Commbase session.

- **VOSK_ML_MODEL_DIRECTORY**:
  - Example value:
    - `/bundles/built-in/broker/vosk/models/vosk-model-en-us-0.22-lgraph/model` (Default): This setting is related to a Vosk ML model and determines the directory path where the model is located.

- **SECRETS_FILE_PATH**:
  - Example value:
    - `/config/secrets` (Default): This setting allows users or developers to specify the location of a file containing sensitive information or secrets. Secrets files commonly store confidential data such as API keys, passwords, or access tokens that are required for secure interactions with external services or systems. It is important to handle secrets files with utmost care and ensure that proper security measures are in place to protect the sensitive information stored within them.

- **ASCII_ART_FILE_PATH**:
  - Example value:
    - `/assets/ascii/avatar.asc` (Default): This value represents the default file path for an ASCII art file. The exact content and visual representation of the ASCII art file would depend on the file itself, which could contain a graphical representation of an avatar or any other desired design.

- **ASSISTANT_MICROPHONE_INSTRUCTION_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/discourses/mute_the_microphone_to_pause_the_recording_instruction` (Default): This value represents the default file path for the microphone instruction file. The file that contains instructions or guidelines for the usage of the assistant's microphone.

- **RESULT_MESSAGE_RECORDING_FILE**:
  - Example value:
    - `/data/.result_message.json` (Default): This value represents a default file path. The file is in JSON format and serves as a storage location for a single result message generated by the run STT engine or the Controller.

- **PREVIOUS_RESULT_MESSAGE_RECORDING_FILE**:
  - Example value:
    - `/data/.previous_result_message.json` (Default): This value represents a default file path. The file is in JSON format and serves as a storage location for a single previous result message generated by the run STT engine or the Controller.

- **CONTROLLER_MESSAGE_RECORDING_FILE**:
  - Example value:
    - `/data/.controller_message.json` (Default): This setting allows users or developers to specify the location of the file where Controller messages are stored. The file is in JSON format, and if the Controller is activated, it is used by the Controller to preprocess a single result message generated by the running STT engine before saving the new result to the files held by the variables `RESULT_MESSAGE_RECORDING_FILE` and `PREVIOUS_RESULT_MESSAGE_RECORDING_FILE`.

- **RESULT_MESSAGES_HISTORY_FILE**:
  - Possible values:
    - `/history/.result_messages_history` (Default): This setting represents a default file path. The file allows users or developers to append result messages one after another, sequentially.

- **COMMBASE_STT_VOSK_P_PARSE_CONTROL_MESSAGES_ON**:
  - Possible values: True or False.
  - Example value:
    - `False` (Default): This setting determines whether control messages are parsed or not by the engine commbase-stt-vosk-p in case they are processed by the Controller.

- **COMMBASE_STT_WHISPER_P_PARSE_CONTROL_MESSAGES_ON**:
  - Example value:
  - Possible values: True or False.
    - `False` (Default): This setting determines whether control messages are parsed or not by the engine commbase-stt-whisper-p in case they are processed by the Controller.

- **CONTROL_STOP_PREVIOUS_COMMAND_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_stop_patterns` (Default): By utilizing this value, it becomes possible to reliably halt or terminate the execution of the previously executed terminal/voice command when a terminal/voice command aligns with any of the control command patterns present in the associated patterns file.

- **CONTROL_ACCEPT_CHANGES_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_accept_patterns` (Default): By utilizing this value, it becomes possible to reliably accept changes proposed by the Assistant as feedback to a previously executed terminal/voice command when a terminal/voice command aligns with any of the control command patterns present in the associated patterns file.

- **CONTROL_DENY_CHANGES_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_deny_patterns` (Default): By utilizing this value, it becomes possible to reliably deny or cancel changes proposed by the Assistant as feedback to a previously executed terminal/voice command when a terminal/voice command aligns with any of the control command patterns present in the associated patterns file.

**CONTROL_SELECT_OPTION_NUMBER_ONE_PATTERNS_FILE**
  - Example value:
- `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_select_the_option_number_one_patterns` (Default): By utilizing this value, it becomes possible to reliably select an option among a number of options to proceed or move forward/backward with something proposed by the Assistant as feedback to a previously executed terminal/voice command when a terminal/voice command aligns with any of the control command patterns present in the associated patterns file.

- **CONTROL_SELECT_OPTION_NUMBER_TWO_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_select_the_option_number_two_patterns` (Default): By utilizing this value, it becomes possible to reliably select an option among a number of options to proceed or move forward/backward with something proposed by the Assistant as feedback to a previously executed terminal/voice command when a terminal/voice command aligns with any of the control command patterns present in the associated patterns file.

- **CONTROL_SELECT_OPTION_NUMBER_THREE_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_select_the_option_number_three_patterns` (Default): By utilizing this value, it becomes possible to reliably select an option among a number of options to proceed or move forward/backward with something proposed by the Assistant as feedback to a previously executed terminal/voice command when a terminal/voice command aligns with any of the control command patterns present in the associated patterns file.

- **CONTROL_SELECT_OPTION_NUMBER_FOUR_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_select_the_option_number_four_patterns` (Default): By utilizing this value, it becomes possible to reliably select an option among a number of options to proceed or move forward/backward with something proposed by the Assistant as feedback to a previously executed terminal/voice command when a terminal/voice command aligns with any of the control command patterns present in the associated patterns file.

- **CONTROL_SKIP_QUESTION_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_skip_that_question_patterns` (Default): By utilizing this value, it becomes possible to reliably skip an Assistant question to avoid proceeding or move forward/backward with something proposed by the Assistant as feedback to a previously executed terminal/voice command when a terminal/voice command aligns with any of the control command patterns present in the associated patterns file.

- **CONTROL_REQUEST_THE_CURRENT_MODE_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_what_mode_are_you_in_patterns` (Default): By utilizing this value, it becomes possible to reliably ask the Assistant to let us know which control mode is him/her in/running.

- **CONTROL_ENTER_THE_NORMAL_MODE_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_enter_the_normal_mode_patterns` (Default):  By utilizing this value, it becomes possible to reliably make the Assistant exit/return from a previously entered mode back to the Normal mode.

- **CONTROL_ENTER_THE_CONVERSATION_MODE_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_enter_the_conversation_mode_patterns` (Default): By utilizing this value, it becomes possible to reliably make the Assistant exit from a previously entered mode to enter the Conversation mode.

- **CONTROL_ENTER_THE_EXPERT_MODE_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_enter_the_expert_mode_patterns` (Default): By utilizing this value, it becomes possible to reliably make the Assistant exit from a previously entered mode to enter the Expert mode.

- **CONTROL_ENTER_THE_FOLLOW_MODE_PATTERNS_FILE**:
  - Example value:
    - `/bundles/built-in/broker/libcommbase/resources/control_patterns/vosk-model-en-us-0.22-lgraph/okay_enter_the_follow_mode_patterns` (Default): By utilizing this value, it becomes possible to reliably make the Assistant exit from a previously entered mode to enter the Follow mode.

- **EXTERNAL_STORAGE_DRIVE_01_TAG**:
  - Example value:
    - `WD1` (Default): This tag is used to distinguish or label the specific external storage drive, allowing easy identification and referencing within a system and/or application.

- **EXTERNAL_STORAGE_DRIVE_02_TAG**:
  - Example value:
    - `WD2` (Default): This tag is used to distinguish or label the specific external storage drive, allowing easy identification and referencing within a system and/or application.

- **DEV_PROJECT_DIRECTORY_NAME**:
  - Example value:
    - `YOUR_DEV_PROJECT_DIRECTORY_NAME_HERE` (Default): It can be used to indicate the specific directory or folder where a custom development project is located.

Please ensure that these environment variables are correctly set with the appropriate values before running the application.

How to reset the configuration file **app.conf**.

It restores the configuration file to its inital status. Go to the directory **scripts/utilities** and execute the file **reset_app.conf.sh**.

```sh
cd config-scripts
```

```sh
bash reset-commbase.conf.sh
```

# 6 Default Commbase commands

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

# 7 Create new voice commands basics

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

# 8 Hints on saying and creating voice commands

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

# 9 Commands setup

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

## The Commbase root directory

Commbase uses an environment constant $COMMBASE_ROOT_DIR set up for the user environment/session. Such as in many Linux distributions, this type of constants can be exported in $HOME/.bashrc, $HOME/.zshrc or any other custom shell rc configuration file.

Example of the custom lines added to a bashrc file:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

Example of use of the constant:

```bash
tmux send-keys "bash $COMMBASE_ROOT_DIR/commbase/core/<PATH/TO/SCRIPT/FILE/script.sh> &"
```

The constant can be used in any custom script file inside the Commbase root directory and its subdirectories.

Example in a script header:

```bash
# The configuration file.
source $COMMBASE_ROOT_DIR/commbase/config/commbase.conf
```
Example of use of the constant in the same bash script:

```bash
mpv $COMMBASE_ROOT_DIR/commbase/bundled/audiobooks/Robinson-Crusoe/crusoe_anew_02_baldwin_64kb.mp3
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

# 10 Training Commbase by Assembling Skillsets

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

# 11 Keyboard Shortcuts

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

# 12 Commbase for Software Development

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
