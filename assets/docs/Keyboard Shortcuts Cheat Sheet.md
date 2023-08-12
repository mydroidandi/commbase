# Commbase <img align="center" alt="Visual Studio Code" width="10%" src="./images/commbase.png" /> Keyboard Shortcuts Cheat Sheet

# Keyboard Shortcuts Cheat Sheet

## Commbase Key Bindings

`CTRL` + `SHIFT` + `Z` : Toggle active capture device.
<br />`ALT` + `SHIFT` + `1` : Toggle ON/OFF sound capturing.
<br />`ALT` + `SHIFT` + `2` : Stop sound capturing.
<br />`ALT` + `SHIFT` + `3` : Start sound capturing.

These group of shortcuts are defined in the Commbase directory key-bindings/

## Bash

`Ctrl` + `A` : Move to the start of the command line.
<br />`Ctrl` + `E` : Move to the end of the command line.
<br />`Ctrl` + `F` : Move one character forward.
<br />`Ctrl` + `B` : Move one character backward.
<br />`Ctrl` + `XX` : Switch cursor position between start of the command line and the current position.
<br />`Ctrl` + `]` + `x` : Move the cursor forward to next occurrence of x.
<br />`Alt` + `F` / `Esc` + `F` : Move the cursor one word forward.
<br />`Alt` + `B` / `Esc` + `B`	:	Move the cursor one word backward.
<br />`Alt` + `Ctrl` + `]` + `x` : Move cursor to the previous occurrence of x.

###	Bash Control/Process

`Ctrl` + `L` : Clear the terminal screen.
<br />`Ctrl` + `S` : Stop command output to the screen.
<br />`Ctrl` + `Z` : Suspend current command execution and move it to the background.
<br />`Ctrl` + `Q` : Resume suspended command.
<br />`Ctrl` + `C` : Send SIGI signal and kill currently executing command.
<br />`Ctrl` + `D` : Close the current terminal.

###	Bash History

`Ctrl` + `R` : Incremental reverse search of bash history.
<br />`Alt` + `P` : Non-incremental reverse search of bash history.
<br />`Ctrl` + `J` : End history search at current command.
<br />`Ctrl` + `_` :	Undo previous command.
<br />`Ctrl` + `P` / `Up arrow` : Move to previous command.
<br />`Ctrl` + `N` / `Down arrow` :	Move to next command.
<br />`Ctrl` + `S` : Get the next most recent command.
<br />`Ctrl` + `O` : Run and re-enter the command found via Ctrl + S and Ctrl + R.
<br />`Ctrl` + `G` : Exit history search mode.
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

`Ctrl` + `U` : Delete before the cursor until the start of the command.
<br />`Ctrl` + `K` : Delete after the cursor until the end of the command.
<br />`Ctrl` + `W` : Remove the command/argument before the cursor.
<br />`Ctrl` + `D` : Remove the character under the cursor.
<br />`Ctrl` + `H` : Remove character before the cursor.
<br />`Alt` + `D` : Remove from the character until the end of the word.
<br />`Alt` + `Backspace` : Remove from the character until the start of the word.
<br />`Alt` + `.` / `Esc` + `.` : Use last argument of previous command.
<br />`Alt` + `<` : Move to the first line of the bash history.
<br />`Alt` + `>` : Move to the last line of the bash history.
<br />`Esc` + `T` : Switch between last two words before cursor.
<br />`Alt` + `T` : Switch current word with the previous.

###	Bash Information

`TAB` : Autocomplete the command or file/directory name.
<br />`~TAB TAB`:	List all Linux users.
<br />`Ctrl` + `I`: Complete the command like TAB.
<br />`Alt` + `?` : Display files/folders in the current path for help.
<br />`Alt` + `*` : Display files/folders in the current path as parameter.

## Desktop Environment and Operating System

`SHIFT` + `TAB` : Set focus.
<br />`ALT` + `TAB` : Select any application and bring it to foreground.
<br />`ALT` + `SHIFT` + `TAB` : Select any application and bring it to foreground.
<br />`INSERT` Take a full screen screenshot.
<br />`CTRL` + `ALT` + `F1-F12` : Switch among console terminals.
<br />`CTRL` + `ALT` + `ARROWS` : Move through desktop workspaces.
<br />`SUPER` + `Z` : Desktop search.
<br />`CTRL` + `ALT` + `DEL` : Reboot computer.
<br />`ALT` + `SYSRQ` + `R` : un**R**aw (take control of keyboard back from X11)
<br />`ALT` + `SYSRQ` + `E` : t**E**rminate (send SIGTERM to all processes, allowing them to terminate gracefully)
<br />`ALT` + `SYSRQ` + `I` : k**I**ll (send SIGILL to all processes, forcing them to terminate immediately)
<br />`ALT` + `SYSRQ` : `S` : **S**ync (flush data to disk)
<br />`ALT` + `SYSRQ` + `U` : **U**nmount (remount all filesystems read-only)
<br />`ALT` + `SYSRQ` + `B` : re**B**oot.

## Gnome Terminal

`CTRL` + `-` : Resize terminal.
<br />`CTRL` + `+` : Resize terminal.
<br />`CTRL` + `SHIFT` + `X` + `X` : Selects a portion of the terminal text typed in.
<br />`CTRL` + `SHIFT` + `C` : Copy highlighted text from terminal.
<br />`CTRL` + `SHIFT` + `V` : Paste clipboard text into terminal.

## Neovim / Emacs

When using Neovim or Emacs, make sure that the custom keyboard shorcuts do not interfere one another in the complete list.

## OBS

`ALT` + `SHIFT` + `4` : Start recording.
<br />`ALT` + `SHIFT` + `5` : Stop recording.
<br />`ALT` + `SHIFT` + `6` : Start streaming.
<br />`ALT` + `SHIFT` + `7` : Stop streaming.

## SimpleScreenRecorder

`SUPER` + `S` : Start recording.

## Text Editors and IDEs

CTRL	X	Cut.
`CTRL` + `C` : Copy.
<br />`CTRL` + `V` : Paste.
<br />`CTRL` + `F` : Find.
<br />`CTRL` + `N` : Create new file.

## Oh My Tmux

`Prefix` + `B` , `1-9` : Switch window by its number id.
<br />`Prefix` + `B` , `Q` : Display pane numbers.
<br />`Prefix` + `B` , `SHIFT` : Split pane vertically.
<br />`Prefix` + `B` , `ARROWS` : Resize active pane.
<br />`Prefix` + `B` , `ARROWS` : Switch pane.

Prefix = CTRL

## VS Code

`CTRL` + `SHIFT` + `P` : View Command Palette.
<br />`CTRL` + `P` : Find file or expression.
<br />`CTRL` + `B` : Open/Close side panel. Bold a word if editing a markdown file while using a markdown extension for VS Code.
<br />`CTRL` + `BACKTICK SYMBOL` : Open VS Code Terminal.

When using VS Code, make sure that the custom keyboard shorcuts do not interfere one another in the complete list.

## Web Browser

Click on a browser's tab and then use the roller to move through the tabs.

