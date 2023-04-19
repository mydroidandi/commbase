#!/bin/env bash
# toggle-capture-on-off.sh
# A key binding, or an association between a physical key on a keyboard and a parameter
# to toggle ON/OFF the sound capture.

# Set up this file using your favorite Desktop Environment or Window Manager key binding
# configuration.
# For example, in Cinnamon, a Gnome based Desktop Environment, the keybinding steps are:
# Go to Menu -> System Settings -> Keyboard -> shortcuts -> Categories -> Sound and Media ->
# Add custom shortcut. 
# Next, give the new shortcut a new name like "toggle capture ON or OFF".
# Next, select the route to this file.
# Next, click or tap on the button Add the keyboard shortcut. The shortcut appears in the list.
# Next, click on unassigned to pick an accelerator.
# Next, press the keys ALT + SHIFT + 1 (all together) and then release them at a time.
# Then the new key binding appears on the list.
# Finally, verify that the key binding works.

# Toggles ON/OFF the sound capture.
# Uses the keyboard binding ALT + SHIFT + 1.
toggle_capture_on_off() {
  # Assume that the capture is mono, no matter the number of channels, which is correct
  # for registering the human voice.
  amixer_status=$(amixer get Capture | awk -F "[, ]+" '/on|off^/{print $NF ":", $1, $(NF-1)}' | tail -n+3 || exit 99);

  if (echo $amixer_status | grep -q 'off' || exit 99); then
    # Start capturing sound that the Commbase recognition requires to work.
    # Uses the keyboard binding ALT-SHIFT-3.
    (amixer set Capture cap &>/dev/null || exit 99);
  elif (echo $amixer_status | grep -q 'on' || exit 99); then
    # Stop capturing sound that alters Commbase recognition.
    # Uses the keyboard binding ALT-SHIFT-2.
    (amixer set Capture nocap &>/dev/null || exit 99);
  else
    (echo "I perceive an issue with the sound capture" | festival --tts || exit 99);
  fi
}

toggle_capture_on_off || exit 99;

exit 99

