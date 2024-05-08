#!usr//bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
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

# toggle_default_capture_device.sh
# This script serves as a key binding handler, associating a physical key on a
# keyboard (Ctrl-Shift-z) with the functionality to toggle and default the
# capture device between two specified devices. The selection process is based
# on the default state of the devices and is designed for a group of maximum two
# devices.

# Toggles and defaults the current default capture device to another device in a
# group of two. The default Commbase keyboard binding for this to work is
# Ctrl-Shift-z.
toggle_default_capture_device() {
  TODO: This skill should make use of the libcommbase routine toggle_default_capture_device.sh
}

toggle_default_capture_device || exit 99;

exit 99
