# commbase-tts-pyttsx3

[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Python Version](https://img.shields.io/badge/Python-3.10%20%7C%203.11%20%7C%203.12-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11%20%7C%203.12-blue)

commbase-tts-pyttsx3 is a Python application that utilizes text-to-speech capabilities to read out the content of a file or any input text provided. It uses the pyttsx3 library for text-to-speech functionality.

<img alt="commbase-tts-pyttsx3" src="commbase-tts-pyttsx3.jpg?raw=true" width="512" height="512" />

## Usage

To use the commbase_tts_pyttsx3.py app, you can follow these examples:

### Example 1: Reading from a file

```sh
cat file.txt | python commbase_tts_pyttsx3.py
```

This command reads the content of the file.txt file and passes it as input to the commbase_tts_pyttsx3.py script. The script converts the text to speech and plays it back.

### Example 2: Providing input directly
```sh
echo "Hello World\!" | python3.11 commbase_tts_pyttsx3.py --rate 145 --voice-index 18
```

This command provides the input text "Hello World!" directly to the commbase_tts_pyttsx3.py script using the specified rate and voice index to convert the text into speech and play it back.

Make sure to have Python 3.x installed on your system and the required dependencies (fileinput, os.path, and pyttsx3) properly installed before running the commands above.

## Contributors

Thanks to the following people who have contributed to this project:

* [@estebanways](https://github.com/estebanways)

## Contact

If you want to contact us you can reach us at <stv.herrera@gmail.com>.

## License

This project uses the following license: [`License`](./COPYING).
