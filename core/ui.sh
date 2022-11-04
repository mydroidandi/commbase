#!/bin/bash
# File: commbase-vosk-start.sh
# Description: Creates the Commbase application interface

# The Commbase directory:
#COMMBASE=$HOME
COMMBASE=$HOME/Developer

# Set this environmental variable in a single step
#export TRIM_STR=""

# Gives .5 seconds to tmux to draw the pane and its content before continue
time=0.5

# Kill any existent tmux Commbase session in order to avoid duplicates
tmux kill-session -t Commbase-0

# Creates a new session, detaches from it to continue and sleeps
tmux new-session -d -t "Commbase" && sleep $time

# Create windows and panels:
# Renames the first tmux window (window 0), splits it horizontally, and set focus the cursor on the pane 0 (above)
tmux rename-window "Commbase" && tmux split-window -v && tmux select-pane -t 1
# Splits vertically the pane 0
tmux split-window -h && tmux select-pane -t 1 && sleep $time
# Splits horizontally the pane 0 
tmux split-window -v && tmux select-pane -t 1 && sleep $time
# Creates window 1 , name it "Extension", sleeps, runs a command, sends enter key, and sleeps
tmux new-window -t Commbase-0:1 -n "Extension" && sleep $time
#tmux new-window -t Commbase-0:1 -n "Extension" && tmux send-keys "cd $COMMBASE/Commbase ; clear" C-m && sleep $time
# Focuses the cursor on the window 0, "Commbase" and selects the pane 1 (by default), runs any shell command, sends enter key and presses enter, and sleeps
tmux select-window -t 1 && tmux send-keys "python3.7 $COMMBASE/Commbase/commbase/base-vosk/commbase-speech-recognition-vosk.py" C-m && sleep $time
tmux select-pane -t 2 && tmux send-keys "python3.7 $COMMBASE/Commbase/commbase/base-vosk/vu-meter/vu_meter.py" C-m && sleep $time
tmux select-pane -t 3 && tmux send-keys "alsamixer --view all" C-m && sleep $time
tmux select-pane -t 4 && tmux send-keys "cd $COMMBASE/Commbase ; clear" C-m && sleep $time
# Supports resizing the terminal window
#tmux resize-pane -R -t 1 50
# Provides extra processing power for loading the model faster here but user could CTRL + C
#tmux select-pane -t 1

# Enter the Commbase session:
tmux attach-session -t Commbase-0

exit 99
