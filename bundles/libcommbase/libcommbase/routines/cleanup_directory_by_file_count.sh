#!/usr/bin/env bash
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

# cleanup_directory_by_file_count.sh
# Cleans up a directory based on the number of files it contains. Provides a
# mechanism to maintain a specified file count threshold in a directory by
# removing excess files, prioritizing deletion based on the creation time of
# files.
cleanup_directory_by_file_count() {
  # Check if the directory exists
  if [ ! -d "$directory" ]; then
    echo "Directory $directory does not exist."
    exit 1
  fi

  # Delete files when the number of files exceeds the threshold
  file_count=$(find "$directory" -maxdepth 1 -type f ! -name ".gitkeep" | wc -l)
  if [ "$file_count" -gt "$file_count_threshold" ]; then
    excess_files=$((file_count - file_count_threshold))
    echo "Deleting $excess_files oldest files..."

    # Use stat to get creation time and sort files by creation time
    find "$directory" -maxdepth 1 -type f ! -name ".gitkeep" -exec stat -c "%W %n" {} + | sort -n | head -n "$excess_files" | cut -d ' ' -f 2- | xargs rm
  fi

  echo "Cleanup based on file count completed."

  exit 99
}

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <file_count_threshold> <directory>"
  exit 1
fi

# Assign parameters to variables
file_count_threshold=$1  # Expected to be integer by arithmetic operations
directory="$2"

# Call the function
(cleanup_directory_by_file_count "$1" "$2")

exit 99
