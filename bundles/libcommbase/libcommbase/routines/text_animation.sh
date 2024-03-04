#!usr//bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 02/13/2024  Esteban Herrera Original code.                                   #
#                           Add new history entries as needed.                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (c) 2023-present Esteban Herrera C.                               #
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

# text_animation.sh
# Creates a simple text animation on the terminal.
# Usage:
# animation <"text"> <delay>

animate_text() {
  local text="$1"
  local delay="$2"

  while true; do
    clear
    for ((i = 0; i < ${#text}; i++)); do
      echo -n "${text:$i:1}"
      sleep "$delay"
    done
    clear
    echo
  done
}

# Check if both text and delay are provided as arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <text> <delay>"
  exit 1
fi

text="$1"
delay="$2"

animate_text "$text" "$delay"
