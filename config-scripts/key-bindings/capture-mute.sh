#!/bin/bash
# File: capture-mute
# Description: A key binding, or an association between a physical key on a keyboard and a parameter
# to mute the sound capture.

# Set up this file using your favorite Desktop Environment or Window Manager key binding
# configuration.
# For example, in Cinnamon, a Gnome based Desktop Environment, the keybinding steps are:
# Go to Menu -> System Settings -> Keyboard -> shortcuts -> Categories -> Sound and Media ->
# Add custom shortcut. 
# Next, give the new shortcut a new name like "capture mute".
# Next, select the route to this file.
# Next, click or tap on the button Add the keyboard shortcut. The shortcut appears in the list.
# Next, click on unassigned to pick an accelerator.
# Next, press the keys CTRL + SHIFT + z (all together) and then release them at a time.
# Then the new key binding appears on the list.
# Finally, verify that the key binding works.

# Stop capturing sound that alters Commbase recognition.
# Uses the keyboard binding CTRL-SHIFT-z
(amixer set Capture nocap &>/dev/null)
