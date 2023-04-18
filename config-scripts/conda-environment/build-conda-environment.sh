#!/bin/env bash
# Removes any existent environment called commbase_env, recreates it and 
# installsits packages using the file commbase_env.yml.
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
	conda env create -f "$COMMBASE_ROOT_DIR/commbase/config-scripts/conda-environment/$CONDA_ENV_FILENAME"

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

