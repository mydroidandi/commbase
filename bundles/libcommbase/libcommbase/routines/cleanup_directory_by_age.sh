#!/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 03/27/2024  Esteban Herrera Original code.                                   #
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

# cleanup_directory_by_age.sh
# Cleans up files within a directory based on their age, offering flexibility
# through command line arguments for specifying the threshold in days and the
# directory to clean up.
cleanup_directory_by_age() {
  # Check if the directory exists
  if [ ! -d "$directory" ]; then
    echo "Directory $directory does not exist."
    exit 1
  fi

  # Delete files older than x days
  find "$directory" -type f ! -name ".gitkeep" -mtime +"$days_threshold" -delete

  echo "Cleanup based on file age completed."

  exit 99
}

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <days_threshold> <directory>"
  exit 1
fi

# Global declarations
days_threshold="$1"
directory="$2"

# Call the function
(cleanup_directory_by_age "$1" "$2")

exit 99
