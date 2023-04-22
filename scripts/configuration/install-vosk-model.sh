#!/bin/env bash
# Downloads and install the Vosk model for Commbase to work.

# Downloads the model zip
download_vosk_model() {

	cd $COMMBASE_ROOT_DIR/commbase/bundled/broker/vosk
	wget https://alphacephei.com/vosk/models/vosk-model-en-us-0.22-lgraph.zip
}

# Extracts the model zip
extract_vosk_model() {
	unzip vosk-model-en-us-0.22-lgraph.zip
}

# Renames the model directory
rename_vosk_model() {
	mv vosk-model-en-us-0.22-lgraph model
}

# Sets up the model directory permissions
set_up_model_permissions() {
	chmod 755 model
}

# Deletes the zip file
delete_zip_file() {
	rm -rf vosk-model-en-us-0.22-lgraph.zip
}

# Installs Voks model
install_vosk_model() {

	download_vosk_model || exit 99;
	extract_vosk_model || exit 99;
	rename_vosk_model || exit 99;
	set_up_model_permissions || exit 99;
	delete_zip_file || exit 99;

exit 99

}

# Main call
install_vosk_model || exit 99;

exit 99

