# Commbase <img align="center" alt="Visual Studio Code" width="10%" src="commbase.png" />

Conversational AI Assistant and AI Hub for Computers and Droids

<img alt="Neovim" src="./screenshots/commbase.png?raw=true" width="550" height="291" />

## Introduction

Commbase is a ✨ programmable ✨ conversational AI assistant and "distributed AI" or "multi-agent system" (MAS) implemented as a set of separate processes or applications running on a single computer, droid, or smart appliance. It works on general-purpose operating systems without requiring an internet connection. He/She can be improved by AI (Machine Learning and Data Science) and programming languages as described in your User's Guide.

## Usage

[`INSTALL`](./INSTALL and then run the next command in a terminal to start Commbase:

$ `commbase start`

Commbase will be ready to receive terminal Commbase commands and voice Commbase commands to assist you.

For more terminal options, run:

$ `commbase -h`

Checkout the User's Guide for a complete list of options.

## Installation

For information on how to install Commbase, follow the steps in the file [`INSTALL`](./INSTALL).

## User's Guide

For information on how to set up, use, and program Commbase read the User's Guide.

* [`docs`](/docs) 

## Structure

This project is coded and organized like this:

```sh
path/to/commbase  # The directory commbase
├── bundled  # Stores the packaged software source
│   ├── agents  # Stores the packaged software of the distributed-ai agents
│   │   ├── x-conversation-mode-ai  # Stores the packaged software of the agent x-conversation-ai
│   │   └── ...
│   └── broker  # Stores the packaged software of the distributed-ai broker
│       ├── audiobooks  # Stores licensed audio files used by a default Commbase command
│       ├── PyAudio-0.2.11  # Stores the source to compile PyAudio for Python
│       ├── scripts
│       │   └── utilities  # Stores scripts to verify or troubleshoot the Commbase installation
│       ├── sounds  # Stores the Commbase sound and alert audio files
│       ├── tensorf  # Stores the packaged tensorflow library
│       ├── vosk
│       │   └── model  # Stores the Vosk model
│       └── vu-meter
├── config  # Stores the configuration files
├── data  # Stores the voice recognition model results
├── docs  # Stores the human-readable guides of Commbase users
├── history  # Stores the Commbase command history file
├── log	 # Stores the Commbase log and the log required log files of particular skills
├── screenshots  # Stores the image commbase.png
├── scripts  # Stores the scripts for deploying and configuring Commbase, and a few utils
│   ├── configuration
│   ├── deployment
│   └── utilities
└── src  # Stores the source code files of the project
    ├── agents  # Stores the source code of the distributed-ai agents
    │   ├── x-conversation-mode-ai
    │   │   ├── includes  # Stores the includes of the agent x-conversation-mode-ai
    │   │   └── ...
    │   └── ...
    └── broker  # Stores the source code files of the distributed-ai broker
        ├── includes  # Stores the functions of the distributed-ai broker
        │   ├── routines  # Stores the broker routines
        │   ├── skills  # Stores the broker skills
        │   │   ├── custom  # Stores the library of skills created by end users (skill programmers)
        │   │   │   ├── parsers  # Stores te parser functions ordered by app/name from a to z
        │   │   │   └── runners  # Stores the runner functions ordered by app/name from a to z
        │   │   ├── default  # Stores the library of skills distributed with the app
        │   │   │   ├── parsers  # Stores the parser functions ordered by app/name from a to z
        │   │   │   └── runners  # Stores the runner functions ordered by app/name from a to z
        │   │   └── essential  # Stores the library of essential skills distributed with the app
        │   │       ├── parsers  # Stores the parser functions ordered by app/name from a to z
        │   │       └── runners # Stores the runner functions ordered by app/name from a to z
        │   ├── skillsets  # Stores the broker skillsets
        │   │   ├── custom  # Stores the library of skillsets created by end users (skillset trainers)
        │   │   │   ├── parsers  # Stores the parser functions ordered by app/name from a to z
        │   │   │   └── runners  # Stores the runner functions ordered by app/name from a to z
        │   │   └── default  # Stores the library of skillsets distributed with the app
        │   │       ├── parsers  # Stores the parser functions ordered by app/name from a to z
        │   │       └── runners  # Stores the runner functions ordered by app/name from a to z
        │   └── skill-testing  # Stores the skills or skillsets under end user (programmer/trainer) testing
        ├── skill-patterns  # Stores all the language patterns of every broker skill
        │   ├── custom  # Stores the custom skill-patterns for the custom skills
        │   ├── default  # Stores the default skill-patterns for the default skills
        │   └── essential  # Stores the essential skill-patterns for the essential skills
        ├── skill-scripts  # Stores the library of skill-scripts called from custom or default skills
        │   ├── custom  # Stores the skill-scripts for the custom skills ordered by programming language
        │   │   ├── bash  # Stores the bash skill-scripts for the custom skills
        │   │   ├── c
        │   │   ├── java
        │   │   ├── multi-lang
        │   │   ├── nodejs
        │   │   ├── python  # Stores the python skill-scripts for the custom skills
        │   │   └── ...
        │   └── default  # Stores the skill-scripts for the default skills ordered by programming language
        │       ├── bash  # Stores the bash skill-scripts for the default skills
        │       ├── c
        │       ├── java
        │       ├── multi-lang
        │       ├── nodejs
        │       ├── python  # Stores the python skill-scripts for the default skills
        │       └── ...
        └── talks  # Stores the Commbase introduction and any other custom talk
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

