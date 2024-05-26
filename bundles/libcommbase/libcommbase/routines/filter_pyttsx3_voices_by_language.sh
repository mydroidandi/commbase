#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 03/06/2024  Esteban Herrera Original code.                                   #
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

# filter_pyttsx3_voices_by_language.sh
# Output the details of voices where the name contains the language given as a
# parameter, including: ID, Name, Languages, Gender, Age, and Index.
# Requires Commbase up and running
filter_pyttsx3_voices_by_language() {
  # Imports
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  local language="$1"

  # Filter the voice results by language
  commbase --list-pyttsx3-voices | grep -A5 "Name:.*$language" | awk '/ID:/ {print "ID:", $3} /Name:/ {print "Name:", $3} /Languages:/ {print "Languages:", $3} /Gender:/ {print "Gender:", $3} /Age:/ {print "Age:", $3} /Index:/ {print "Index:", $3; print "---"}' | less

  exit 99
}

# Check if a filter_pyttsx3_voices_by_language is provided as a command-line
# argument.
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <language>"
  exit 1
fi

# Call the function with the provided store_log_copy
(filter_pyttsx3_voices_by_language "$1")

exit 99
