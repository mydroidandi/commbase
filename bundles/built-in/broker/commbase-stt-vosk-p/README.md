# commbase-stt-vosk-p

[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![python version](https://img.shields.io/badge/python-3.10%20%7C%203.11-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11-blue)

## Introduction

commbase-stt-vosk-p is an ASR (Automatic Speech Recognition) engine. It is capable of converting spoken language into written text without requiring an internet connection, making it a reliable and secure solution for any application that needs speech-to-text functionality.

<img alt="commbase-stt-vosk-p" src="commbase-stt-vosk-p.jpg?raw=true" width="512" height="512" />

## Controls

It comes with 13 reliable mutually exclusive control messages that can be recorded and sent forward together with the parsed messages and be used by skills' applications to parameterize any skill option or be bypassed for message management/handling in any application subsequently. These control messages can also be changed or customized in their respective pattern files, and ultimately, increase or decrease in number, depending on your processing power and coding ability to remove or create new instances. These out-of-the-box controls are:

* CONTROL_STOP_PREVIOUS_COMMAND
* CONTROL_ACCEPT_CHANGES
* CONTROL_DENY_CHANGES
* CONTROL_SELECT_OPTION_NUMBER_ONE
* CONTROL_SELECT_OPTION_NUMBER_TWO
* CONTROL_SELECT_OPTION_NUMBER_THREE
* CONTROL_SELECT_OPTION_NUMBER_FOUR
* CONTROL_SKIP_QUESTION
* CONTROL_REQUEST_THE_CURRENT_MODE
* CONTROL_ENTER_THE_NORMAL_MODE
* CONTROL_ENTER_THE_CONVERSATION_MODE
* CONTROL_ENTER_THE_EXPERT_MODE
* CONTROL_ENTER_THE_FOLLOW_MODE

## Examples

Detailed information about examples can be found in the corresponding [`examples`](./examples) directory.

