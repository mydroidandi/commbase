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

# localhost_reproduce_a_random_chapter_of_robinson_crusoe.sh
# Plays a random audio from a list of files in a directory

# Generate a random number between 1 and the total number of files, 15 (inclusive):
total=15
chapter=$((1 + $RANDOM % $total))

case $chapter in

1)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_01_baldwin_64kb.mp3
    ;;
2)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_02_baldwin_64kb.mp3
    ;;
3)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_03_baldwin_64kb.mp3
   ;;
4)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_04_baldwin_64kb.mp3
   ;;
5)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_05_baldwin_64kb.mp3
   ;;
6)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_06_baldwin_64kb.mp3
   ;;
7)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_07_baldwin_64kb.mp3
   ;;
8)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_08_baldwin_64kb.mp3
   ;;
9)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_09_baldwin_64kb.mp3
   ;;
10)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_10_baldwin_64kb.mp3
   ;;
11)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_11_baldwin_64kb.mp3
   ;;
12)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_12_baldwin_64kb.mp3
   ;;
13)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_13_baldwin_64kb.mp3
   ;;
14)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_14_baldwin_64kb.mp3
   ;;
15)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE_ROOT_DIR/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_15_baldwin_64kb.mp3
   ;;
esac

