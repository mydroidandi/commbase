#!/usr/bin/env bash
################################################################################
#                                   Commbase                                   #
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

# capture_unmute.sh
# A key binding, or an association between a physical key on a keyboard and a parameter
# to unmute the sound capture.

# Set up this file using your favorite Desktop Environment or Window Manager key binding
# configuration.
# For example, in Cinnamon, a Gnome based Desktop Environment, the keybinding steps are:
# Go to Menu -> System Settings -> Keyboard -> shortcuts -> Categories -> Sound and Media ->
# Add custom shortcut. 
# Next, give the new shortcut a new name like "capture un-mute".
# Next, select the route to this file.
# Next, click or tap on the button Add the keyboard shortcut. The shortcut appears in the list.
# Next, click on unassigned to pick an accelerator.
# Next, press the keys ALT + SHIFT + 3 (all together) and then release them at a time.
# Then the new key binding appears on the list.
# Finally, verify that the key binding works.

# Starts capturing sound that the Commbase recognition requires to work.
# Uses the keyboard binding ALT-SHIFT-3.
capture_unmute() {
  (amixer set Capture cap &>/dev/null || exit 99);
}

capture_unmute || exit 99;

exit 99
