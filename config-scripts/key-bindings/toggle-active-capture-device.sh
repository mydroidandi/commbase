#!/bin/env bash
# toggle-active-capture-device.sh
# A key binding, or an association between a physical key on a keyboard and a parameter
# to toggle and activate the current active and default capture device to another device
# in a group of two devices, turning it active and default.

# To prepare a dedicated sound capture device for Commbase:
# Commbase does not require to work with the default device, but with an active device.
# In Linux desktops, the default configuration always has a single active capture device
# despite the number of devices installed on the operating system.
# The number of active devices can increase by routing separate sound devices to a common
# virtual sound bus, thanks to the linux package Jack, that is able to replace and also
# interact with PulseAudio, the sound server system for POSIX OSes, including Linux,
# nowadays. However, that enhancement requires to install professional audio packages or
# studios on the operating system.
# The easiest way to be able to use Commbase without requiring to route multiple sound
# capture devices to a common virtual bus is to set up Commbase to make it work with a
# dedicated device that can be selected as the only active input when Commbase is required
# to talk or receive orders.
# Configuration of a dedicated capture device for Commbase with PulseAudio:
# 1. Identify the internal sound card in the computer: 
# $ pacmd list-sinks | more
# Verify that there an index for the devices you want to use as Commbase capture and as
# alternative capture. Example of the output: 
# 1 sink(s) available.
#   * index: 0
#	        name: <alsa_output.pci-0000_00_1b.0.analog-stereo>
# [...]
# 2. Filter the name of the sound devices to identify the capture device that will be used
# as the dedicated Commbase capture device:
# $ pacmd list-sources | grep name
# For example, this output shows a webcam of the brand Logitech and an Intel internal
# soundcard with capture device:
#	name: <alsa_input.usb-_Webcam_C170-02.mono-fallback>
#		alsa.name = "USB Audio"
#		alsa.subdevice_name = "subdevice #0"
#		alsa.card_name = "Webcam C170"
#		alsa.long_card_name = "Webcam C170 at usb-0000:00:1a.0-1.2, high speed"
#		alsa.driver_name = "snd_usb_audio"
#		device.vendor.name = "Logitech, Inc."
#		device.product.name = "Webcam C170"
#		device.profile.name = "mono-fallback"
#		device.icon_name = "camera-web-usb"
#	name: <alsa_output.pci-0000_00_1b.0.analog-stereo.monitor>
#		alsa.card_name = "HDA Intel PCH"
#		alsa.long_card_name = "HDA Intel PCH at 0xf7e30000 irq 32"
#		alsa.driver_name = "snd_hda_intel"
#		device.vendor.name = "Intel Corporation"
#		device.product.name = "7 Series/C216 Chipset Family High Definition Audio Controller"
#		device.icon_name = "audio-card-pci"
# [...]
# 3. Test that switching to and activating the chosen dedicated Commbase cature device
# just works. Open the GUI of pavucontrol, or, for example, in Cinnamon go to System
# Settings > Sound. That will help to identify the active capture device every time the
# testing command is run:
# $ pacmd set-default-source "alsa_input.usb-_Webcam_C170-02.mono-fallback"
# $ pacmd set-default-source "alsa_output.pci-0000_00_1b.0.analog-stereo.monitor"
# $ pacmd set-default-source "alsa_input.pci-0000_00_1b.0.analog-stereo"
# 4. Use two names of capture devices returned as the Commbase and and the alternative
# captures. The seleted capture devices must be updated in the correspondent local host
# envronment variables stored in the file ENV/.env. This is an example of the customized
# variables:
# COMMBASE_CAPTURE_DEVICE_NAME="alsa_input.usb-_Webcam_C170-02.mono-fallback"
# ALTERNATIVE_CAPTURE_DEVICE_NAME="alsa_input.pci-0000_00_1b.0.analog-stereo"
# Note that those vaariables are used in this toogle keybinding script.
# The seleted devices are added manually, due to their names change from device to device
# in the market, and also depending on the order they were attached to the computer and/or
# when they were activated/recognized on/by the OS.
# Everybody is allowed to create additional keybinding scripts to suit other needs like
# to have multi-switch keyboard shorcuts rather than a simple toogle switch like this.
# Alternatively, use the GUIs pavucontrol or Sound to switch from/to the Commbase capture
# device with the help of the mouse.

# Set up this file using your favorite Desktop Environment or Window Manager key binding
# configuration.
# For example, in Cinnamon, a Gnome based Desktop Environment, the keybinding steps are:
# Go to Menu -> System Settings -> Keyboard -> shortcuts -> Categories -> Sound and Media ->
# Add custom shortcut. 
# Next, give the new shortcut a new name like "toogle active capture device".
# Next, select the route to this file.
# Next, click or tap on the button Add the keyboard shortcut. The shortcut appears in the list.
# Next, click on unassigned to pick an accelerator.
# Next, press the keys CTRL + SHIFT + Z (all together) and then release them at a time.
# Then the new key binding appears on the list.
# Finally, verify that the key binding works.

# The root Commbase directory is set as environment variable in ~/.bashrc and/or
# ~/.zshrc.
source $COMMBASE/commbase/ENV/.env

# Toggle and activate the current active and default capture device to another device in
# a group of two devices, turning it active and default.
# Uses the keyboard binding CTRL-SHIFT-Z.
toggle_active_capture_device () {
  active_device=$(pactl list sources short | grep RUNNING || exit 99);

  if (echo $active_device | grep -q $COMMBASE_CAPTURE_DEVICE_NAME || exit 99); then
    (pacmd set-default-source "$ALTERNATIVE_CAPTURE_DEVICE_NAME" || exit 99);
  else
    (pacmd set-default-source "$COMMBASE_CAPTURE_DEVICE_NAME" || exit 99);
  fi
}

# Turn capture on whether it is off.
turn_capture_on () {
# Assume that the capture is mono, no matter the number of channels, which is correct
  # for registering the human voice.
  amixer_status=$(amixer get Capture | awk -F "[, ]+" '/on|off^/{print $NF ":", $1, $(NF-1)}' | tail -n+3) || exit 99;

  if (echo $amixer_status | grep -q 'off' || exit 99); then
    # Start capturing sound that the Commbase recognition requires to work.
    # Uses the keyboard binding ALT-SHIFT-3.
    (amixer set Capture cap &>/dev/null || exit 99);
  fi
}

toggle_active_capture_device || exit 99;
turn_capture_on || exit 99;

exit 99

