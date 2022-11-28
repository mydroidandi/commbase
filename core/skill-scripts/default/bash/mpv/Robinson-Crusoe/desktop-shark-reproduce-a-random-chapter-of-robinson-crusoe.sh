#!/bin/bash
# File: desktop-shark-reproduce-a-random-chapter-of-robinson-crusoe.sh
# Description: Plays a random audio from a list of files in a directory

# Generate a random number between 1 and the total number of files, 15 (inclusive):
total=15
chapter=$((1 + $RANDOM % $total))

case $chapter in

1)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_01_baldwin_64kb.mp3
    ;;
2)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_02_baldwin_64kb.mp3
    ;;
3)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_03_baldwin_64kb.mp3
   ;;
4)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_04_baldwin_64kb.mp3
   ;;
5)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_05_baldwin_64kb.mp3
   ;;
6)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_06_baldwin_64kb.mp3
   ;;
7)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_07_baldwin_64kb.mp3
   ;;
8)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_08_baldwin_64kb.mp3
   ;;
9)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_09_baldwin_64kb.mp3
   ;;
10)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_10_baldwin_64kb.mp3
   ;;
11)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_11_baldwin_64kb.mp3
   ;;
12)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_12_baldwin_64kb.mp3
   ;;
13)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_13_baldwin_64kb.mp3
   ;;
14)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_14_baldwin_64kb.mp3
   ;;
15)  echo "Reproducing audio #:" $chapter" of" $total
    mpv $COMMBASE/commbase/core/skill-scripts/default/bash/mpv/Robinson-Crusoe/crusoe_anew_15_baldwin_64kb.mp3
   ;;
esac

