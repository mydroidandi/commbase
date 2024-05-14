#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 05/12/2024  Esteban Herrera Original code.                                   #
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

# terminal_only_set_language.sh
# Sets up the Commbase language and the Commbase app language
terminal_only_set_language() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Imports from libcommbase
  restart_stt_engine_no_recorder=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/restart_stt_engine_no_recorder.sh

  # Display the system locale info
  echo "Current system locale information:"
  locale

  # Display the value of the variable
  echo ""
  echo "The current app language code is:" "$COMMBASE_LANG"

  # Display the languages available
  echo ""
  echo "The language codes available are:"
  #find "$COMMBASE_APP_DIR"/i18n -type f -name "*.json" | xargs -I {} echo {}
  find "$COMMBASE_APP_DIR"/i18n/discourses -type f -name "*.json" -exec basename {} .json \;  # Uses basename to exclude path and extension

  # Prompt user to enter the code to change the language, and repeat the prompt
  # until a non-empty input is provided.
  echo ""
  read -r -p "👉️ Enter the new language code: " new_lang_code

  while [[ -z "$new_lang_code" ]]; do
    read -r -p "👉️ Please enter a non-empty code: " new_lang_code
  done

  # Set up all the language configuration variables for every language available
  # here

  # new_lang_code = en_us
  if [ "$new_lang_code" = "en_us" ]; then

    lang="english"

    # Overwrite the variables in config/commbase.conf

    # COMMBASE_LANG
    if grep -q "COMMBASE_LANG" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#COMMBASE_LANG=.*#COMMBASE_LANG=\"$new_lang_code\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # STT_ENGINE_LANGUAGE
    if grep -q "STT_ENGINE_LANGUAGE" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#STT_ENGINE_LANGUAGE=.*#STT_ENGINE_LANGUAGE=\"$lang\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # LLM_GOOGLE_GEMINI_LANGUAGE
    if grep -q "LLM_GOOGLE_GEMINI_LANGUAGE" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#LLM_GOOGLE_GEMINI_LANGUAGE=.*#LLM_GOOGLE_GEMINI_LANGUAGE=\"$lang\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # LLM_META_LLAMA_LANGUAGE
    if grep -q "LLM_META_LLAMA_LANGUAGE" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#LLM_META_LLAMA_LANGUAGE=.*#LLM_META_LLAMA_LANGUAGE=\"$lang\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # LLM_OPENAI_GPT_LANGUAGE
    if grep -q "LLM_OPENAI_GPT_LANGUAGE" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#LLM_OPENAI_GPT_LANGUAGE=.*#LLM_OPENAI_GPT_LANGUAGE=\"$lang\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # Add more en_us variables here ...

    # Restart STT engines here ...

    # Restart the running STT engine
    (bash "$restart_stt_engine_no_recorder")

    # Restart LLMs here ...

    # Restart the running LLM
    # TODO: Come back here after coding every LLM bundle.

    # Retrieve the real final value of the language variable from the
    # configuration file instead of from $new_lang_code.
    source "$COMMBASE_APP_DIR"/config/commbase.conf # Re-sources the configuration file to apply the changes

    # Inform the user
    if [ "$STT_ENGINE_PATH" = "$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-reactive-p/commbase_stt_whisper_reactive_p.py" ]; then
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; echo -e 'Your new language code is: " "$COMMBASE_LANG.\\nRun the voice recorder with the command: commbase recorder'" C-m);
    else
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; echo 'Your new language code is: " "$COMMBASE_LANG.'" C-m);
    fi

    # Gracefully terminate the recorder-transmitter PID, and if that fails, use kill -9.
    pkill -f "$COMMBASE_APP_DIR/$RECORDER_TRANSMITTER_FILE"

  # new_lang_code = es_es
  elif [ "$new_lang_code" = "es_es" ]; then

    lang="spanish"

    # Overwrite the line in config/commbase.conf

    # COMMBASE_LANG
    if grep -q "COMMBASE_LANG" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#COMMBASE_LANG=.*#COMMBASE_LANG=\"$new_lang_code\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # STT_ENGINE_LANGUAGE

    if grep -q "STT_ENGINE_LANGUAGE" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#STT_ENGINE_LANGUAGE=.*#STT_ENGINE_LANGUAGE=\"$lang\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # LLM_GOOGLE_GEMINI_LANGUAGE
    if grep -q "LLM_GOOGLE_GEMINI_LANGUAGE" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#LLM_GOOGLE_GEMINI_LANGUAGE=.*#LLM_GOOGLE_GEMINI_LANGUAGE=\"$lang\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # LLM_META_LLAMA_LANGUAGE
    if grep -q "LLM_META_LLAMA_LANGUAGE" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#LLM_META_LLAMA_LANGUAGE=.*#LLM_META_LLAMA_LANGUAGE=\"$lang\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # LLM_OPENAI_GPT_LANGUAGE
    if grep -q "LLM_OPENAI_GPT_LANGUAGE" "$COMMBASE_APP_DIR"/config/commbase.conf; then
      sed -i "s#LLM_OPENAI_GPT_LANGUAGE=.*#LLM_OPENAI_GPT_LANGUAGE=\"$lang\"#" "$COMMBASE_APP_DIR"/config/commbase.conf
    fi

    # Add more es_es variables here ...

    # Restart STT engines here ...

    # Restart the running STT engine
    (bash "$restart_stt_engine_no_recorder")

    # Restart LLMs here ...

    # Restart the running LLM
    # TODO: Come back here after coding every LLM bundle.

    # Retrieve the real final value of the language variable from the
    # configuration file instead of from $new_lang_code.
    source "$COMMBASE_APP_DIR"/config/commbase.conf # Re-sources the configuration file to apply the changes

    # Inform the user
    if [ "$STT_ENGINE_PATH" = "$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-reactive-p/commbase_stt_whisper_reactive_p.py" ]; then
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; echo -e 'Your new language code is: " "$COMMBASE_LANG.\\nRun the voice recorder with the command: commbase recorder'" C-m);
    else
      (tmux select-window -t 1 && tmux select-pane -t 7 && tmux send-keys " clear; echo 'Your new language code is: " "$COMMBASE_LANG.'" C-m);
    fi

    # Gracefully terminate the recorder-transmitter PID, and if that fails, use kill -9.
    pkill -f "$COMMBASE_APP_DIR/$RECORDER_TRANSMITTER_FILE"

  else
   echo "Your code does not correspond to any language available."
   echo "Please rerun the script to enter a different code or add and set up the new language and code properly."

  fi

  # Add more new_lang_code language code blocks here ...

  exit 99
}

# Call terminal_only_set_language if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (terminal_only_set_language)
fi

exit 99
