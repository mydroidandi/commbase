# Commbase <img align="center" ALT="Visual Studio Code" width="10%" src="./images/commbase.png" /> Keyboard Shortcuts

# Keyboard Shortcuts Cheat Sheet

## Commbase Key Bindings

`CTRL` + `SHIFT` + `Z` : Toggle active capture device.
<br />`ALT` + `SHIFT` + `1` : Toggle ON/OFF sound capturing.
<br />`ALT` + `SHIFT` + `2` : Stop sound capturing.
<br />`ALT` + `SHIFT` + `3` : Start sound capturing.

These group of shortcuts are defined in the directory **scripts/configuration/key_bindings/**.

## Bash

`CTRL` + `A` : Move to the start of the command line.
<br />`CTRL` + `E` : Move to the end of the command line.
<br />`CTRL` + `F` : Move one character forward.
<br />`CTRL` + `B` : Move one character backward.
<br />`CTRL` + `XX` : Switch cursor position between start of the command line and the current position.
<br />`CTRL` + `]` + `X` : Move the cursor forward to next occurrence of x.
<br />`ALT` + `F` / `ESC` + `F` : Move the cursor one word forward.
<br />`ALT` + `B` / `ESC` + `B`	:	Move the cursor one word backward.
<br />`ALT` + `CTRL` + `]` + `X` : Move cursor to the previous occurrence of x.

###	Bash Control/Process

`CTRL` + `L` : Clear the terminal screen.
<br />`CTRL` + `S` : Stop command output to the screen.
<br />`CTRL` + `Z` : Suspend current command execution and move it to the background.
<br />`CTRL` + `Q` : Resume suspended command.
<br />`CTRL` + `C` : Send SIGI signal and kill currently executing command.
<br />`CTRL` + `D` : Close the current terminal.

###	Bash History

`CTRL` + `R` : Incremental reverse search of bash history.
<br />`ALT` + `P` : Non-incremental reverse search of bash history.
<br />`CTRL` + `J` : End history search at current command.
<br />`CTRL` + `_` :	Undo previous command.
<br />`CTRL` + `P` / `UP ARROW` : Move to previous command.
<br />`CTRL` + `N` / `DOWN ARROW` :	Move to next command.
<br />`CTRL` + `S` : Get the next most recent command.
<br />`CTRL` + `O` : Run and re-enter the command found via CTRL + S and CTRL + R.
<br />`CTRL` + `G` : Exit history search mode.
<br />`!!` : Run last command.
<br />`!*` : Run previous command except its first word.
<br />`!*:p` : Display what !* substitutes.
<br />`!x` : Run recent command in the bash history that begins with x.
<br />`!x:p` : Displays the x command and adds it as the recent command in history.
<br />`!$` : Same as OPTION+., bring forth last argument of the previous command.
<br />`!^` : Substitute first argument of last command in the current command.
<br />`!$:p` : Display the word that !$ substitutes.
<br />`^123^abc` : Replace 123 with abc.
<br />`!n:m` : Repeat argument within a range (i.e, m 2-3).
<br />`!fi`	:	Repeat latest command in history that begins with fi.
<br />`!n` : Run nth command from the bash history.
<br />`!n:p` : Print the command !n executes.
<br />`!n:$` : Repeat arguments from the last command (i.e, from argument n to $).

###	Bash Editing

`CTRL` + `U` : Delete before the cursor until the start of the command line.
<br />`CTRL` + `K` : Delete after the cursor until the end of the command line.
<br />`CTRL` + `W` : Remove the command/argument before the cursor.
<br />`CTRL` + `D` : Remove the character under the cursor.
<br />`CTRL` + `H` : Remove character before the cursor.
<br />`ALT` + `D` : Remove from the character until the end of the current word.
<br />`ALT` + `BACKSPACE` : Remove from the character until the start of the current word.
<br />`ALT` + `.` / `ESC` + `.` : Use last argument of the previous command.
<br />`ALT` + `<` : Move to the first line of the bash history.
<br />`ALT` + `>` : Move to the last line of the bash history.
<br />`ESC` + `T` : Switch between last two words before cursor.
<br />`ALT` + `T` : Switch current word with the previous.

###	Bash Information

`TAB` : Autocomplete the command or file/directory name.
<br />`~TAB TAB`:	List all Linux users.
<br />`CTRL` + `I`: Complete the command like TAB.
<br />`ALT` + `?` : Display files/folders in the current path for help.
<br />`ALT` + `*` : Display files/folders in the current path as parameter.

## Desktop Environment and Operating System

`SHIFT` + `TAB` : Set focus.
<br />`ALT` + `TAB` : Select any application and bring it to foreground.
<br />`ALT` + `SHIFT` + `TAB` : Select any application and bring it to foreground.
<br />`INSERT` Take a full screen screenshot.
<br />`CTRL` + `ALT` + `F1-F12` : Switch among console terminals.
<br />`CTRL` + `ALT` + `ARROWS` : Move through desktop workspaces.
<br />`SUPER` + `Z` : Desktop search.
<br />`CTRL` + `ALT` + `DEL` : Reboot computer.
<br />`ALT` + `SYSRQ` + `R` : un**R**aw (take control of the keyboard back from X11.)
<br />`ALT` + `SYSRQ` + `E` : t**E**rminate (send SIGTERM to all processes, allowing them to terminate gracefully.)
<br />`ALT` + `SYSRQ` + `I` : k**I**ll (send SIGILL to all processes, forcing them to terminate immediately.)
<br />`ALT` + `SYSRQ` : `S` : **S**ync (flush data to disk.)
<br />`ALT` + `SYSRQ` + `U` : **U**nmount (remount all filesystems as read-only.)
<br />`ALT` + `SYSRQ` + `B` : re**B**oot (reboot the computer).

## Gnome Terminal

`CTRL` + `-` : Resize terminal.
<br />`CTRL` + `+` : Resize terminal.
<br />`CTRL` + `SHIFT` + `X` + `X` : Selects a portion of the terminal text typed in.
<br />`CTRL` + `SHIFT` + `C` : Copy highlighted text from terminal.
<br />`CTRL` + `SHIFT` + `V` : Paste clipboard text into terminal.

## OBS

`ALT` + `SHIFT` + `4` : Start recording.
<br />`ALT` + `SHIFT` + `5` : Stop recording.
<br />`ALT` + `SHIFT` + `6` : Start streaming.
<br />`ALT` + `SHIFT` + `7` : Stop streaming.

## SimplESCreenRecorder

`SUPER`/ `META` + `S` : Start recording.

## Oh My Tmux

`PREFIX` + `B` , `1-9` : Switch windows by their number IDs.
<br />`PREFIX` + `B` , `Q` : Display pane numbers.
<br />`PREFIX` + `B` , `SHIFT` : Split pane vertically.
<br />`PREFIX` + `B` + `ARROWS` : Resize the active pane.
<br />`PREFIX` + `B` , `ARROWS` : Switch panes.

Default PREFIX = CTRL

## Text Editors and IDEs

`CTRL` +	`X`: Cut.
<br />`CTRL` + `C` : Copy.
<br />`CTRL` + `V` : Paste.
<br />`CTRL` + `F` : Find.
<br />`CTRL` + `N` : Create new file.

## VS Code

`CTRL` + `SHIFT` + `P` : View Command Palette.
<br />`CTRL` + `P` : Find file or expression.
<br />`CTRL` + `B` : Open/Close side panel. Bold a word if editing a markdown file while using a markdown extension for VS Code.
<br />`CTRL` + `BACKTICK SYMBOL` : Open VS Code Terminal.

When using VS Code, make sure that the custom keyboard shortcuts do not interfere with each other in the complete list.

## Neovim / Emacs

When using Neovim or Emacs, make sure that the custom keyboard shortcuts do not interfere one another in the complete list.

## Web Browser

Click on a browser's tab and then use the roller to move through the tabs.
