#!/usr/bin/env bash
# append-function-nohistory-to-bashrc.sh
# Prevents a command from being saved in the command history by using the
# HISTCONTROL environment variable.
# The HISTCONTROL variable determines which commands are saved in the history
# file. If you set it to the value "ignoreboth", any command preceded by a space
# character will be excluded from the history.
for line in '' '# Prevents a command from being saved in the command history by using the' '# HISTCONTROL environment variable.' 'no_history() { HISTCONTROL=ignoreboth; "$@"; unset HISTCONTROL; }'; do echo "$line" >> ~/.bashrc; done
