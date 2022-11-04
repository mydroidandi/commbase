#!/bin/bash
# File: desktop-shark-check-if-two-strings-are-equal.sh
# Description: Compares to string values and returns a message to know whether they are equal or not

str1="Hello Bash"
str2="Hello Bash"

if [ "$str1" == "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi
