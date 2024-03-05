<div align="right">

### Commbase User's Guide <img align="center" alt="Commbase" width="10%" src="./images/commbase.png" />

</div>

# Content

- [1 Introduction](#1-introduction)
- [2 Start, Stop, and Teleport the Application](#2-start-stop-and-teleport-the-application)
  - [commbase start](#commbase-start)
  - [commbase stop](#commbase-stop)
  - [commbase teleport](#commbase-teleport)
- [3 The User Interface](#3-the-user-interface)
- [4 Useful Tmux Actions](#4-useful-tmux-actions)
  - [Moving Among Windows](#moving-among-windows)
  - [List All the Active Sessions](#list-all-the-active-sessions)
  - [Kill the Session](#kill-the-session)
  - [Display the Session Pane Numbers](#display-the-session-pane-numbers)
  - [Close Duplicated Tmux Sessions](#close-duplicated-tmux-sessions)
  - [More_Tmux_Commands](#more-tmux-commands)
- [5 Set Up Microphones and Audio Keybindings](#5-set-up-microphones-and-audio-keybindings)
  - [Input Audio and Audio Quality Requirements](#input-audio-and-audio-quality-requirements)
  - [To Prepare a Dedicated Sound Capture Device](#to-prepare-a-dedicated-sound-capture-device)
  - [Configure the File to Toggle the Active Capture Device](#configure-the-file-to-toggle-the-active-capture-device)
  - [Configure the File to Toggle the Capture On Off](#configure-the-file-to-toggle-the-capture-on-off)
  - [Configure the File Capture Mute](#configure-the-file-capture-mute)
  - [Configure the File Capture Unmute](#configure-the-file-capture-unmute)
- [6 Keyboard Shortcuts](#6-keyboard-shortcuts)
  - [Keyboard Shortcuts Cheat Sheet](#keyboard-shortcuts-cheat-sheet)
    - [Commbase Key Bindings](#commbase-key-bindings)
    - [Keyboard Shortcuts Overlapping](#keyboard-shortcuts-overlapping)
  - [Input Remapper](#input-remapper)
- [7 Execute the Client and Server on Separate Hosts](#7-execute-the-client-and-server-on-separate-hosts)
- [8 Configuration Variables](#8-configuration-variables)
- [9 Types of Commands](#9-types-of-commands)
  - [Terminal Commands](#terminal-commands)
  - [Terminal Voice Controls](#terminal-voice-controls)
  - [Terminal Voice Skills](#terminal-voice-skills)
  - [Terminal Voice Skillsets](#terminal-voice-skillsets)
- [10 Terminal Voice Controls](#10-terminal-voice-controls)
  - [Undefined Controls](#undefined-controls)
  - [Hidden Controls and Control Chaining](#hidden-controls-and-control-chaining)
- [11 Terminal Voice Skills](#11-terminal-voice-skills)
- [12 Create new skills basics](#12-create-new-skills-basics)
	- [Verbosity Levels](#verbosity-levels)
- [13 Training Commbase by Assembling Skillsets](#13-training-commbase-by-assembling-skillsets)

# 1 Introduction

Commbase is a programmable conversational AI assistant and "distributed AI" or "multi-agent system" (MAS) implemented as a set of separate processes or applications running on a single computer, droid, or smart appliance, originally developed by the Computer Scientist Esteban Herrera, in 2022. It works on general-purpose operating systems without requiring an internet connection. He/She can be improved by AI (Machine Learning and Data Science) and programming languages as described in this document.

# 2 Start, Stop, and Teleport the Application

These commands assume that the `commbase` command has been properly set up. If you haven't set it up yet, you can find instructions on how to do so in the **INSTALL** file.

## commbase start

To start a Commbase session from the command line, run the following command:

```shell
commbase start
```

## commbase stop

To stop or close the running Commbase session, you have a few options:

The most effective way is to use a specific voice command to instruct Commbase to disconnect itself. Simply say `"disconnect yourself"` to initiate the process of stopping the Commbase session gracefully.

Alternatively, you can stop Commbase by running the following command in the command line:

```shell
commbase stop
```

Another method involves manually terminating the Commbase session using the tmux command. First, you can list all active sessions by running:

```shell
tmux list-sessions
```

Identify the session named "Commbase-0" and remember its session ID. Then, issue the following command to kill that specific session:

```shell
tmux kill-session -t Commbase-0
```

## commbase teleport

The "teleport" command in Commbase provides a convenient way to handle different scenarios.

```shell
commbase teleport
```

When used outside a terminal or a terminal tab running Commbase, executing `commbase teleport` will respawn Commbase in the new terminal or terminal tab. This includes retaining all the existing Commbase window output characters. It allows you to seamlessly switch to a different terminal environment while preserving the ongoing Commbase session.

If you completely close the Commbase terminal, Commbase remains active and capable of interacting with you via voice. However, it loses the ability to run graphical applications. In this situation, by teleporting it, Commbase reappears without requiring you to stop and start it again. It conveniently restores the Commbase session and enables you to continue your work.

Additionally, "teleport" can be used as a third alternative to start Commbase. This suggests that it provides an alternative method to initiate a Commbase session, distinct from the other methods available.

By utilizing the "teleport" command, you can conveniently manage and transition your Commbase session to suit your specific needs.

# 3 The User Interface

Using Tmux to create multiple windows with panes can be beneficial for several reasons:
1. Efficient Multitasking
2. Parallel Development
3. Server Management
4. Customization
5. Persistent Sessions

The default minimal app, renders its interface in the file src/app/.sh. This app is composed by 1 single window that manages all the concerns, but draws a maximum of 5 Tmux windows.

The windows from 2 to 5 are not required by the app to work, and can be disabled (see below).

The window 1, "Commbase", contains 7 panes, where every pane runs a component:
- Pane 1. It is the chatroom component.
- Pane 2. It is the client component.
- Pane 3. It is the server component.
- Pane 4. It is the speech recognizer component.
- Pane 5. It is the animation component.
- Pane 6. It is the audio mixer component.
- Pane 7. It is the user terminal component. It is almost always focused, except when is used by Commbase for launching skill scripts.

The window 2, "Dashboard", contains a single pane that is disabled by default in the configuration file.

The window 3, "Server 1", contains a single pane.

The window 4, "Server 2", contains a single pane that is disabled by default in the configuration file.

The window 5, "Files 1", contains a single pane.

The extra windows from 2 to 5 can be disabled or enabled as a group or separately, by changing their settings in the configuration file **config/commbase.conf**.

To show or hide these windows, you can change the values assigned to the next default configuration variables:

`TMUX_EXTRA_WINDOWS_ON`, `TMUX_EXTRA_WINDOW_DASHBOARD_ON`, `TMUX_EXTRA_WINDOW_SERVER1_ON`, and `TMUX_EXTRA_WINDOW_SERVER2_ON`, `TMUX_EXTRA_WINDOW_FILES1_ON`.

You will find information about the variables in the section **8 Configuration Variables**.

Like every file in the directory **src/**, **app.sh** hold a minimal default configuration and can be re-programmed, modularized, or replaced with GUIs to meet the app user needs.

# 4 Useful Tmux Actions

**Oh My Tmux** is a configuration framework for the Tmux terminal multiplexer. **Tmux** is a command-line tool that enables multiple virtual terminals within a single terminal window or session. It provides features like window splitting, session management, and detached sessions.

Oh My Tmux builds on top of Tmux and provides a set of enhancements and customizations to improve the Tmux experience. It offers a collection of preconfigured settings, keybindings, and themes that can be easily applied to Tmux, allowing users to customize and personalize their Tmux environment.

By incorporating Oh My Tmux, Commbase can provide its users with a powerful and customizable terminal environment that enhances productivity, simplifies configuration, and benefits from the active support of the Oh My Tmux community.

Overall, by utilizing Oh My Tmux commands and keybindings, Commbase enhances the usability and efficiency of its terminal interface, providing users with a more seamless and intuitive experience while interacting with the application.

Here are some of Oh My Tmux actions useful when in Commbase.

## Moving Among Windows

Go to the window 2, "Editor":

Press `Ctrl` - `b`, then press `2`.

Go to the window 3, "Timer":

Press `Ctrl` - `b`, then press `3`.

Go to the window 4, "Server 1":

Press `Ctrl` - `b`, then press `4`.

Return to the window 1, "Commbase":

Press `Ctrl` - `b`, then press `1`.

## List All the Active Sessions

```shell
tmux list-sessions
```

## Kill the Session

```shell
tmux kill-session -t Commbase-0
```

## Display the Session Pane Numbers

In the tmux session, press `Ctrl` - `b`, release and then press `q`.

## Close Duplicated Tmux Sessions

In the unlikely event that the Commbase session fails to terminate properly before restarting, it may result in duplicated sessions. To resolve this issue, follow these steps:

Close the current terminal or switch to an alternative Commbase window, for example, "Editor".

Next, list all the active sessions using the comman above.

Finally, close the duplicated session(s).

```shell
tmux kill-session -t Commbase-2 & tmux kill-session -t Commbase-1 & tmux kill-session -t Commbase-0

```

The ampersand (&) at the end of each command allows them to be executed concurrently.

Alternatively, you can terminate all tmux sessions at once.

```shell
pkill tmux
```

Restart Commbase normally.

## More Tmux Commands

The full list of tmux commands is its man page.

```shell
man tmux
```

# 5 Set Up Microphones and Audio Keybindings

Microphones are the ears of your app assistant.

## Input Audio and Audio Quality Requirements

Your app requires a minimum of 2 high-quality USB microphones with integrated noise cancellation. Preferably, the microphones will be digital. That ensures quality communication between the user and the STT engine, making it recognize speech as well as possible.

For example, we access a system **audio settings** GUI that shows the following **input devices**:
* Digital INput (S/-PDIF) FHD Camera Microphone
* Microphone FHD Camera Microphone
* Analog Input Webcam C170
* Internal Microphone Built-in Audio

The second option is currently the best option available, but the third option yet has a pretty decent quality 16-bit mono voice-capturing mic with integrated noise cancellation.

Let's use the two camera microphones (second and third options from the list), which comply the audio setup requirements.

## To Prepare a Dedicated Sound Capture Device

Your assistant's app does not need to work with the default device but with an active device.

In Linux desktops, the default configuration always has a single active capture device, despite the number of devices installed on the operating system.

The Linux package Jack lets you connect multiple sound devices to a common virtual sound bus, boosting the number of active devices.

Jack is able to replace and also interact with PulseAudio, the sound server system for POSIX OSes, including Linux, or any other replacement for PulseAudio. However, that enhancement requires installing professional audio packages or studios, such as KXStudio, running on the operating system.

The easiest way to be able to use Commbase without requiring to route multiple sound capture devices to a common virtual bus is to set up your assistant's app to make it work with a dedicated device.

That device can be selected as the only active input when Commbase is required to talk or receive orders.

In that way, your assistant's app dedicated audio input is not going to interact with/affect the normal audio input(s) used by the rest of the applications, such as AI assistant chatbots, chat/video conference software, DAWs, etc.

Configuration steps for a dedicated capture device for your assistant's with PulseAudio:

- Identify the internal sound card in the computer: 

```shell
pacmd list-sinks | more

```

Verify that there is an index for the devices you want to use as Commbase capture and as alternative capture. 

```output
1 sink(s) available.
   * index: 0
          name: <alsa_output.pci-0000_00_1b.0.analog-stereo>

```

- Filter the name of the sound devices to identify the capture device that will be used as the dedicated Commbase capture device:

```shell
pacmd list-sources | grep name
```

For example, the next output shows a webcam of the brand Logitech and an Intel internal sound card with a capture device:

```output
	name: <alsa_input.usb-_Webcam_C170-02.mono-fallback>
		alsa.name = "USB Audio"
		alsa.subdevice_name = "subdevice #0"
		alsa.card_name = "Webcam C170"
		alsa.long_card_name = "Webcam C170 at usb-0000:00:1a.0-1.2, high speed"
		alsa.driver_name = "snd_usb_audio"
		device.vendor.name = "Logitech, Inc."
		device.product.name = "Webcam C170"
		device.profile.name = "mono-fallback"
		device.icon_name = "camera-web-usb"
	name: <alsa_output.pci-0000_00_1b.0.analog-stereo.monitor>
		alsa.card_name = "HDA Intel PCH"
		alsa.long_card_name = "HDA Intel PCH at 0xf7e30000 irq 32"
		alsa.driver_name = "snd_hda_intel"
		device.vendor.name = "Intel Corporation"
		device.product.name = "7 Series/C216 Chipset Family High Definition Audio Controller"
		device.icon_name = "audio-card-pci"

```

- Test that switching to and activating the chosen dedicated Commbase capture device just works. Open the GUI of pavucontrol, or, for example, in Cinnamon go to System Settings > Sound. That will help to identify the active capture device every time the testing command is run:

```shell
pacmd set-default-source "alsa_input.usb-_Webcam_C170-02.mono-fallback"
pacmd set-default-source "alsa_output.pci-0000_00_1b.0.analog-stereo.monitor"
pacmd set-default-source "alsa_input.pci-0000_00_1b.0.analog-stereo"
pacmd set-default-source "alsa_input.usb-SunplusIT_Inc_FHD_Camera_Microphone_01.00.00-02.analog-stereo"
```

- The selected Commbase and alternative capture devices must be updated in the correspondent local host environment variables stored in the file **config/commbase.conf**. This is an example of the customized variables:

```shell
COMMBASE_CAPTURE_DEVICE_NAME="alsa_input.usb-_Webcam_C170-02.mono-fallback"
ALTERNATIVE_CAPTURE_DEVICE_NAME="alsa_input.usb-SunplusIT_Inc_FHD_Camera_Microphone_01.00.00-02.analog-stereo"
```

Note that those variables are used in the toggle keybinding script files.

The selected devices are added manually, due to their names changing from device to device in the market, also depending on the order they were attached to the computer and/or when they were activated/recognized on/by the OS.

Everybody is allowed to create additional keybinding scripts to suit other needs, like having multi-switch keyboard shortcuts rather than a simple toggle switch like this.

## Configure the File to Toggle the Active Capture Device

The file **scripts/configuration/key_bindings/toggle_active_capture_device.sh** toggles and activates the current active and default capture device to another device in a group of two devices, turning it active and default.

To bind the script to a key combination in Linux, you can use a utility like **xbindkeys** or **xmodmap**. Here's how you can set up a keybinding for your script using **xbindkeys**:

Create a configuration file for **xbindkeys** if it doesn't already exist. You can create a default configuration file using the following command:

```shell
xbindkeys --defaults > ~/.xbindkeysrc
```

Open the ~/.xbindkeysrc file in a text editor. You can use any text editor you prefer, such as nano, vim, or gedit.

```shell
nano ~/.xbindkeysrc
```

Add a keybinding for your script to the ~/.xbindkeysrc file. 

```plaintext
# Toggle active capture device
"bash $COMMBASE_APP_DIR/scripts/configuration/key_bindings/toggle_active_capture_device.sh"
  Control+Shift+z
```

Make sure to specify the key combination you want to use (in this case, `Control+Shift+z`).

Save the file and exit your text editor.

Reload **xbindkeys** to apply the changes to your keybindings:

```shell
xbindkeys -p
```

You can also set up this file using your favorite Desktop Environment or Window Manager key binding configuration. For example, in Cinnamon, a Gnome based Desktop Environment, the keybinding steps are:
 - Go to Menu ⇾ System Settings ⇾ Keyboard ⇾ shortcuts ⇾ Categories ⇾ Sound and Media ⇾ Add custom shortcut. 
 - Next, give the new shortcut a new name, like `toggle active capture device`.
 - Next, select the route to this file.
 - Next, click or tap on the button `Add the keyboard shortcut`. The shortcut appears in the list.
 - Next, click on unassigned to pick an accelerator.
 - Next, press the keys `CTRL` + `SHIFT` + `Z` (all together) and then release them at a time.
 - Then the new key binding appears on the list.
 - Finally, verify that the key binding works.

## Configure the File to Toggle the Capture On Off

The file **scripts/configuration/key_bindings/toggle_capture_on-off.sh** is a parameter to toggle ON/OFF the sound capture.

To bind the script to a key combination in Linux, you can use a utility like **xbindkeys** or **xmodmap**. Here's how you can set up a keybinding for your script using **xbindkeys**:

Create a configuration file for **xbindkeys** if it doesn't already exist. You can create a default configuration file using the following command:

```shell
xbindkeys --defaults > ~/.xbindkeysrc
```

Open the ~/.xbindkeysrc file in a text editor. You can use any text editor you prefer, such as nano, vim, or gedit.

```shell
nano ~/.xbindkeysrc
```

Add a keybinding for your script to the ~/.xbindkeysrc file. 

```plaintext
# Toggle capture on-off
"bash $COMMBASE_APP_DIR/scripts/configuration/key_bindings/toggle_capture_on-off.sh"
  Alt+Shift+1
```

Make sure to specify the key combination you want to use (in this case, `Alt+Shift+1`).

Save the file and exit your text editor.

Reload **xbindkeys** to apply the changes to your keybindings:

```shell
xbindkeys -p
```

You can also set up this file using your favorite Desktop Environment or Window Manager key binding configuration. For example, in Cinnamon, a Gnome based Desktop Environment, the keybinding steps are:
 - Go to Menu ⇾ System Settings ⇾ Keyboard ⇾ shortcuts ⇾ Categories ⇾ Sound and Media ⇾ Add custom shortcut. 
 - Next, give the new shortcut a new name, like `toggle capture ON or OFF`.
 - Next, select the route to this file.
 - Next, click or tap on the button `Add the keyboard shortcut`. The shortcut appears in the list.
 - Next, click on unassigned to pick an accelerator.
 - Next, press the keys `ALT` + `SHIFT` + `1` (all together) and then release them at a time.
 - Then the new key binding appears on the list.
 - Finally, verify that the key binding works.

## Configure the File Capture Mute

The file **scripts/configuration/key_bindings/capture_mute.sh** a parameter to mute the sound capture.

To bind the script to a key combination in Linux, you can use a utility like **xbindkeys** or **xmodmap**. Here's how you can set up a keybinding for your script using **xbindkeys**:

Create a configuration file for **xbindkeys** if it doesn't already exist. You can create a default configuration file using the following command:

```shell
xbindkeys --defaults > ~/.xbindkeysrc
```

Open the ~/.xbindkeysrc file in a text editor. You can use any text editor you prefer, such as nano, vim, or gedit.

```shell
nano ~/.xbindkeysrc
```

Add a keybinding for your script to the ~/.xbindkeysrc file. 

```plaintext
# Mute capture
"bash $COMMBASE_APP_DIR/scripts/configuration/key_bindings/capture_mute.sh"
  Alt+Shift+2
```

Make sure to specify the key combination you want to use (in this case, `Alt+Shift+2`).

Save the file and exit your text editor.

Reload **xbindkeys** to apply the changes to your keybindings:

```shell
xbindkeys -p
```

You can also set up this file using your favorite Desktop Environment or Window Manager key binding configuration. For example, in Cinnamon, a Gnome based Desktop Environment, the keybinding steps are:
 - Go to Menu ⇾ System Settings ⇾ Keyboard ⇾ shortcuts ⇾ Categories ⇾ Sound and Media ⇾ Add custom shortcut. 
 - Next, give the new shortcut a new name, like `capture mute`.
 - Next, select the route to this file.
 - Next, click or tap on the button `Add the keyboard shortcut`. The shortcut appears in the list.
 - Next, click on unassigned to pick an accelerator.
 - Next, press the keys `ALT` + `SHIFT` + `2` (all together) and then release them at a time.
 - Then the new key binding appears on the list.
 - Finally, verify that the key binding works.

## Configure the File Capture Unmute

The file **scripts/configuration/key_bindings/capture_unmute.sh** a parameter to mute the sound capture.

To bind the script to a key combination in Linux, you can use a utility like **xbindkeys** or **xmodmap**. Here's how you can set up a keybinding for your script using **xbindkeys**:

Create a configuration file for **xbindkeys** if it doesn't already exist. You can create a default configuration file using the following command:

```shell
xbindkeys --defaults > ~/.xbindkeysrc
```

Open the ~/.xbindkeysrc file in a text editor. You can use any text editor you prefer, such as nano, vim, or gedit.

```shell
nano ~/.xbindkeysrc
```

Add a keybinding for your script to the ~/.xbindkeysrc file. 

```plaintext
# Unmute capture
"bash $COMMBASE_APP_DIR/scripts/configuration/key_bindings/capture_unmute.sh"
  Alt+Shift+3
```

Make sure to specify the key combination you want to use (in this case, `Alt+Shift+3`).

Save the file and exit your text editor.

Reload **xbindkeys** to apply the changes to your keybindings:

```shell
xbindkeys -p
```

You can also set up this file using your favorite Desktop Environment or Window Manager key binding configuration. For example, in Cinnamon, a Gnome based Desktop Environment, the keybinding steps are:
 - Go to Menu ⇾ System Settings ⇾ Keyboard ⇾ shortcuts ⇾ Categories ⇾ Sound and Media ⇾ Add custom shortcut. 
 - Next, give the new shortcut a new name, like `capture unmute`.
 - Next, select the route to this file.
 - Next, click or tap on the button `Add the keyboard shortcut`. The shortcut appears in the list.
 - Next, click on unassigned to pick an accelerator.
 - Next, press the keys `ALT` + `SHIFT` + `3` (all together) and then release them at a time.
 - Then the new key binding appears on the list.
 - Finally, verify that the key binding works.

# 6 Keyboard Shortcuts

Familiarizing yourself with these shortcuts will help you perform actions more swiftly, making your interaction with the app more enjoyable.

## Keyboard Shortcuts Cheat Sheet

To use keyboard shortcuts in your app, simply press the designated key combinations listed below.

### Commbase Key Bindings

`CTRL` + `SHIFT` + `Z` : Toggle active capture device.
<br />`ALT` + `SHIFT` + `1` : Toggle ON/OFF sound capturing.
<br />`ALT` + `SHIFT` + `2` : Stop sound capturing.
<br />`ALT` + `SHIFT` + `3` : Start sound capturing.

These group of shortcuts are defined in the directory **scripts/configuration/key_bindings/**.

### Keyboard Shortcuts Overlapping

Some of the keyboard shortcuts could overlap with other keyboard shortcuts. To help you avoid that problem, you can use [this document.](./Keyboard%20Shortcuts%20Cheat%20Sheet.md)

## Input Remapper

It's an easy to use tool to change the mapping of your input device buttons. It's kind of a Linux alternative to the popular Karabiner for MacOS.
<br />Supports mice, keyboards, gamepads, X11, Wayland, combined buttons and programmable macros.
<br />Allows mapping non-keyboard events (click, joystick, wheel) to keys of keyboard devices.
<br />Web: <https://github.com/sezanzeb/input-remapper>

This application can help other Apps such as the AI Assistant "Commbase" execute voice commands based on Commbase scripts that run custom keyboard shortcuts created with Input Remapper instead of Cinnamon which can make Commbase independant of Gnome/Cinnamon, but still dependent of the powerful Gnome terminal.

Consider Input Remmaper to create new custom Commbase commands or, for example, replace our chosen Development editor with another editor or IDE enhanced with Commbase with this type of mappings. Include and document a back and restore procedure of your custom mapping files.

# 7 Execute the Client and Server on Separate Hosts

The commbase-data-exchange bundle enhances Commbase by providing the functionality of a localhost-based application with a single server and single client. This configuration operates similarly to any standalone application but introduces additional advantages.

In Commbase, this feature is designed to function seamlessly by default. However, if you plan to run the client and server components on separate hosts, for any of the reasons mentioned earlier, please refer to [`this document.`](./Execute%20the%20Commbase%20client%20and%20server%20on%20separate%20hosts.md)

In order for Commbase to work like this, it must be installed in both client and server.

Creating an application that separates client and server components is a common architectural approach in software development. Here are some reasons for designing applications with separate client and server components:

| Category                         | Example                                                     |
|----------------------------------|-------------------------------------------------------------|
| **Scalability**                  | Adding more server instances to handle increased load.      |
| **Responsiveness**               | Separating graphical interfaces to ensure quick UI updates. |
| **Security**                     | Keeping sensitive data and business logic on the server.    |
| **Flexibility**                  | Developing client and server components independently.      |
| **Cross-Platform Compatibility** | Building an application that runs on various devices.       |
| **Centralized Data Management**  | Storing and managing data on a centralized server.          |
| **Improved Maintenance**         | Updating the client or server independently without impact. |
| **Reduced Network Load**         | Minimizing data transfer between client and server.         |

# 8 Configuration Variables

The configuration variables can be accessed by going to the directory **config/** and opening the files **secrets**, **app.conf**, and **commbase.conf**.

Use your favorite text editor to open any of those files.

```shell
nano config/secrets
```

```shell
nano config/app.conf
```

```shell
nano config/commbase.conf
```

The file **secrets** holds all the identities, passwords, usernames, IP addresses, and other private information to be used to log in to external services and identify and connect to other computers from your Commbase-based app. 

The file **app.conf** is for you to add your custom Commbase-based app new variables, except for the secrets, which should go in the **secrets** file.

The file **commbase.conf** holds all the Commbase configuration options.

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

- **GOOGLE_API_KEY**:
  - Example value:
    - `your_google_api_key`: The API key for accessing Google AI services. It's important to keep your API key secure and not share it with unauthorized individuals, as it provides access to your Google AI account and the associated usage of the API services.

- **OPENAI_API_KEY**:
  - Example value:
    - `your_openai_api_key`: The API key for accessing OpenAI services. It's important to keep your API key secure and not share it with unauthorized individuals, as it provides access to your OpenAI account and the associated usage of the API services.

Please ensure that these environment variables are correctly set with the appropriate values before running the application.

The default version of the file **commbase.conf** contains the next values:

- **PYTHON_ENV_VERSION**:
  - Example values:
    - `python` (Default): Choosing this value implies that the virtual environment will use the Python version associated with the default system Python interpreter. Choose this value whether your application uses a virtual environment such as commbase_env. For more details, check out the file **INSTALL**.
    - `python3.12`: This value indicates a custom Python version, specifically version 3.12. For more details, check out the file **INSTALL**.
    - `python3`: This value also represents a custom Python version, but the exact version is not specified. For more details, check out the file **INSTALL**.

- **STT_PROCESS_CPU_LIMIT_PERCENTAGE**:
  - Description: The percentage value represents the proportion of CPU resources that the STT process can consume relative to the total available CPU capacity. For more details, check out the file **INSTALL**.
  - Possible values: This variable should be a value between 0 and 100 or between 0 and 400 (for machines with 4 processing cores or more.)
  - Example value:
    - `90` (Default): The STT process is going to use up to 75% of the computer's processing power.

- **CONDA_ENV_NAME_IF_EXISTS**:
  - Example values:
    - `commbase_env` (Default): The default Commbase environment name that is logged in the file commmbase_env.yaml to build the Anaconda Python environment. For more details, check out the file **INSTALL**.
    - `my_env_name`: An alternative name for creating the Commbase virtual environment.

- **COMMBASE_LOCALE**:
  - Description: This setting is used to determine the language and regional preferences for user interfaces, messages, and other communicative elements within the software. The components related to language settings include: the i18n directory (which covers the Commbase files themselves), control patterns, and skills patterns of libcommbase. Additionally, users can code custom Commbase app terminal/voice commands with skill/skillset scripts, which should come with internationalization support.
  - Example values:
    - `en_us` (Default): This setting designates the default locale as English (United States). Users with this locale will encounter the application in English, experiencing the predetermined language and formatting preferences specified by this setting.

- **COMMBASE_DATA_EXCHANGE_SERVER_HOST_ADDRESS**:
  - Description: The host address for the Commbase Data Exchange Server.
  - Example value:
    - `127.0.0.1` (Default): The server is hosted on the local machine.

- **COMMBASE_DATA_EXCHANGE_SERVER_PORT**:
  - Description: The port on which the Commbase Data Exchange Server operates.
  - Example value:
    - `5000` (Default): The server communicates on port 5000.

- **COMMBASE_DATA_EXCHANGE_SERVER_CONNECTION_FILE_PATH**:
  - Description: File path for the server's connection module.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/commbase-data-exchange/server/server_http_websocket.py`

- **COMMBASE_DATA_EXCHANGE_SERVER_UPLOADER_FILE_PATH**:
  - Description: File path for the server's uploader module.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/commbase-data-exchange/server/uploader_http_websocket.py`

- **COMMBASE_DATA_EXCHANGE_CLIENT_CONNECTION_FILE_PATH**:
  - Description: File path for the client's connection module.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/commbase-data-exchange/client/client_http_websocket.py`

- **COMMBASE_DATA_EXCHANGE_CLIENT_UPDATER_FILE_PATH**:
  - Description: File path for the client's uploader module.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/commbase-data-exchange/client/updater_http_websocket.py`

- **CLIENT_POLLING_INTERVAL_IN_SECS**:
  - Description: Polling interval in seconds for the client.
  - Example value:
    - `5` (Default): The client polls every 5 seconds.

- **CERTS_AND_KEYS_SERVER_CRT_FILE**:
  - Description: File path for the server's certificate file.
  - Example value:
    - `/certificates/server.crt`

- **CERTS_AND_KEYS_SERVER_KEY_FILE**:
  - Description: File path for the server's key file.
  - Example value:
    - `/certificates/server.key`

- **CERTS_AND_KEYS_CERT_PEM_FILE**:
  - Description: File path for the certificate PEM file.
  - Example value:
    - `/certificates/cert.pem`

- **CERTS_AND_KEYS_KEY_PEM_FILE**:
  - Description: File path for the key PEM file.
  - Example value:
    - `/certificates/key.pem`

- **CERTS_AND_KEYS_CA_PEM_FILE**:
  - Description: File path for the CA PEM file.
  - Example value:
    - `/certificates/ca.pem`

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

- **STT_ENGINE_PATH**:
  - Description: It specifies the path to the current STT engine's executable or script file bundled with Commbase. It is updated to one of following possible values (TODO: create a skill command and a Keybinding for this.)
  - Possible values:
    - `$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-reactive-p/commbase_stt_whisper_reactive_p.py` (Default): Reactive means the engine is always lazily listening, processing the voice messages only when they arrive. Therefore, engine has 2 strokes: passive and processing.
    - `$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-proactive-p/commbase_stt_whisper_proactive_p.py`: Proactive means the engine continuously changes among 4 strokes: listening, active, processing, and stopped.

- **STT_ENGINE_STRING**:
  - Description: It represents a string that specifies the path to the current STT engine's executable or script file bundled with Commbase.
  - Possible values:
    - `$PYTHON_ENV_VERSION $STT_ENGINE_PATH 2> /dev/null` (Default): It specifies the Commbase STT engine's executable script.

- **COMMBASE_STT_WHISPER_REACTIVE_P_CLIENT_DATA_FILE**:
  - Possible values:
    - `/bundles/commbase-stt-whisper-reactive-p/client_data/recording.wav` (Default): The Commbase STT Whisper reactive p client temporary audio recording file. The purpose of this file is for storing audio data obtained from the execution of the bash script **commrecorder.sh** in the directory **bundles/commbase-stt-whisper-reactive-p/**. **commbase_stt_whisper_reactive_p.py** monitors the modification time of this file and, upon detecting changes, transcribes the audio content using the Whisper ASR (Automatic Speech Recognition) model. The transcribed text is then printed and appended to the chatroom pane.

- **CHAT_LOG_FILE**:
  - Possible values:
    - `/data/.chat_log.txt` (Default): The chat log file likely stores a record of interactions or conversations.

- **TTS_ENGINE_STRING**:
  - Description: It represents a string that specifies the configuration or command to invoke the TTS engine. You can set up a third-party engine here, including proprietary engines with proprietary voices or voices from other operating systems, TTS systems with the ability to use a clone/fake of your own voice, or API-connection-based TTS services tied to paid subscriptions. Every TTS has its features, advantages, and disadvantages, so its selection is your decision.
  - Possible values:
    - `$PYTHON_ENV_VERSION $COMMBASE_APP_DIR/bundles/commbase-tts-pyttsx3/commbase_tts_pyttsx3.py --rate 150 --voice-index 18` (Default): It specifies the TTS engine commbase-tts-pyttsx3.py's executable script and arguments. It uses a specified speed rate and voice index to convert the text into speech and play it back. There is one voice index for every language or accent installed by or recognized by pyttsx3 in the system. You can modify those arguments in the string. To select a voice/accent by index, use the utility **list_all_voices_available_for_pyttsx3.py** that you will find out in the directory **scripts/utilities**.
    - `festival --tts`: It specifies the TTS command Festival and its arguments. Festival comes with a unique and some basic English voice tone out of the box. You can install Festival-compatible extra voices from different internet sources. To know how to install Festival-compatible voices and set one as your custom application's voice, read [`this guide.`](./Festival.md)
    - `espeak -v f2`: It specifies the TTS command Espeak and its arguments. The given argument means to speak using the default English female voice number 2. You can install Espeak-compatible extra voices from different internet sources.
    - `espeak -v m3`: It specifies the TTS command Espeak and its arguments. The given argument means to speak using the default English male voice number 3. You can install Espeak-compatible extra voices from different internet sources.
    - `xargs swift`: It specifies the TTS command swift. The company Ceptral has high quality, natural speech OSS licensed voices can be purchased, installed and downloaded from the Ceptral web site.
    - `$PYTHON_ENV_VERSION $COMMBASE_APP_DIR/bundles/commbase-tts-gTTS/commbase_tts_gTTS.py --param1 val1 --param2 val2 --param3 val3:`: It specifies the TTS executable commbase-tts-gTTS.py's script and its arguments. gTTS (Google Text-to-Speech)is a Python library and CLI tool to interface with Google Translate text-to-speech API.

- **TMUX_EXTRA_WINDOWS_ON**:
  - Possible values:
    - `True` (Default): Set to True, it activates the extra windows feature in the Commbase tmux session.
    - `False`: Set to False, it deactivates the extra windows feature in the Commbase tmux session.

- **TMUX_EXTRA_WINDOW_DASHBOARD_ON**:
  - Possible values:
    - `False` (Default): Set to False, it deactivates the extra window Dashboard in the Commbase tmux session.
    - `True`: Set to True, it activates the extra window Timer in the Commbase tmux session.

- **TMUX_EXTRA_WINDOW_SERVER1_ON**:
  - Possible values:
    - `True` (Default): Set to True, it activates the extra window Server 1 in the Commbase tmux session.
    - `False`: Set to False, it deactivates the extra window Server 1 in the Commbase tmux session.

- **TMUX_EXTRA_WINDOW_SERVER2_ON**:
  - Possible values:
    - `False` (Default): Set to False, it deactivates the extra window Server 2 in the Commbase tmux session.
    - `True`: Set to True, it activates the extra window Server 2 in the Commbase tmux session.

- **TMUX_EXTRA_WINDOW_FILES1_ON**:
  - Possible values:
    - `True` (Default): Set to True, it activates the extra window Files 1 in the Commbase tmux session.
    - `False`: Set to False, it deactivates the extra window Files 1 in the Commbase tmux session.

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
    - `$TERMINAL_BLUE_BACKGROUND_COLOR_CODE_START` (Default): Turns blue the End User background color in the chat pane, based on the colors defined in other terminal variables.

- **ASSISTANT_BACKGROUND_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `$TERMINAL_GREEN_BACKGROUND_COLOR_CODE_START` (Default): Turns green the Assistant background color in the chat pane, based on the colors defined in other terminal variables.

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

- **ASSISTANT_AVATAR_COLOR_IN_CHAT_PANE**:
  - Possible values: The options are: red, green, yellow, blue, magenta, cyan, white, or black.
  - Example value:
    - `cyan` (Default): Turns cyan the Assistant avatar color in the chat pane, based on the colors defined in other terminal variables. 

- **END_USER_NAME_IN_CHAT_PANE**:
  - Description: It determines how the name of the End User is displayed in the chat pane.
  - Example value:
    - `🧑 END USER:` (Default): When set to END USER, the name is shown as "END USER".

- **ASSISTANT_NAME_IN_CHAT_PANE**:
  - Description: It determines how the name of the Assistant is displayed in the chat pane.
  - Example value:
    - `✨ ASSISTANT:` (Default): When set to ASSISTANT, the name is shown as "ASSISTANT".

- **SECRETS_FILE_PATH**:
  - Example value:
    - `/config/secrets` (Default): This setting allows users or developers to specify the location of a file containing sensitive information or secrets. Secrets files commonly store confidential data such as API keys, passwords, or access tokens that are required for secure interactions with external services or systems. It is important to handle secrets files with utmost care and ensure that proper security measures are in place to protect the sensitive information stored within them.

- **ASCII_ART_FILE_PATH**:
  - Example value:
    - `/assets/ascii/avatar.asc` (Default): This value represents the default file path for an ASCII art file. The exact content and visual representation of the ASCII art file would depend on the file itself, which could contain a graphical representation of an avatar or any other desired design.

- **ASSISTANT_MICROPHONE_INSTRUCTION_FILE**:
  - Example value:
    - `/bundles/libcommbase/resources/discourses/mute_the_microphone_to_pause_the_recording_instruction` (Default): This value represents the default file path for the microphone instruction file. The file that contains instructions or guidelines for the usage of the assistant's microphone.

- **MESSAGING_FILE**:
  - Example value:
    - `/data/.messages.json` (Default): This value represents a default file path. The file is in JSON format and serves as a storage location for a single messages content generated by the run STT engine, libcommbase controller, or the commbase executable.

- **MESSAGING_HISTORY_FILE**:
  - Possible values:
    - `/history/.messaging_history` (Default): This setting represents a default file path. The file allows users or developers to append result messages one after another, sequentially.

- **CONTROL_PATTERNS_FILE**:
  - Description: This file stores a set of key-value pairs. Each key corresponds to a specific control action trigger, and the associated values are arrays containing different variations or phrases that are recognized as valid expressions of that control. Controls are designed to respond to spoken or written control command, aka Terminal Voice Controls. You can carefully add/edit custom values for any value property in the file. You must verify that the values are well recognized by the STT engine when spoken to ensure that they will work as controls. Add new custom properties is possible but the earlier you add them the better, because the controls are hard coded in the skill scripts and adding a new property in the control patterns file could involve updating every existent skill in the skills catalog. For a description of the controls, use the command `commbase --help`.
  - Example value:
    - `/bundles/libcommbase/resources/control_patterns/en_us/openai_whisper_model_base/control_patterns.json` (Default): This value represents a default file path.

- **ANSWER_UNKNOWN_COMMANDS_USING_AI_CHATBOT_ON**:
  - Description: This variable is used in the function **bundles/libcommbase/libcommbase/routines/skills_else**.
  - Possible values: True or False.
  - Example value:
    - `False` (Default): The assistant will answer to unknown commands using the **bundles/libcommbase/libcommbase/routines/random_no** function.
    - `True`: If the variable is active in the configuration file **config/commbase.conf** the assistant will answer using a connection to a bundled or served AI chatbot that uses natural language processing to create a humanlike conversational dialogue, for example, **OpenAI's GPT**, instead of using the **bundles/libcommbase/libcommbase/routines/random_no function**, making those negative answers more conversational. The AI chatbot is defined by the variable `AI_CHATBOT_STRING`. App users can use this as an advantage to make interactions with the assistant appear more organic due to commands can be mixed with regular conversations similar to the conversations in the **conversation mode** or the **expert mode**. However, it can lead users to wrongly say language patterns strictly predefined as terminal/voice commands, which are automatically identified by the application and executed without user intention. As a consequence of the wrong use of this feature, any "strange behavior" can be interpreted as **"AI hallucinations"**: situations where artificial intelligence systems produce unexpected or unintended outputs that seem to resemble hallucinations in a human context. Also, the user is still limited to typing/saying **prompts** (or terminal/voice commands) of 9 words maximum as it is defined for the **normal mode** (it relies on the maximum number of command arguments that can be used in Bash), and the bundled or served AI chatbot is also limited to answering using a maximum of 35 words (modifiable, using the variable `UNKNOWN_COMMAND_AI_CHATBOT_WORDS_LIMIT`.)

- **AI_CHATBOT_STRING**:
  - Description: Defines the bundled or served AI chatbot answering unknown terminal/voice commands. Do not confuse with `TRAINED_AI_CHATBOT_STRING`, despite the fact that both variables can hold the same value.
    Check out the variables: `UNKNOWN_COMMAND_AI_CHATBOT_WORDS_LIMIT` and `ANSWER_UNKNOWN_COMMANDS_USING_AI_CHATBOT_ON`.
  - Possible values:
    - `$COMMBASE_APP_DIR/bundles/commbase-llm-google-gemini-p/commbase_llm_google_gemini_p.py` (Default): Defines Google's Gemini as the **served AI chatbot** that uses natural language processing to create a humanlike conversational dialogue.
    - `$COMMBASE_APP_DIR/bundles/commbase-llm-openai-gpt-p/commbase_llm_openai_gpt_p.py`: Defines OpenAI's GPT as the **served AI chatbot** that uses natural language processing to create a humanlike conversational dialogue. Using a large language model (LLM) like GPT-3, GPT-4, etc., with an **internet connection**, allows users to have access to real-time data, for example, current weather information, and then ask questions like "How is the weather like in Toronto?" and receive a perfect answer. Using AI chatbots like OpenAI's GPT with an internet connection offers many advantages, but it also comes with several disadvantages. Here are some of the **key drawbacks**: Privacy Concerns, Security Risks, Dependency on Internet, Data Usage and Costs, Latency, Outages and Downtime, Lack of Offline Functionality, Maintenance and Updates, Accessibility Issues, Dependency on Service Providers, Potential for Bias and Misinformation, Lack of Control. To mitigate these disadvantages, organizations and users should carefully consider their specific needs and use cases when implementing AI chatbots.
    - `$COMMBASE_APP_DIR/bundles/commbase-llm-meta-llama-p/commbase_llm_meta_llama_p.py`: Defines Meta's open source large language model Llama 2, 3, etc., as the **local AI chatbot** that uses natural language processing to create a humanlike conversational dialogue. Using a large language model (LLM) like Llama without an **internet connection**, often referred to as **"offline" mode**, can have several **disadvantages**: Limited Information Retrieval, Outdated Information, Reduced Contextual Understanding, Decreased General Knowledge, Limited Personalization, Reduced Translation and Multilingual Abilities, Inability to Access External Services, Loss of Real-Time Adaptation, Dependency on Initial Training Data. To mitigate these disadvantages, organizations and users should carefully consider their specific needs and use cases when implementing AI chatbots.

- **UNKNOWN_COMMAND_AI_CHATBOT_WORDS_LIMIT**:
  - Description: Limiting answers can be beneficial because it promotes brevity, clarity, and conciseness. It ensures that information is delivered efficiently, making it easier for readers/listeners to grasp and retain the key points.
    Check out the variables: `AI_CHATBOT_STRING` and `ANSWER_UNKNOWN_COMMANDS_USING_AI_CHATBOT_ON`.
  - Possible values: (Double quoted) numbers.
  - Example value:
    - `35` (Default): Limits the bundled or served AI chatbot to answering using a maximum of 35 words.

- **TRAINED_AI_CHATBOT_CAN_RUN_SKILLS_ON**:
  - Description: This variable is an excellent example of **automation in computer science programming** versus **learning from data in machine learning** using **language models**. By using **more precise and controlled interactions with the model**, implementing techniques and concepts such as: **custom instructions, fine-tuning, embeddings, and meta prompts**, the assistant gets closer to passing the **"Turing test""**, but sacrificing some percentage of accuracy in interpreting and running skills/skillsets. You can use frameworks like LangChain to simplify the creation of applications using large language models. The decision to train your own language model should be made after careful consideration of your specific requirements and constraints. In many cases, it may be more practical to use **precise and controlled interactions with the model** on a **pre-trained model** like Open AI's GPT to achieve some level of customization while leveraging the benefits of the model's existing knowledge base. You can train a language model to answer questions and provide assistance using Linux commands, etc., but it would require a substantial amount of training data and specialized expertise in **natural language processing (NLP)** and **machine learning**. No matter how, the goal is to make the selected model return skills/skillsets when it thinks that the user prompts terminal/voice commands in the middle of conversations in the **"conversation mode"**, the **"expert mode"**, or in **"normal mode"** with the variable `ANSWER_UNKNOWN_COMMANDS_USING_AI_CHATBOT_ON` set to "True". Those returned skills/skillsets will be processed by the AI chatbot and then run accordingly.
  - Possible values: True or False.
  - Example value:
    - `False` (Default): The trained AI chatbot language model's ability to return and run skills/skillsets in conversations is disabled.
    - `True`: Enables the trained AI chatbot language model's ability to return and run skills/skillsets in conversations.

- **TRAINED_AI_CHATBOT_STRING**:
  - Description: Defines the bundled or served trained AI chatbot. Do not confuse with `AI_CHATBOT_STRING`, despite the fact that both variables can hold the same value.
    Check out the variables: `UNKNOWN_COMMAND_TRAINED_AI_CHATBOT_WORDS_LIMIT` and `TRAINED_AI_CHATBOT_CAN_RUN_SKILLS_ON`.
  - Possible values:
    - `$COMMBASE_APP_DIR/bundles/commbase-llm-google-gemini-p/commbase_llm_google_gemini_p.py` (Default): Defines Google's Gemini as the served trained AI chatbot that uses natural language processing to create a humanlike conversational dialogue.
    - `$COMMBASE_APP_DIR/bundles/commbase-llm-openai-gpt-p/commbase_llm_openai_gpt_p.py`: Defines OpenAI's GPT as the served trained AI chatbot that uses natural language processing to create a humanlike conversational dialogue. OpenAI has made GPT available to developers, with the added bonus of **allowing them to customize the model to improve performance for their specific use cases**. According to OpenAI, **fine-tuning** GPT-3.5 Turbo can even outperform base GPT-4 for certain tasks. **Embeddings** and **meta prompts** are required to achieve the goal of making the OpenAI's GPT model return skills/skillsets when it thinks that the user prompts terminal/voice commands in the middle of conversations, but you must be careful about the model regarding **tokens** limits. **Fine-tuning** is not always recommended. It can be used to, for example, template/format the answers of the model. Using a **large language model (LLM)** like GPT-4 with an **internet connection**, allows users to have access to real-time data, for example, current weather information, and then ask questions like "How is the weather like in Toronto?" and receive a perfect answer.
    - `$COMMBASE_APP_DIR/bundles/commbase-llm-meta-llama-p/commbase_llm_meta_llama_p.py`: Defines Meta's open source large language model Llama 2, 3, etc., as the local trained AI chatbot that uses natural language processing to create a humanlike conversational dialogue. The text generation Llama 2 model can be **fine-tuned on any domain-specific dataset**. After it's fine-tuned on the domain-specific dataset, the model is expected to generate domain-specific text and solve various NLP tasks in that specific domain with **few-shot prompting**. Using a **large language model (LLM)** like Llama 2 without an **internet connection**, often referred to as "offline" mode, can have several disadvantages: Limited Information Retrieval, Outdated Information, Reduced Contextual Understanding, Decreased General Knowledge, Limited Personalization, Reduced Translation and Multilingual Abilities, Inability to Access External Services, Loss of Real-Time Adaptation, Dependency on Initial Training Data.

- **UNKNOWN_COMMAND_TRAINED_AI_CHATBOT_WORDS_LIMIT**:
  - Description: Limiting answers can be beneficial because it promotes brevity, clarity, and conciseness. It ensures that information is delivered efficiently, making it easier for readers/listeners to grasp and retain the key points.
    Check out the variables: `TRAINED_AI_CHATBOT_STRING` and `TRAINED_AI_CHATBOT_CAN_RUN_SKILLS_ON`.
  - Possible values: (Double quoted) numbers.
  - Example value:
    - `35` (Default): Limits the bundled or served trained AI chatbot to answering using a maximum of 35 words.

- **SOUND_POSITIVE_CONFIRMATION**:
  - Description: The sound file path for a positive confirmation sound, typically used to indicate a successful or affirmative response, something turned on, or something enabled.
  - Possible values: High quality wave audio files.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/libcommbase/resources/bundles/sounds/beep-up.wav` (Default): A high tone sound.

- **SOUND_NEGATIVE_CONFIRMATION**:
  - Description: The sound file path for a negative confirmation sound, typically used to indicate an unsuccessful or negative response, something turned off, or something disabled.
  - Possible values: High quality wave audio files.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/libcommbase/resources/bundles/sounds/beep-down.wav` (Default): A low tone sound.

- **SOUND_SAY_YES_WITHOUT_SPEAKING**:
  - Description: The sound file path for a non-verbal affirmative response, often used in scenarios where speaking is not possible or necessary.
  - Possible values: High quality wave audio files.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/libcommbase/resources/bundles/sounds/mixkit-sci-fi-confirmation-914.wav` (Default): A Futuristic Sci-Fi invention confirmation sound.

- **SOUND_SAY_NO_WITHOUT_SPEAKING**:
  - Description: The sound file path for a non-verbal negative response, used in situations where verbal communication is not required or feasible.
  - Possible values: High quality wave audio files.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/libcommbase/resources/bundles/sounds/mixkit-sci-fi-reject-notification-896.wav` (Default): A funny rejection like sound.

- **SOUND_A_PENDING_TASK_AWAITS_ATTENTION**:
  - Description: The sound file path indicating that a pending task requires attention or action. It is typically used to notify the user of an outstanding task.
  - Possible values: High quality wave audio files.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/libcommbase/resources/bundles/sounds/mixkit-unlock-game-notification-253.wav` (Default): A sound for a pending task that requires user attention or intervention.

- **SOUND_PENDING_TASKS_REMINDER**:
  - Description: The sound file path used as a reminder for pending tasks. It may be played at regular intervals to draw attention to unfinished tasks.
  - Possible values: High quality wave audio files.
  - Example value:
    - `$COMMBASE_APP_DIR/bundles/libcommbase/resources/bundles/sounds/mixkit-uplifting-flute-notification-2317.wav` (Default): A sound that reminds the user about the pending tasks queue.

- **PENDING_TASKS_VERIFICATION_FREQUENCY_IN_SECS**:
  - Description: The frequency, in seconds, at which pending tasks are checked or verified. To calculate this, you can multiply the number of minutes, for example, 60 minuts (an hour) by the number of seconds in a minute (60 seconds): 1 hour * 60 minutes/hour * 60 seconds/minute = 3,600 seconds. There are 3,600 seconds in 1 hour.
  - Possible values: A number of seconds.
  - Example value:
    - `3600` (Default): Set to 3600 seconds (equivalent to 1 hour and 0 minutes), indicates that the system checks for pending tasks approximately every 60 minutes.

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

How to reset the configuration file **commbase.conf**.

It restores the configuration file to its inital status. Go to the directory **scripts/utilities/reset_commbase.conf/** and execute the file **reset_commbase.conf.sh**.

```shell
cd scripts/utilities
```

```shell
bash reset-commbase.conf.sh
```

# 9 Types of Commands

You can display the types of commands and some examples using the help option like this:

```shell
commbase -h
commbase --help
```

## Terminal Commands

These are commands limited to be executed in the terminal.

## Terminal Voice Controls

A control command consists of a message that the previous skill or skillset command parser uses to execute parameterized options, affecting the default command behavior.

## Terminal Voice Skills

Unlike terminal commands, terminal/voice commands can be typed in or said out loud to the voice recognizer.

## Terminal Voice Skillsets

Skillsets are commands grouped as a list of orders to be executed sequentially at once. They can be typed or said out loud.

# 10 Terminal Voice Controls

You can create extra controls if you want to, but you can do almost everything that is possible with the controls that come with Commbase. These out-of-the-box controls are:

> **[okay|ok] stop**

- Description: Stop the previous command.
- Steps:
  - END USER: Requests to do something using a terminal/voice command.
  - STT ENGINE: Writes the request in .previous_result_message.json and in .result_message.json.
  - SKILL FUNCTION: Executes the command.
  - END USER: Sends the control "okay stop".
  - STT ENGINE: Writes only in .result_message.json.
  - SKILL FUNCTION: Goes to the command in .previous_result_message.json, then goes to the case option "okay stop" in the parse_skill_ function, and then executes a command to terminate the previous terminal/voice command (program executable or script process).

Base code:

```shell
TODO:
```

> **[okay|ok] run it again**

- Description:  Re-run the previous command.
- Steps:
  - END USER: Requests to do something using a terminal/voice command.
  - STT ENGINE: Writes the request in .previous_result_message.json and in .result_message.json.
  - SKILL FUNCTION: Executes the command.
  - END USER: Sends the control "okay run it again".
  - STT ENGINE: Writes only in .result_message.json.
  - SKILL FUNCTION: Goes to the command in .previous_result_message.json, then goes to the case option "okay run it again" in the parse_skill_ function, and then executes a command that runs the same content of the case option *), the previous terminal/voice command.

Base code:

```shell
TODO:
```

> **[okay|ok] repeat**

- Description: Reproduce the previous discourse by speaking it.
- Limits: Do not use it to re-run previous terminal/voice commands.
- Steps:
  - END USER: Requests to do something using a terminal/voice command.
  - STT ENGINE: Writes the request in .previous_result_message.json and in .result_message.json.
  - SKILL FUNCTION: Goes to the command in .previous_result_message.json, then goes to any case option in the parse_skill_ function, and then executes a command that includes or consists of a discourse (question, answer, greeting, feedback, etc.). All and every discourse includes a programming code to save a copy of it in the **.current_discourse** file. The reason to save it to a file is that there are many case options for every terminal/voice command, and the next terminal/voice command will overwrite the option in .result_message.json with a new "okay repeat" control, making unavailable/unknown the previous control message for the whole program.
  - END USER: Sends the control "okay repeat", due to did not understand or did not hear well the discourse.
  - STT ENGINE: Writes only in .result_message.json.
  - SKILL FUNCTION: Goes to the command in .previous_result_message.json, then goes to the case option "okay repeat" in the parse_skill_ function, and then executes a command that repeats by voice the content of **.current_discourse**.

Base code:

```shell
TODO:
```

> **[okay|ok] remind me in [five|ten|twenty|thirty] minutes**

- Description: Start a question reminder countdown timer.
- Steps:
  - END USER: Requests to do something using a terminal/voice command.
  - STT ENGINE: Writes the request in .previous_result_message.json and in .result_message.json.
  - SKILL FUNCTION: Goes to the command in .previous_result_message.json, then goes to any case option in the parse_skill_ function, and then executes a code that includes a requirement of user intervention in the form of a question spoken and displayed on the screen.
  - END USER: Sends the control "okay remind me in five minutes".
  - STT ENGINE: Writes only in .result_message.json.
  - SKILL FUNCTION: Goes to the command in .previous_result_message.json, then goes to the case option "okay remind me in five minutes" in the parse_skill_ function. It executes a code to append the total of the sum of the current time + the minutes to delay the question, for example, 5, to the **.pending_tasks.csv** (in the field Timeout) file and the current request in .previous_result_message.json (in the field Task). Next, it executes a code that runs a countdown timer of 5 minutes. The script remains running in the background.
  - END USER: Is able to do whatever he/she wants or requires during the time specified in the terminal/voice control command.
  - SKILL FUNCTION: The countdown timer of the script running in the background reaches 0. 
    The assistant reminds the user that this task is pending, using a specific notification sound alert (stored in the variable `SOUND_A_PENDING_TASK_AWAITS_ATTENTION` in the configuration file **config/commbase.conf**).
  - END USER: At this point, the user can: 
  	a. Answer the question to run the task.
  	b. Accept or deny/cancel based on the dialog with "okay accept".
  	c. Ask for an out loud repetition with "okay repeat".
  	d. Stop (terminate) the related command with "okay stop".
  	e. Ask the assistant to remind in a new period of time with "okay remind me in 10 minutes"
  	f. Move forward onto the next task pending with "ok what is the next task". This can be done infinitely while there are tasks pending in the list loop.

Example 1:

Stage 1:

1. At 02:00:01 PM, the user requests to be notified when the disk space left is less than 40%.
Terminal/voice skill command: "tell me when the disk space left is less than forty percent"
2. At 02:05:01 PM, the user requests to be notified when the disk space left is less than 30%.
Terminal/voice skill command: "tell me when the disk space left is less than thirty percent"
3. At 02:10:01 PM, the user requests to be notified when the disk space left is less than 20%.
Terminal/voice skill command: "tell me when the disk space left is less than twenty percent"

After the third entry, the file **.pending_tasks.csv** looks like this:

```text
Timeout, Task
Tue 01 Aug 2023 02:00:01 PM CDT|"The amount of disk space available for the file system is less than forty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:05:01 PM CDT|"The amount of disk space available for the file system is less than thirty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:10:01 PM CDT|"The amount of disk space available for the file system is less than twenty percent. Do you want me to free some space?"
```

Stage 2:

1. At 02:15:01 PM, the amount of disk space available on the file system is less than forty percent.
The assistant asks the user to answer the question to run the task: " The amount of disk space available on the file system is less than forty percent. Do you want me to free some space?"
The user decides to ask the assistant to remind about the question in a period of time with "okay remind me in 30 minutes".
2. At 02:20:01 PM, the amount of disk space available on the file system is less than thirty percent.
The assistant asks the user to answer the question to run the task: "The amount of disk space available on the file system is less than thirty percent. Do you want me to free some space?"
The user decides to ask the assistant to remind about the question in a period of time with "okay remind me in 30 minutes".
3. At 02:25:01 PM, the amount of disk space available on the file system is less than twenty percent.
The assistant asks the user to answer the question to run the task: "The amount of disk space available on the file system is less than twenty percent. Do you want me to free some space?"
The user decides to ask the assistant to remind about the question in a period of time with "okay remind me in 30 minutes".

At this point, all the entries in the file **.pending_tasks.csv** have been updated to the date and time delays specified by the user, like this:

```text
Timeout, Task
Tue 01 Aug 2023 02:45:01 PM CDT|"The amount of disk space available for the file system is less than forty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:50:01 PM CDT|"The amount of disk space available for the file system is less than thirty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:55:01 PM CDT|"The amount of disk space available for the file system is less than twenty percent. Do you want me to free some space?"
```

Base code 1:

A Bash code similar to the next one can be used to append a new request as a Task to the file **.pending_tasks.csv**.

```shell
timeout="2:20 PM CST"; task='"call mom"'; echo "$timeout|$task" >> data/.pending_tasks.csv
```

Base code 2:

This is an example of a Bash code similar to the one that is used in every terminal/voice command's case option "okay remind me in five minutes" to calculate the total of the sum of the current time + the minutes to delay the question, before save the question as a task in **.pending_tasks.csv**

File **add_50_minutes.sh**:

```shell
#!/bin/env bash

# Given date
#given_date="Wed 02 Aug 2023 11:52:30 PM CDT"

# Assign the current date and time to the variable given_date
given_date=$(date "+%a %d %b %Y %I:%M:%S %p %Z")

# Convert the given date to epoch time
epoch_time=$(date -d "$given_date" +%s)

# Add 50 minutes (3000 seconds) to the epoch time
new_epoch_time=$((epoch_time + 3000))

# Convert the new epoch time back to the date format
new_date=$(date -d "@$new_epoch_time" "+%a %d %b %Y %I:%M:%S %p %Z")

echo "Given Date: $given_date"
echo "New Date: $new_date"
```

Make sure to give the file execution permissions:

```shell
chmod +x add_50_minutes.sh   
```

Then, run the script:

```shell
./add_50_minutes.sh
```

Adding 50 minutes to the given date would result in the following new date:

```log
Given Date: Wed 02 Aug 2023 11:52:30 PM CDT
New Date: Thu 03 Aug 2023 12:42:30 AM CDT
```

Base code 3:

You can add a Bash code like this to append the value of the variable that holds the New Date, then a pipe, then some Task text, to the file **data/.pending_tasks.csv**:

```shell
#!/bin/env bash

# Example variable value
new_date="Tue 01 Aug 2023 02:45:01 PM CDT"

# Example task
task_text="The amount of disk space available for the file system is less than forty percent. Do you want me to free some space?"

# Appending the variable value, pipe, and text to a file (e.g., myfile.txt)
echo "$new_date|$task_text" >> data/.pending_tasks.csv
```

To display the contents of the myfile.txt file in the terminal, you can use the cat command in Bash:

```shell
cat data/.pending_tasks.csv
```

> **[okay|ok] what is the next task**

- Description: Remind of a prior question put on hold in a queue.
- Steps:
  - END USER: Sends the control "okay what is the next task".
  - STT ENGINE: Writes the request in **data/.result_message.json**.
  - SKILL FUNCTION: It calculates the next pending task to present it to the user, as follows:
  	If there is not any task in **data/.pending_tasks.csv**, it reproduces a message to inform the user about that and breaks the control command.
    First, reorders the rows in a variable by Timeout in ascending Order. This arranges the date rows from the earliest to the latest date.
    Next, it rewrites the complete content of the file using the new order of tasks. 
    Next, it writes the terminal/voice command of the first data row in the file **.previous_result_message.json**.
    After that, the first data row is updated with the **latest** date and time in the complete task list including the laset second 1 second. The seconds are the deciders to prepare the task to go to the end of the list the next time the file **data/.pending_tasks.csv** is called and then reordered. It avoids having the same task as first in the list every time the user sends the control "okay what is the next task" more than one time to skip the current task presented without discarding it but leaving it to retake it later again.
    Finally, the task presented, still in the first data row, is executed as a terminal/voice command.  
  - END USER: Has two options at this point.
    a. It can repeat the terminal/voice control "okay what is the next task" to skip the current task without discarding it but leaving it for later again.
    b. It can answer the question (execute the terminal/voice command.) **IMPORTANT**: Executing a terminal/voice command always requires verifying the file **data/.pending_tasks.csv** in the case option *) of the parse_skill_: If the **first data row** of the tasks list corresponds to the current terminal/voice command (assigned from **.previous_result_message.json**), the complete line will be deleted from the file. If we do not delete it from the tasks list it will be found out by "okay what is the next task" again at some time and request to complete it again, which would be considered a bug.

Example 1:

Stage 1:

At some time, the file **.pending_tasks.csv** looks like this:

```text
Timeout, Task
Tue 01 Aug 2023 02:45:01 PM CDT|"The amount of disk space available for the file system is less than forty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:50:01 PM CDT|"The amount of disk space available for the file system is less than thirty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:55:01 PM CDT|"The amount of disk space available for the file system is less than twenty percent. Do you want me to free some space?"
```

Note that this is the last file used as example for the control "okay remind me in 5 minutes". So we have 3 pending tasks but did not receive any reminder from the assistant around 2:30 PM yet.

Stage 2:

a. At 02:30:01 PM, if the user decides to repeat the control "what is the next task", the first data row is updated with the latest date and time in the complete task list plus 1 second, so the file looks like this:

```text
Timeout, Task
Tue 01 Aug 2023 02:56:01 PM CDT|"The amount of disk space available for the file system is less than forty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:50:01 PM CDT|"The amount of disk space available for the file system is less than thirty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:55:01 PM CDT|"The amount of disk space available for the file system is less than twenty percent. Do you want me to free some space?"
```

b. At 02:30:01 PM, if the user decides to answer the question (execute the terminal/voice command), the **first data row** of the tasks list, which corresponds to the current terminal/voice command is deleted, so the file looks like this:

```text
Timeout, Task
Tue 01 Aug 2023 02:50:01 PM CDT|"The amount of disk space available for the file system is less than thirty percent. Do you want me to free some space?"
Tue 01 Aug 2023 02:55:01 PM CDT|"The amount of disk space available for the file system is less than twenty percent. Do you want me to free some space?"
```

In case b., we checked out the notifications before they occurred and resolved the task programmed to be reminded at 2:45 around 2:30.

Base code 1:

This script contains the functions required to make work this terminal/voice control command in the `SKILL FUNCTION` of every terminal/voice skill/skillset command. 

```shell
#!/bin/env bash

# Define the result message file
message=$(<.result_message.json)

# Define the previous result message file
previous_message=$(<.previous_result_message.json)

# Define the pending tasks file
tasks=$(<.pending_tasks.csv)

# Function to check if the file exists
check_file_existence() {
	# Checks if the variable is not empty
  if [ -z "$tasks" ]; then
    echo "Error: No tasks found in the variable."
    exit 1
  fi
}

# Function to validate the tasks header format
validate_tasks_header_format() {
	#local file="$1"

  # Get the header from the file variable if the variable is defined like this:
  # file=".pending_tasks.csv".
  #local header=$(head -n 1 "$file")

  # Get the header from the tasks variable
  local header=$(echo "$tasks" | head -n 1)
  
  # Check if the header contains the expected titles
  if [ "$header" != "Timeout|Task" ]; then
    echo "Error: The tasks data does not have the expected header."
    exit 1
  fi
}

# Ensures that the second line of the file tasks is not empty
detect_blank_second_line() {

  local second_line=$(echo "$tasks" | sed -n 2p)

  # Check if the second line is empty or contains more information
  if [ -z "$second_line" ]; then
    echo "Error: The second line is empty."
    exit 1
  fi
}

# Ensures that the second line of the file tasks matches the expected format
validate_second_line_format() {
  # Extract the complete second line from tasks
  second_line=$(echo "$tasks" | awk -F'|' 'NR==2')

  regex='^([A-Za-z]{3} [0-9]{2} [A-Za-z]{3} [0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2} (AM|PM) [A-Za-z]{3})\|.*$'

  if [[ $second_line =~ $regex ]]; then
      echo "OK" > /dev/null
  else
      echo "not OK"
  fi
}

# Reorders rows in the tasks file by Timeout in ascending order
reorder_rows_by_timeout_in_ascending_order() {
	# Sort tasks by Timeout in ascending order
	sorted_tasks=$(echo "$tasks" | tail -n +2 | sort -t'|' -k1,1)

	# Create a new tasks variable with the header and sorted tasks
	sorted_tasks_with_header=$(echo "$tasks" | head -n 1; echo "$sorted_tasks")

	# Save the sorted tasks back to .pending_tasks.csv
	echo "$sorted_tasks_with_header" > .pending_tasks.csv
}

# Extracts the second field from the second row (excluding the header) from the
# CSV file .pending_tasks and stores it in a variable.
extract_second_field_from_second_row() {
  second_field_second_row=$(echo "$tasks" | awk -F'|' 'NR==2 {print $2}')
  echo "$second_field_second_row"
}

# Extracts the first field from the second row (excluding the header) from the
# CSV .pending_tasks and stores it in a variable.
extract_first_field_from_second_row() {
  first_field_second_row=$(echo "$tasks" | awk -F'|' 'NR==2 {print $1}')
  echo "$first_field_second_row"
}

# Writes the first data row of the file data/.pending_tasks.csv in the file 
# data/.previous_result_message.json.
get_first_command_from_json() {
	# Get the data from the second row of the second field in the tasks file

	# Call the function and capture its return value in a variable
	data=$(extract_second_field_from_second_row)
	#echo $data

	# Create the JSON message and save it to the file
	# data/.previous_result_message.json
	json_message="{\"message\": $data}"
	
	# Write the json message in data/.previous_result_message.json
	echo "$json_message" > .previous_result_message.json
}

# Updates the Timeout value of the second row (first task) in the file named 
# .pending_tasks.csv with the current date and time.
update_task_to_current_date_time() {
	tasks=$(<.pending_tasks.csv)
	current_date=$(date +"%a %d %b %Y %I:%M:%S %p %Z")

	# Replace the second row's Timeout with the current date and time
	new_content=$(echo "$tasks" | awk 'BEGIN { FS="|"; OFS="|" } NR==2 { $1 = "'"$current_date"'"; print; next } 1')

	# Create a temporary file
	temp_file=".pending_tasks_temp.csv"

	echo "$new_content" > "$temp_file"

	# Overwrite the original file with the content of the temporary file
	mv "$temp_file" .pending_tasks.csv

	echo "Updated the second row's Timeout with the current date and time."
}

# Updates the first data row with the current date and time in the complete task
# list plus 1 minute.
advance_first_data_row_time() {
	# Extract the complete second line
	second_line=$(echo "$tasks" | awk -F'|' 'NR==2')

	# Extract Timeout and Task from the second line
	timeout=$(echo "$second_line" | cut -d'|' -f1)
	task=$(echo "$second_line" | cut -d'|' -f2)

	# Convert the given timeout to epoch time
	epoch_time=$(date -d "$timeout" +%s)

	# Add 1 minute (60 seconds) to the epoch time
	new_epoch_time=$((epoch_time + 60))

	# Convert the new epoch time back to the timeout format
	new_timeout=$(date -d "@$new_epoch_time" "+%a %d %b %Y %I:%M:%S %p %Z")

	# Update the second line with the new timeout
	updated_tasks=$(echo "$tasks" | sed "2s|$timeout|$new_timeout|")

	# Overwrite the original file with the updated content
	echo "$updated_tasks" > .pending_tasks.csv
}

# Reads the contents of the CSV file into a variable called tasks, processes the
# tasks to identify the task with the highest timeout, increments that timeout
# by one second, updates the task list with the new timeout, and then saves the
# updated task list back to the CSV file.
update_row_time() {
  # Check if the file name is provided as an argument, otherwise use a default
  # value.
  local tasks_file="${1:-.pending_tasks.csv}"
  
  # Define the pending tasks file
  #local tasks_file=".pending_tasks.csv"
  
  # Initialize a variable to store the highest timeout timestamp
  highest_timeout=""
  
  # Read each line of the tasks file, separating columns using "|" as delimiter
  while IFS="|" read -r timeout task; do
    # Check if the timeout matches the pattern for HH:MM:SS
    if [[ $timeout =~ [0-9]{2}:[0-9]{2}:[0-9]{2} ]]; then
      # Convert the timeout to a Unix timestamp
      timestamp=$(date -d "$timeout" +%s)
      # Update the highest_timeout if the current timestamp is greater
      if [[ -z $highest_timeout ]] || ((timestamp > highest_timeout)); then
        highest_timeout=$timestamp
      fi
    fi
  done <<< "$tasks"
  
  # Calculate a new timeout by adding 1 second to the highest timestamp
  new_timeout=$(date -d @"$((highest_timeout + 1))" +"%a %d %b %Y %I:%M:%S %p %Z")

  # Update the second line of the tasks file with the new timeout
  updated_tasks=$(echo "$tasks" | awk -v new_timeout="$new_timeout" -F"|" 'NR == 2 { $1 = new_timeout "|" } { print }')
  
  echo "$updated_tasks" > .pending_tasks_updated.csv
  
  #echo "$tasks"
  #cat .pending_tasks_updated.csv
  
  # Remove the space after the "|" character in each line of the file
  sed -i 's/| /|/' .pending_tasks_updated.csv
  
  mv .pending_tasks_updated.csv "$tasks_file"
}

# Main script
check_file_existence
validate_tasks_header_format

detect_blank_second_line
validate_second_line_format

reorder_rows_by_timeout_in_ascending_order
#extract_second_field_from_second_row
#extract_first_field_from_second_row
get_first_command_from_json
#update_task_to_current_date_time
#advance_first_data_row_time
update_row_time

```

Base code 2:

The next code corresponds to the section `END USER:`, option `b.`. The user answers the question (execute the terminal/voice command.). If the **first data row** of the tasks list corresponds to the current terminal/voice command (assigned from **.previous_result_message.json**), the complete line will be deleted from the file.

```shell

downloads/tmp/verifications.sh code here

```



> **[okay|ok] accept**

> **[okay|ok] deny**

- Description: Accept a Y/N question, or Deny/Cancel a Y/N question.
- Steps:
  - The user requests to do something.
    The program writes in .previous_result_message.json and in .result_message.json.
    Example: "Tell me when I receive an email from Paul."
  - The assistant proceeds to find a solution. This occurs inside the parser, case option "*)". A loop or an async function verifies the email every x minutes, looking for Paul's email.
    The user is allowed to interact with the assistant while the program awaits in the background/behind the scenes.
  - When the new Paul's email arrives, the assistant proposes a solution for the request. The same parser exits the loop or async function and asks the user looking forward to receiving a new accept or deny command.
    In case the user or the assistant voice talks over this response causing the user to get confused about what it hears, it is able to use the control ok reapeat to repeat the solution proposal once more. If the control ok repeat is selected, the program skips the code to write in .previous_result_message.json and in .result_message.json, and just re-executes the bash script 'skill'.
    Example: "You have received an email from Paul. Do you want me to read it out loud to you?" (The written part could include the possible case options: ok accept, ok, deny, ok repeat, ok remind me in five, thirty, or sixty minutes, ok skip that question, etc.)
  - The user has one opportunity to ACCEPT or DENY the solution.
    The user answer is stored only in the .result_message.json
	 	Example: "Ok accept / Ok deny."

Base code:

```shell
TODO:
```

> **[okay|ok] confirm with the code <four number code>**

- Description: Confirm a confirmation request.
- Steps:
  - Certain commands can be made with an additional option to ask for user confirmation when Accepts, for security reasons. In such cases, the assistant asks for confirmation. The program goes to the case option ok confirm of the same terminal/voice command. This is done using a code but can be any other or a combination of some biometric methods, for example face recognition.
  Example: "Confirm using your confirmation code."
  - The user has one opportunity to Confirm or deny.
  If the confirmation code (in secrets file) is wrong, repeat the confirmation request case option until the code is right or the user denies/cancels the solution.
  The user answer is stored only in the .result_message.json.
  Example: "ok confirm with the code 12345" / "12345"
  Example: "ok deny."

Base code:

```shell
TODO:
```

> **[okay|ok] select the option number [one|two|three|four]**

- Description: Select a multi-choice question option.
- Steps:
  - The user requests to do something.
  The program writes in .previous_result_message.json and in .result_message.json.
  Example: "Tell me when I receive an email from Paul."
  - The assistant proceeds to find a solution. This occurs inside the parser, case option "*)". A loop or an async function verifies the email every x minutes, looking for Paul's email.
  - The user is allowed to interact with the assistant while the program awaits in the background/behind the scenes.
  - When the new Paul's email arrives, the assistant proposes a number of solutions for the request. The same parser exits the loop or async function and asks the user looking forward to receiving a new command based on the chosen option.
  In case the user or the assistant voice talks over this response causing the user to get confused about what it hears, it is able to use the control ok reapeat to repeat the solution proposal once more. If the control ok repeat is selected, the program skips the code to write in .previous_result_message.json and in .result_message.json, and just re-executes the bash script 'skill'.
  Example: "You have received an email from Paul. Please select an option: 1. Open it on the screen. 2. Read it out loud. 3. Remind me about that in 5 minutes. 4. Forget about that / Skip that question.
  - The user choses an option.
  The user answer is stored only in the .result_message.json.
  Inside the same question parser, case option "select the option number <number>" the option chosen is executed.

Base code:

```shell
TODO:
```

> **[okay|ok] what mode are you in**

- Description: Confirm the current mode.
- Steps:
  - TODO:

Base code:

```shell
TODO:
```

> **[okay|ok] enter the normal mode**
- Description: Enter the normal mode.
- Steps:
  - TODO:

Base code:

```shell
TODO:
```

> **[okay|ok] enter the conversation mode**
- Description: Enter the conversation mode.
- Steps:
  - TODO:

Base code:

```shell
TODO:
```
             
> **[okay|ok] enter the expert mode**
- Description: Enter the expert mode.
- Steps:
  - TODO:

Base code:

```shell
TODO:
```

> **[okay|ok] enter the follow mode**
- Description: Enter the follow mode.
- Steps:
  - TODO:

Base code:

```shell
TODO:
```

## Undefined Controls

Undefined controls are controls (out-of-the-box controls or controls added to the out-of-the-box controls list) that are unuseful for particular terminal/voice commands.

When a control is undefined in the parse_skill_ function of a terminal/voice skill/skillset command, its content consists of a message that says that the control is undefined followed by a list of every undefined control for that specific command. For example, say "power off the computer" can or cannot be repeated, depending on the command logic design.

It is recommended not to create undefined controls as possible due to it adds complexity to the command since the user could need to remember the lack of the undefined control and memorize that specific command feature to avoid falling into the delay of commanding an undefined control.

Anyway, feel free to create commands to ask for command hints, including about undefined controls. For example, say "what are the undefined controls for the command "power off the computer".

## Hidden Controls and Control Chaining

Undefined controls are not synonymous with hidden controls.

**Hidden controls** are controls that are not listed with the --help argument of the command commbase nor in this document, and they are not in all and every terminal/voice command in its parse_skill_ function. They just reside in the parse_skill_ functions of commands that require triggering special options that are not covered by the **non hidden**, aka **visible** terminal/voice control commands. Those special options can also be used to **chain** other special options or options in interactive sequences, for example, in terminal/voice commands that require to say and display a final result based on sub-results calculated in every special option, which is impossible by creating a new skillset terminal voice/command, because the specified individual skills do not save or cache sub-results.

In the following example, which is a segment of a simple short quiz implemented as a terminal/voice command, both hidden controls and chained controls are utilized. The case options 'select the option number one|two|three|four' represent visible controls. On the other hand, the case options 'question 1|2|3|4' correspond to hidden controls. The *) symbolizes the default case option, which is executed during the initial run of the command.


		case $control_signal_str in

			'STOP!')
				echo -e "\e[1;41mCOMMBASE:\e[1;m The previous command can not be stoppeddd!"
				echo "the previous command cannot be stopped" | festival --tts 
				echo "success" > .matching_skill.dat
				return 1;
				;;
			*)
				echo "success" > /dev/null;
				echo "success" > .matching_skill.dat
				;;
		esac


File .question_answers.csv:

Question|Answer
"question 1"|4
"question 2"|2
"question 3"|1

```plaintext
CASE control IN:

	'select the option number 1'):
		IF the Answer for the question 1 is NOT IN the file .question_answers.csv.
			Write the option number 1 in the question 1 of the file.
		IF the Answer for the question 1 is IN the file .question_answers.csv.
			Save the hidden control 'question 2' to .result_message.json.
			Re-run the same terminal/voice command without waiting for a new user command.
		IF the Answer for the question 1 is IN the file .question_answers.csv.

		IF the Answer for the question 1 is IN the file .question_answers.csv.
		
		IF the Answer for the question 1 is IN the file .question_answers.csv.

	'select the option number 2'):
		more code here

	'select the option number 3'):
		more code here
		
	'select the option number 4'):
		more code here

	'question 2'):
		IF the question 1 is IN the file .question_answers.csv.
			Ask the question 2.
			Append the option selected to the file .question_answers.csv.
			Save the hidden control 'question 2' to .result_message.json.
			Re-run the same terminal/voice command.
		ELSE
			Re-run the same terminal/voice command.

	'question 3'):
		IF the question 2 is IN the file .question_answers.csv.
			Ask the question 3.
			Append the option selected to the file .question_answers.csv.
			Save the hidden control "result 1" to the file .result_message.json.
			Re-run the same terminal/voice command.
		ELSE
			Re-run the same terminal/voice command.

	'result 1'):
		IF the questions 1-3 are IN the file .question_answers.csv.
			Calculate the result.
			Say and display the result.
				IF the result is correct
					Say that the result is correct.
				ELSE
					Say that the result is incorrect.
			Delete the content of the file .question_answers.csv.

	*):
		IF the Answer for the question 1 is NOT IN the file .question_answers.csv.
			Ask the question 1.
			Re-run the same terminal/voice command without waiting for a new user command.
		ELSE IF the Answer for the question 2 is NOT IN the file .question_answers.csv.
			Ask the question 2.
			Re-run the same terminal/voice command without waiting for a new user command.
		ELSE the Answer for the question 4 is NOT IN the file .question_answers.csv.
			Ask the question 3.
			Re-run the same terminal/voice command without waiting for a new user command.

```

Example of a complete file question_answers.csv:

```text
Question, Answer
result of two plus two, 4 
result of two minus one, 1
result of two divided by one, 2
```

Example of possible calculations to resolve in the case option result 1:
- The number of questions asnwered correctly (1, 2 or 3 out of 3, for an interactive sequence/questionnaire/test/exam of 3 questions.
- The sum of all the results of all the questions (correct result = 7)

Example of the terminal/voice command for the interactive sequence:

> Start the math test number one zero one

# 11 Terminal Voice Skills

## Skills unique for the command Line

```shell
commbase start|teleport
commbase server
commbase client
commbase stop
commbase {TYPOS}
```

## Built-in skills

`"disconnect yourself"`.

`"list your command history"`.

`"reload recognition"` / `"reload speech recognition"` / `"reload your speech recognition"` / `"reload your recognition"`.

`"stop capturing sound"` / `"stop listening"`.

`"tell me about yourself"` / `"introduce yourself"`.

`"wake up"` / `"wake-up"`.

TODO: Paste the content in the existent parsers in bundles/libcommbase/libcommbase/skills/parsers/

TODO: Make built-in skills (parsers for the next runner in bundles/libcommbase/libcommbase/skills/runners/):
capture_mute.sh  capture_unmute.sh  toggle_active_capture_device.sh  toggle_capture_on-off.sh

`{WRONG VOICE COMMANDS}`.

# 12 Create new skills basics

## Verbosity Levels Proposal

### Show VS Tell and so on

Commands beginning with "Show me" can be used to show a result.

Commands beginning with "Tell me" can be used to hear the assistant telling us something not too long as a response.

Commands beginning with "Tell me more (about that)"  can be used to hear the assistant telling us a longer explanation about something.

Commands can be made with alternatives to WH question, i.e:

> "show me the time" (Shows a clock app on screen)

> "tell me the time"  (Just tells us the time using the voice)

> "what time is it"   (Shows a clock and tells the time using the voice)


## Hints on saying and creating voice commands

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

## How to structure a command

This [`document`](./Request-Response API Documentation.md) contains the information on how to structure a command.


## Bake a command

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

```shell
'stop')
  echo "Stopping application"
  tmux kill-session -t Commbase-0
  ;;

```

This command is going to help cleaning up the 'commbase' file before pasting a new versions that
includes the a new command:

```shell
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

This file, in  the directory config/, was created during the Commbase installation,
as is described in the document INSTALL.

Commbase uses this file to store the list of skill-scripts' logins, usernames with passwords,
and APIs credentials.

Some custom commands could run a local or remote command using another user rather than yours, or
even your system's root from a remote server machine. Those commands and other commands that you
could create containing passwords, passphrases, private keys and other secrets are better kept typed
in an external list and managed carefully as a part of the security policy for your systems.

Within this file you can even create constants for allowing Commbase to connect through networks,
using sign ins and technologies such as Secure Shell (SSH).

Note: If you want to generate new uuid for any purpose, for example, create one unique id for every
device in your Commbase device network, you can use uuid-runtime:
$ uuidgen

Occasionally, more commands will be merged in the official Commbase source repository. Don't forget
to backup your customized Commbase files before download a new version and upgrade your Commbase
or you will loose your customizations because none of them is in the official source repo.

To propose a new command for the Commbase repository, checkout the information on how to contribute
to the project in the document README.md.

## The Commbase app directory

Commbase uses an environment constant $COMMBASE_APP_DIR set up for the user environment/session. Such as in many Linux distributions, this type of constants can be exported in $HOME/.bashrc, $HOME/.zshrc or any other custom shell rc configuration file.

Example of the custom lines added to a bashrc file:

```shell
# The Commbase App directory for the Bash shell
export COMMBASE_APP_DIR="/home/commbase/commbase"

```

Example of use of the constant:

```bash
tmux send-keys "bash $COMMBASE_APP_DIR/commbase/core/<PATH/TO/SCRIPT/FILE/script.sh> &"
```

The constant can be used in any custom script file inside the Commbase root directory and its subdirectories.

Example in a script header:

```bash
# The configuration file.
source $COMMBASE_APP_DIR/commbase/config/secrets
source $COMMBASE_APP_DIR/commbase/config/app.conf
source $COMMBASE_APP_DIR/commbase/config/commbase.conf
```

Example of use of the constant in the same bash script:

```shell
mpv $COMMBASE_APP_DIR/commbase/bundled/audiobooks/Robinson-Crusoe/crusoe_anew_02_baldwin_64kb.mp3
```

## The Commbase processing file

The Commbase execution script file 'commbase' and also the speech recognition script file 
'commbase-speech-recognition-vosk.py' contain the variable COMMBASE_PROCESS_VOSK, which must be 
changed to point to any specified default or custom version of the file commbase-process-vosk.sh,
which processes voice commands and scripts that run tasks we use and are able to program for Commbase
to run them.

```shell

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

# 13 Training Commbase by Assembling Skillsets

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

```shell
$ commbase teleport
```

```shell
$ commbase stop
$ commbase start
```

`"disconnect yourself"`, `$ commbase sta wrt`

- State learning commands: 

Commonly, every command function writes logs to history before ending itself. The function can be done or updated to verify the command execution, but it is not recommended to create voice command for critical tasks that potentially could lead someone, include Commbase himself/herself, to safety concerns or total disasters.

For example:

```shell
# Lots of lines here
echo "connect me to the development server" >> history/.app_history

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
