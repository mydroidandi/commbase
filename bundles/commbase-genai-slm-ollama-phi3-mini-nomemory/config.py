#!/usr/bin/env python
################################################################################
#                     commbase-slm-ollama-phi3-mini-nomemory                   #
#                                                                              #
# A simple generative AI assistant using the Phi3 Small Language Model (SLM).  #
#                                                                              #
# Change History                                                               #
# 06/18/2024  Esteban Herrera Original code.                                   #
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

# config.py
# This files makes a variable available throughout the entire Python
# application, including all modules, submodules, and functions.

# Requirements
import os

# The path to the .env configuration file
CONFIG_FILE_DIR = os.environ["COMMBASE_APP_DIR"]
CONFIG_FILE_PATH = os.path.join(CONFIG_FILE_DIR, "config/commbase.conf")
