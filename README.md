# Commbase <img align="center" alt="Visual Studio Code" width="10%" src="commbase.png" />

Conversational AI Assistant and AI Hub for Computers and Droids

<img alt="Neovim" src="./screenshots/commbase.png?raw=true" width="550" height="291" />

## Introduction

Commbase is a ✨ programmable ✨ conversational AI assistant and "distributed AI" or "multi-agent system" (MAS) implemented as a set of separate processes or applications running on a single computer, droid, or appliance. It works on general-purpose operating systems without requiring an internet connection. He/She can by improved by AI (Machine Learning and Data Science) and programming languages as described in your User's Guide.

## Usage

To start using Commbase enter the commbase command in a terminal:

```sh
$ commbase start
```

## Installation

For information on how to install Commbase, follow the steps in the file [`INSTALL`](./INSTALL).

## User's Guide

For information on how to use, set up, and program Commbase read the User's Guide.

* [`docs`](/docs) 

## Structure

This project is coded and organized like this:

```sh
path/to/commbase  # The directory commbase
├── bundled  # Stores the packaged software source
│   ├── audiobooks
│   ├── distributed-ai
│   │   └── x-conversation-mode-ai
│   ├── PyAudio-0.2.11
│   ├── scripts
│   │   └── utilities
│   ├── sounds
│   ├── tensorf
│   ├── vosk
│   │   └── model
│   └── vu-meter
├── config  # Stores the configuration files
├── data  # Stores the voice recognition model results
├── docs  # Stores the human-readable guides for Commbase users
├── history
├── log
├── screenshots
├── scripts
│   ├── configuration
│   ├── deployment
│   └── utilities
└── src
    ├── distribuited-ai
    │   └── x-conversation-mode-ai
    ├── includes
    │   ├── routines
    │   ├── skills
    │   │   ├── custom
    │   │   │   ├── parsers
    │   │   │   └── runners
    │   │   ├── default
    │   │   │   ├── parsers
    │   │   │   └── runners
    │   │   └── essential
    │   │       ├── parsers
    │   │       └── runners
    │   ├── skillsets
    │   │   ├── custom
    │   │   │   ├── parsers
    │   │   │   └── runners
    │   │   └── default
    │   │       ├── parsers
    │   │       └── runners
    │   └── skill-testing
    ├── skill-patterns
    │   ├── custom
    │   ├── default
    │   └── essential
    ├── skill-scripts
    │   ├── custom
    │   │   ├── bash
    │   │   ├── c
    │   │   ├── java
    │   │   ├── multi-lang
    │   │   ├── nodejs
    │   │   └── python
    │   └── default
    │       ├── bash
    │       ├── c
    │       ├── java
    │       ├── multi-lang
    │       ├── nodejs
    │       └── python
    └── talks
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

