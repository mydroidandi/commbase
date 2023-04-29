#!/bin/bash
# central-processing.sh
# Reads and processes every new data stored in .data.dat and .prev_data

# $(<FILE-NAME) is used in bash or zsh, to read a whole file into a variable without invoking cat
trim_str=$(<$COMMBASE_ROOT_DIR/commbase/data/.data.dat)
trim_previous_str=$(<$COMMBASE_ROOT_DIR/commbase/data/prev_data.dat)

# Validate the signal to run/stop the current voice command
if echo $trim_str | grep -q "okay stop"; then
  stop_signal="STOP!"
  echo $stop_signal
fi

# ---------------------------------------------------------------------------------------------------
# In this section, add and organize the directories and files containing Commbase commands functions
# ---------------------------------------------------------------------------------------------------
# Import Functions:
dir="$(dirname "$0")"
# ------------------------------------------COMMBASE-INTERNALS---------------------------------------
# Commbase random affirmative reply. Receives the total of cases in $1:
internal_random_yes_func() {
	reply_yes=$((1 + $RANDOM % $1)) # Generates a random number between 1 and $total_yes (inclusive)
	case $reply_yes in 1) echo "running" | festival --tts ;; 2) echo "all right" | festival --tts ;; 3) echo "yes ser" | festival --tts ;; 4) echo "affirmative" $USER | festival --tts ;; 5) echo "o kie dokie" $USER | festival --tts ;; 6) echo "okay" $USER | festival --tts ;; esac
}
# -----------------------------------------------SYMBOLS---------------------------------------------
# 
# --------------------------------------------------A------------------------------------------------
# apt:
# --------------------------------------------------B------------------------------------------------
# brave:
. $dir/functions/open_the_brave_browser_func
. $dir/functions/open_my_linux_documentation_func
. $dir/functions/show_me_my_location_func
# --------------------------------------------------E------------------------------------------------
# etherape:
. $dir/functions/open_the_network_browser_func
# --------------------------------------------------G------------------------------------------------
# git:
. $dir/functions/g_i_t_status_func
# gnome terminal:
. $dir/functions/open_a_new_terminal_func
# --------------------------------------------------M------------------------------------------------
# midori:
. $dir/functions/open_a_simple_browser_func
. $dir/functions/kill_the_simple_browser_func
# mpv:
. $dir/functions/reproduce_a_chapter_of_robinson_crusoe_func
# --------------------------------------------------N------------------------------------------------
# nano:
. $dir/functions/open_the_terminal_editor_func
# neofetch:
. $dir/functions/show_me_basic_system_information_func
# --------------------------------------------------O------------------------------------------------
# openssh:
. $dir/functions/connect_me_to_the_development_server_func
# --------------------------------------------------P------------------------------------------------
# ping:
. $dir/functions/let_me_know_when_the_internet_is_back_func
. $dir/functions/list_the_addresses_in_the_local_network_func
. $dir/functions/verify_the_internet_connection_func
# protonvpn:
. $dir/functions/connect_me_to_the_private_network_func
. $dir/functions/disconnect_me_from_the_private_network_func
# --------------------------------------------------R------------------------------------------------
# rsync:
. $dir/functions/push_to_the_local_web_server_func
. $dir/functions/synchronize_development_from_desktop_func
# --------------------------------------------------T------------------------------------------------
# timers:
. $dir/functions/set_a_timer_of_1_to_129_minutes_func
# --------------------------------------------------V------------------------------------------------
# vs code:
. $dir/functions/open_my_current_editor_workspace_func
# ---------------------------------------------------------------------------------------------------
# In this section, add and organize the Commbase commands
# ---------------------------------------------------------------------------------------------------
# Don't remove the main 'if' statement of the COMMBASE INTERNALS section for the program to work.
# Add a new 'elif' statement, what it means to search for and find out your new custom voice command
# pattern among the 'if', for example, the substring "open a browser" in "let's commbase open a 
# browser for me". You can use an 'elif' with OR or even regular expressions (but prefer training the
# model over patching recognition with regexp) to set up your voice commands accordingly.
# Every custom 'elif' must call a function outside this script in the directory functions.
# Use the existent 'elif' and functions as examples on what is possible to do and how to make it real.
# Create your scripts to run as commands in the directory Commbase/ to keep your scripts directory
# database well organized.
# There are alternative versions of the current script file you can use out of box or use as template
# for your own file version in the directory process-templates.
# Test every new command made to make sure that it's not going to affect the functioning of the whole
# program.
# The last 'else' statement acts as the default response for a command conflict that the script can't
# resolve and it can't be removed.
# ------------------------------------------COMMBASE-INTERNALS---------------------------------------
# commbase intro:
if echo $trim_previous_str | grep -q "tell me about yourself" || echo $trim_previous_str | grep -q "introduce yourself"; then

  case $stop_signal in

    'STOP!') 
      echo -e "\e[1;41mCOMMBASE:\e[1;m You can't stop this!" # This can't be stopped, but short introductions are great!
      ;; 
    *)
      # Disables capture to prevent feedback loops of command > answer > command
      amixer set Capture nocap &>/dev/null && sleep 0.5
      tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
      echo "$(<$COMMBASE_ROOT_DIR/commbase/core/talks/a-little-bit-about-myself_talk)" | festival --tts
      tmux select-window -t 1 && echo -e "\e[1;41mCOMMBASE:\e[1;m Run: a little bit about myself"
      echo "tell me about yourself" >> $COMMBASE_ROOT_DIR/commbase/history/.commbase_history
      #/usr/bin/amixer set Master 50%
      amixer set Capture cap &>/dev/null
      ;; 
  esac
# commbase mute:
elif echo $trim_str | grep -q "stop capturing sound" || echo $trim_str | grep -q "stop listening"; then
  amixer set Capture nocap &>/dev/null
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
  tmux select-pane -t 1 && echo -e "\e[1;41mCOMMBASE:\e[1;m Run: ""stop listening / stop capturing sound"
  echo "stop capturing sound" >> $COMMBASE_ROOT_DIR/commbase/history/.commbase_history
  tmux select-pane -t 4 && tmux send-keys "(/usr/bin/aplay -q $COMMBASE_ROOT_DIR/commbase/bundled/sounds/beep-down.wav &) &>/dev/null" C-m
  tmux select-pane -t 4 && tmux send-keys "clear" C-m
# commbase reload recognition:
elif echo $trim_str | grep -q "reload recognition" || echo $trim_str | grep -q "reload speech recognition" || echo $trim_str | grep -q "reload your speech recognition" || echo $trim_str | grep -q "reload your recognition"; then
  amixer set Capture nocap &>/dev/null
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
  tmux select-window -t 1 && tmux select-pane -t 4 && sleep 1
  (pkill --full $COMMBASE_ROOT_DIR/commbase/core/voice-recognition.py) &>/dev/null
  tmux select-pane -t 1 && tmux send-keys "python3.7 $COMMBASE_ROOT_DIR/commbase/core/voice-recognition.py" C-m && sleep 4
  amixer set Capture cap &>/dev/null
  echo "reload recognition" >> $COMMBASE_ROOT_DIR/commbase/history/.commbase_history
  tmux select-pane -t 4 && tmux send-keys "(aplay -q $COMMBASE_ROOT_DIR/commbase/bundled/sounds/beep-up.wav) &>/dev/null" C-m
  tmux select-pane -t 4 && tmux send-keys "clear" C-m
# commbase turn off:
elif echo $trim_str | grep -q "disconnect yourself"; then
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
  echo "disconnect yourself" >> $COMMBASE_ROOT_DIR/commbase/history/.commbase_history
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "aplay -q $COMMBASE_ROOT_DIR/commbase/bundled/sounds/beep-down.wav" C-m && sleep 1
  tmux kill-session -t Commbase-0
# commbase wake up:
elif echo $trim_str | grep -q "wake up" || echo $trim_str | grep -q "wake-up"; then
  amixer set Capture nocap &>/dev/null
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "(aplay -q $COMMBASE_ROOT_DIR/commbase/bundled/sounds/beep-up.wav) &>/dev/null" C-m
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
  amixer set Capture cap &>/dev/null
  echo -e "\e[1;41mCOMMBASE:\e[1;m Run: ""wake up / wake-up"
  echo "wake up" >> $COMMBASE_ROOT_DIR/commbase/history/.commbase_history
# commbase_learning list command history:
elif echo $trim_str | grep -q "list your command history" || echo $trim_str | grep -q "list your learning history" || echo $trim_str | grep -q "list you're learning history"; then
  amixer set Capture nocap &>/dev/null
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
  gnome-terminal -- bash -c "(cat $COMMBASE_ROOT_DIR/commbase/history/.commbase_history | less); exec bash" C-m
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
  amixer set Capture cap &>/dev/null
  echo -e "\e[1;41mCOMMBASE:\e[1;m Run: ""list your command history / list your learning history"
# commbase_learning clean up command history:
  #(do not save to history file)
# commbase_learning save history as skillset:
  #echo "save this as a new skillset" >> $COMMBASE_ROOT_DIR/commbase/history/.commbase_history
  #gnome-terminal -- bash -c "(nano $COMMBASE_ROOT_DIR/commbase/history/.commbase_history); exec bash" C-m
# -----------------------------------------------SYMBOLS---------------------------------------------
# 
# --------------------------------------------------A------------------------------------------------
# apt:
elif echo $trim_str | grep -q "update applications"; then
  amixer set Capture nocap &>/dev/null
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "clear" C-m
  tmux select-window -t 1 && tmux select-pane -t 4 && tmux send-keys "sudo apt update" C-m
  internal_random_yes_func 6 && echo -e "\e[1;41mCOMMBASE:\e[1;m Run: ""update applications"
  echo "update applications" >> $COMMBASE_ROOT_DIR/commbase/history/.commbase_history  
  amixer set Capture cap &>/dev/null
# --------------------------------------------------B------------------------------------------------
# brave:
elif echo $trim_previous_str | grep -q "open the brave browser"; then open_the_brave_browser_func;
elif echo $trim_str | grep -q "open my linux documentation"; then open_my_linux_documentation_func;
elif echo $trim_str | grep -q "show me my location"; then show_me_my_location_func;
# --------------------------------------------------E------------------------------------------------
# etherape:
elif echo $trim_str | grep -q "open the network browser"; then open_the_network_browser_func;
# --------------------------------------------------G------------------------------------------------
# git:
elif echo $trim_str | grep -q "g i t status" || echo $trim_str | grep -q "g i t 's status"; then g_i_t_status_func;
# gnome terminal:
elif echo $trim_str | grep -q "open a new terminal"; then open_a_new_terminal_func;
# --------------------------------------------------M------------------------------------------------
# midori:
elif echo $trim_str | grep -q "open a simple browser" || echo $trim_str | grep -q "open the simple browser"; then open_a_simple_browser_func;
elif echo $trim_str | grep -q "kill the simple browser" || echo $trim_str | grep -q "close the simple browser" || echo $trim_str | grep -q "kill a simple browser" || echo $trim_str | grep -q "kill does simple browser" || echo $trim_str | grep -q "killed a simple browser" || echo $trim_str | grep -q "killed the simple browser" || echo $trim_str | grep -q "police killed the simple browser" || echo $trim_str | grep -q "close a simple browser" || echo $trim_str | grep -q "closed the simple browser" || echo $trim_str | grep -q "closest simple browser" || echo $trim_str | grep -q "cloth a simple browser" || echo $trim_str | grep -q "clothes the simple browser" || echo $trim_str | grep -q "glows a simple browser" || echo $trim_str | grep -q "gila simple browser" || echo $trim_str | grep -q "kille a somple browser" || echo $trim_str | grep -q "globe does simple browser" || echo $trim_str | grep -q "clothes doesn't pull browser" || echo $trim_str | grep -q "clothes the browser" || echo $trim_str | grep -q "clothes that simple browser" || echo $trim_str | grep -q "closed as simple browser" || echo $trim_str | grep -q "closed a simple browser" || echo $trim_str | grep -q "close doesn't simple browser"; then
  kill_the_simple_browser_func
# mpv:
elif echo $trim_str | grep -q "reproduce a chapter of robinson crusoe" || echo $trim_str | grep -q "reproduce robinson crusoe"; then
  reproduce_a_chapter_of_robinson_crusoe_func
# --------------------------------------------------N------------------------------------------------
# nano:
elif echo $trim_str | grep -q "open the terminal editor"; then open_the_terminal_editor_func;
# neofetch:
elif echo $trim_str | grep -q "show me basic system information"; then show_me_basic_system_information_func;
# --------------------------------------------------O------------------------------------------------
# openssh:
elif echo $trim_str | grep -q "connect me to the development server"; then connect_me_to_the_development_server_func;
# --------------------------------------------------P------------------------------------------------
# ping:
elif echo $trim_str | grep -q "let me know when the internet is back" || echo $trim_str | grep -q "tell me when the internet connection is back" || echo $trim_str | grep -q "tell me when the ethernet connections is back" || echo $trim_str | grep -q "tell me when the internet is back"; then
 let_me_know_when_the_internet_is_back_func
elif echo $trim_str | grep -q "list the addresses in the local network"; then list_the_addresses_in_the_local_network_func;
elif echo $trim_str | grep -q "verify the internet connection" || echo $trim_str | grep -q "verified the internet connection" || echo $trim_str | grep -q "police verified the internet connection" || echo $trim_str | grep -q "verify internet connection" || echo $trim_str | grep -q "verified internet connection"; then
 verify_the_internet_connection_func
# protonvpn:
elif echo $trim_str | grep -q "connect me to the private network"; then connect_me_to_the_private_network_func;
elif echo $trim_str | grep -q "disconnect me from the private network"; then disconnect_me_from_the_private_network_func;
# --------------------------------------------------R------------------------------------------------
# rsync:
elif echo $trim_str | grep -q "push to the local web server"; then push_to_the_local_web_server_func;
elif echo $trim_str | grep -q "synchronize development from desktop"; then synchronize_development_from_desktop_func;
# --------------------------------------------------T------------------------------------------------
elif echo $trim_str | grep -q "set a timer of"; then set_a_timer_of_1_to_129_minutes_func;
# --------------------------------------------------V------------------------------------------------
# vs code:
elif echo $trim_str | grep -q "open my current editor workspace" || echo $trim_str | grep -q "open my current code workspace" || echo $trim_str | grep -q "open my current editor workspace that i am working on" || echo $trim_str | grep -q "opening my current editor workspace" || echo $trim_str | grep -q "opening my current editor workspace that i am working on"; then
open_my_current_editor_workspace_func
# --------------------------------------------------Z------------------------------------------------
#
# ----------------------------------------------SKILLSETS--------------------------------------------
# bake a cake:
#elif echo ...
# ------------------------------------------------ELSE-----------------------------------------------
else
  total_no=4
  amixer set Capture nocap &>/dev/null
  reply_no=$((1 + $RANDOM % $total_no)) # Generates a random number between 1 and $total_no (inclusive)
  case $reply_no in 1) echo "no waaaay" | festival --tts ;; 2) echo "i can't do that" | festival --tts ;; 3) echo "repeat" | festival --tts ;; 4) echo "invalid choice" $USER | festival --tts ;; esac
  #tmux select-window -t 1 && tmux select-pane -t 1 && echo -e "\e[1;41mCOMMBASE:\e[1;m ""I don't understand:" $trim_str
  tmux select-window -t 1 && tmux select-pane -t 1 && printf "\e[1;41mCOMMBASE:\e[1;m I don't understand: %s" "$trim_str"
  tmux select-window -t 1 && tmux select-pane -t 4
  amixer set Capture cap &>/dev/null
fi

exit 1

