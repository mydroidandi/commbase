# Commbase <img align="center" alt="Commbase" width="10%" src="./assets/docs/images/commbase.png" />

Programmable conversational AI assistant and distributed AI for single computers or droids

[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Python Version](https://img.shields.io/badge/Python-3.10%20%7C%203.11-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11-blue)
[![Flake8](https://github.com/mydroidandi/commbase/actions/workflows/python-flake8-lint.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Shell Linter](https://github.com/mydroidandi/commbase/actions/workflows/shell-linter.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)

## Introduction

<img alt="Commbase" src="./screenshots/commbase.png?raw=true" width="550" height="291" />

Commbase is a ✨ module bundler ✨ that combines files for usage with libcommbase. It comes with several sample projects that demonstrate how to use it to build conversational AI assistants and "distributed AIs" or "multi-agent systems" (MAS) implemented as a set of separate processes or applications running on a single computer, droid, or smart appliance.

## Usage

[`INSTALL`](./INSTALL) Commbase and then run the next command in a terminal to start the program:

`commbase start`

Commbase will be ready to receive Commbase voice commands and Commbase terminal commands to assist you.

For more terminal options, run:

`commbase -h`

Check out the User's Guide for a complete list of options.

## Installation

For information on how to install Commbase, follow the steps in the file [`INSTALL`](./INSTALL).

## User's Guide

For information on how to set up, use, and program Commbase read the User's Guide.

* [`docs`](/assets/docs) 

## Structure

This project is coded and organized like this:

```sh
/path/to/my/commbase/app
├── assets  # Stores different types of assets, such as images, fonts, and ASCII art
│   ├── ascii
│   ├── docs  # Stores the Commbase User's Guide document
│   │   └── images
│   ├── fonts
│   ├── icons
│   └── images
├── bundles  # Stores the collection of software programs or applications that have been combined and distributed together
│   ├── built-in
│   │   └── broker
│   │       ├── commbase-stt-vosk-p
│   │       │   └── examples
│   │       ├── commbase-stt-whisper-p
│   │       │   └── examples
│   │       ├── commbase-tts-pyttsx3
│   │       ├── libcommbase
│   │       │   ├── examples
│   │       │   ├── libcommbase
│   │       │   │   ├── controller
│   │       │   │   ├── routines
│   │       │   │   └── skills
│   │       │   │       ├── parsers
│   │       │   │       └── runners
│   │       │   └── resources
│   │       │       ├── bundles
│   │       │       │   └── sounds
│   │       │       ├── control_patterns
│   │       │       │   └── vosk-model-en-us-0.22-lgraph
│   │       │       ├── discourses
│   │       │       └── skill_patterns
│   │       │       │   └── vosk-model-en-us-0.22-lgraph
│   │       ├── PyAudio
│   │       ├── scripts
│   │       │   └── utilities
│   │       ├── vosk
│   │       │   └── model
│   │       └── vu-meter
│   ├── custom
│   │   └── agents
│   │       └── z
│   └── default
│       ├── agents
│       │   ├── x-conversation-mode-ai
│       │   └── y
│       └── broker
│           ├── audiobooks
│           │   └── Robinson_Crusoe
│           └── tensorflow
├── config  # Stores the configuration file
├── data  # Stores the voice recognition model results
├── env  # Stores the environment file
├── history  # Stores the Commbase command history file
├── log	 # Stores custom log files of specific skills
├── screenshots  # Stores the image commbase.png
├── scripts  # Stores the scripts for deploying and configuring Commbase, and a few utils
│   ├── configuration
│   │   ├── install_commbase_executable
│   │   └── key_bindings
│   ├── deployment
│   └── utilities
│       └── back-up
└── src  # Stores the source code files of the project
    ├── custom
    │   ├── agents
    │   │   └── z
    │   │       └── includes
    │   └── broker
    │       ├── discourses
    │       │   ├── answers
    │       │   ├── greetings
    │       │   ├── instructions
    │       │   ├── introductions
    │       │   ├── jokes
    │       │   ├── phrases
    │       │   ├── questions
    │       │   ├── quotations
    │       │   ├── speeches
    │       │   ├── statements
    │       │   └── talks
    │       ├── includes
    │       │   ├── routines
    │       │   ├── skills
    │       │   │   ├── parsers
    │       │   │   └── runners
    │       │   ├── skillsets
    │       │   │   ├── parsers
    │       │   │   └── runners
    │       │   └── skill_testing
    │       ├── skill_patterns
    │       │   └── vosk-model-en-us-0.22-lgraph
    │       └── skill_scripts
    │           ├── arduino
    │           ├── bash
    │           ├── c
    │           ├── java
    │           ├── multi-lang
    │           ├── nodejs
    │           └── python
    └── default
        ├── agents
        │   ├── x-conversation-mode-ai
        │   │   └── includes
        │   └── y
        │       └── includes
        └── broker
            ├── discourses
            │   ├── answers
            │   ├── greetings
            │   ├── instructions
            │   ├── introductions
            │   ├── jokes
            │   ├── phrases
            │   ├── questions
            │   ├── quotations
            │   ├── speeches
            │   ├── statements
            │   └── talks
            ├── includes
            │   ├── routines
            │   ├── skills
            │   │   ├── parsers
            │   │   └── runners
            │   └── skillsets
            │       ├── parsers
            │       └── runners
            ├── skill_patterns
            │   └── vosk-model-en-us-0.22-lgraph
            └── skill_scripts
                ├── arduino
                ├── bash
                ├── c
                ├── java
                ├── multi-lang
                ├── nodejs
                └── python
```

## Contributing

To contribute to Commbase, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## Contributors

Thanks to the following people who have contributed to this project:

* [@estebanways](https://github.com/estebanways)

## Contact

If you want to contact us you can reach us at <stv.herrera@gmail.com>.

## License

This project uses the following license: [`License`](./COPYING).

