<div align="center">

[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Python Version](https://img.shields.io/badge/Python-3.10%20%7C%203.11%20%7C%203.12-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11%20%7C%203.12-blue)
[![flake8 Lint](https://github.com/mydroidandi/commbase/actions/workflows/python-flake8-lint.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-flake8-lint.yml)
[![json-lint](https://github.com/mydroidandi/commbase/actions/workflows/jq-json-lint.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/jq-json-lint.yml)
[![Shell Linter](https://github.com/mydroidandi/commbase/actions/workflows/shell-lint.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/shell-lint.yml)

</div>

<div align="center">

# Commbase <img align="center" alt="Commbase" width="10%" src="./assets/docs/images/commbase.png" />

</div>

<div align="center">

<img alt="Commbase" src="./screenshots/commbase.png?raw=true" width="737" height="527" />

</div>

<br />

<div align="center">

Commbase, short for Communicative Commands Base, is a comprehensive platform designed to empower computers and computer-based devices with cutting-edge conversational AI capabilities. While it includes a flexible and extensible ✨ development framework ✨ at its core, Commbase goes beyond mere development tools. It serves as both a module and library bundler, incorporating third-party Large Language Models (LLMs) to enable advanced features such as "distributed AIs" or "multi-agent systems" (MAS). Commbase adapts across a diverse range of devices, from computers to smart appliances, robots, vehicles, Iron Man-like suits, starships, and beyond, ensuring universal accessibility and functionality. Operating effortlessly on either a single machine or a pair of machines in a client-server architecture, Commbase offers unparalleled adaptability and scalability.

</div>

## Features

| Topic                   | Description                                                                                                                                                          |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ⚙️ Control & Accessibility | Offers multiple methods to start and stop Commbase, including init systems, cron jobs, terminal commands, or voice commands. Provides a terminal-based interface and option for custom UIs.      |
| 🖥️ Multi-pane Support      | Facilitates multitasking and organization within Commbase by providing a versatile workspace with options for navigating between different functionalities.                  |
| 📝 Logging & Recording     | Enables transparent monitoring of system activity, troubleshooting, and security maintenance through the recording of terminal and voice commands, along with secure access control.   |
| 🔧 Configuration           | Simplifies customization of Commbase to meet specific user needs and preferences by offering easy-to-adjust centralized configuration files for built-in options.               |
| 🤖 Advanced Capabilities   | Demonstrates sophistication and cutting-edge AI functionalities by integrating Large Language Models (LLMs) and advanced assistant capabilities such as language understanding and vision. |

For a detailed feature overview, follow this [`link.`](/assets/docs/Detailed%20Feature%20Overview.md)

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
│   ├── ascii
│   ├── docs  # Stores the Commbase User's Guide
│   │   └── images
│   ├── fonts
│   ├── icons
│   └── images
├── bundles  # External software bundle and external asset bundle
│   ├── commbase-data-exchange
│   │   ├── client
│   │   │   └── templates
│   │   └── server
│   │       ├── client_data
│   │       └── templates
│   ├── commbase-llm-google-gemini-p
│   ├── commbase-llm-meta-llama-p
│   ├── commbase-llm-openai-gpt-p
│   ├── commbase-recorder-transmitter-b
│   ├── commbase-recorder-transmitter-s
│   ├── commbase-stt-whisper-proactive-p
│   │   └── examples
│   ├── commbase-stt-whisper-reactive-p
│   │   ├── client_data
│   │   └── examples
│   ├── commbase-tts-gTTS
│   ├── commbase-tts-pyttsx3
│   └── libcommbase
│       ├── examples
│       ├── libcommbase
│       │   ├── interactive
│       │   └── routines
│       └── resources
│           ├── bundles
│           │   └── sounds
│           └── i18n
│               ├── control_patterns
│               │   └── openai_whisper_models
│               │       ├── base
│               │       └── ...
│               ├── discourses
│               ├── log_messages
│               └── skill_patterns
│                   └── openai_whisper_models
│                       ├── base
│                       └── ...
├── certificates  # Stores the security certificates
├── config  # Stores the configuration file
├── data  # Stores the voice recognition model results and other data files
├── env  # Stores the environment file
├── history  # Stores the Commbase commands history
├── i18n  # Stores resources related to localization and internationalization
│   ├── discourses
│   └── log_messages
├── log  # Stores the log messages
├── screenshots  # Stores the image commbase.png
├── scripts  # Stores the scripts for deploying and configuring Commbase, and a few utils
│   ├── configuration
│   │   ├── install_commbase_executable
│   │   └── reset_commbase.conf
│   ├── deployment
│   └── utilities
│       ├── back-up
│       └── bundles
│           └── vu-meter
├── src  # This directory contains user-generated source code
│   ├── client
│   │   ├── assets  # Stores different types of assets, such as images, fonts, and ASCII art
│   │   │   ├── ascii
│   │   │   └── docs  # Stores your app User's Guide
│   │   ├── bundles
│   │   │   ├── audiobooks
│   │   │   │   └── Robinson_Crusoe
│   │   │   └── ...
│   │   ├── config
│   │   ├── i18n
│   │   │   ├── discourses
│   │   │   ├── log_messages
│   │   │   └── skill_patterns
│   │   │       └── openai_whisper_models
│   │   │           ├── base
│   │   │           └── ...
│   │   ├── log
│   │   └── serial_communication
│   │       ├── arduino
│   │       │   ├── arduino_0
│   │       │   │   ├── commbase_hardware_notifications
│   │       │   │   │   ├── speech_to_text_engine_component
│   │       │   │   │   └── ...
│   │       │   │   └── ...
│   │       │   └── ...
│   │       └── ...
│   ├── server
│   │   └── skills_db
│   │       ├── arduino
│   │       ├── bash
│   │       │   └── f
│   │       │       ├── firefox
│   │       │       └── ...
│   │       ├── c++
│   │       ├── java
│   │       ├── multi-lang
│   │       ├── nodejs
│   │       ├── python
│   │       ├── rust
│   │       └── ...
│   └── tests
├── tests  # Stores the Commbase tests
└── user  # Stores previous chat conversations and other user files
    ├── analysis_zone
    └── conversation_logs
```

## Approach and Philosophy

Our software embraces minimalism, the DRY (Don't Repeat Yourself) principle, and KISS (Keep It Simple, Stupid), ensuring streamlined features and eliminating unnecessary repetition for improved efficiency and simplicity, in line with the Unix philosophy.

We adhere to industry-standard best practices in software engineering for design and architecture, ensuring the development of robust, scalable, and maintainable systems that meet the highest quality standards and user expectations.

The open-source nature of our project empowers developers to extend its capabilities by adding more bundles or writing their own code, fostering a collaborative and adaptable environment beyond voice commands.

Additionally, our modular design facilitates flexible customization and extension of functionalities according to user needs. You can also incorporate your unique serial and wireless hardware into our platform, enabling tailored communication and interaction with devices for enhanced versatility and functionality.

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
