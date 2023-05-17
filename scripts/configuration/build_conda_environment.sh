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

# build_conda_environment.sh
# Removes any existent environment called commbase_env, recreates it and 
# installs its packages using the file commbase_env.yml.
# If the environment you want to remove is the current environment, deactive
# the environment before running the script like this:
# $ conda deactivate $CONDA_ENV_NAME

# Recreates conda environment
recreate_conda_env(){

	# Environment
	CONDA_ENV_NAME="commbase_env"
	CONDA_ENV_FILENAME="commbase_env.yaml"

	# Remove an existent environment
	conda remove -n $CONDA_ENV_NAME --all

	# Recreate a new environment commbase_env
	conda env create -f "$COMMBASE_APP_DIR/$CONDA_ENV_FILENAME"

	# List the environment
	conda info --envs

	# Activate the environment
	#conda activate commbase_env

	# List environment packages (requires previous enviroment activation)
	#conda list

	# Update Conda Environments Using a YAML File
	# Running this command will update your current environment to include the most
	# current versions of the packages listed in that environment file.
	#conda activate $CONDA_ENVIRONMENT
	#conda env update -f $CONDA_ENVIRONMENT_FILENAME

	exit 99

}

recreate_conda_env || exit 99;

exit 99

