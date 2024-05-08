#!/usr/bin/env python
################################################################################
#                            commbase-data-exchange                            #
#                                                                              #
# Server for exchanging data with clients over HTTP and WebSocket connections  #
#                                                                              #
# Change History                                                               #
# 01/17/2024  Esteban Herrera Original code.                                   #
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

# functions.py
# This file contains a collection of utility functions for various tasks. It
# provides a set of commonly used functions related to data manipulation, file
# handling, and mathematical operations.

# Requirements
import os
import subprocess
from config import CONFIG_FILE_DIR


def discourse_data_exchange_server_error():
    # Construct the path to the Bash script
    bash_script = os.path.join(CONFIG_FILE_DIR, "bundles/libcommbase/libcommbase/routines/discourse_data_exchange_server_error.sh")

    try:
        # Construct the tmux command as a list of arguments
        tmux_command = [
            "bash", bash_script
        ]

        # Run the tmux command
        subprocess.run(tmux_command)

        return "Script executed successfully."
    except subprocess.CalledProcessError as e:
        return f"Error executing script: {e}"
