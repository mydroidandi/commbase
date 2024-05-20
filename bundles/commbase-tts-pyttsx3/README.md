[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Python Version](https://img.shields.io/badge/Python-3.10%20%7C%203.11%20%7C%203.12-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11%20%7C%203.12-blue)

# commbase-tts-pyttsx3

<img alt="commbase-tts-pyttsx3" src="commbase-tts-pyttsx3.jpg?raw=true" width="512" height="512" />

commbase-tts-pyttsx3 is a Python application that utilizes text-to-speech capabilities to read out the content of a file or any input text provided. It uses the pyttsx3 library for text-to-speech functionality. This application supports multiple languages, allowing you to generate speech in various languages by adjusting the language settings of the text-to-speech engine.

## Languages and variants supported

The specific languages and variants available depend on the text-to-speech voices installed on your system. Here are some common examples:

- **Chinese (zh):**
  - zh_CN (Mandarin Chinese as spoken in Mainland China)
  - zh_TW (Mandarin Chinese as spoken in Taiwan)
  - zh_HK (Cantonese as spoken in Hong Kong)

- **English (en):**
  - en_US (American English)
  - en_GB (British English)

- **French (fr):**
  - fr_FR (French as spoken in France)
  - fr_CA (Canadian French)

- **German (de):**
  - de_DE (German as spoken in Germany)
  - de_AT (Austrian German)
  - de_CH (Swiss German)

- **Italian (it):**
  - it_IT (Italian as spoken in Italy)

- **Japanese (ja):**
  - ja_JP (Japanese as spoken in Japan)

- **Korean (ko):**
  - ko_KR (Korean as spoken in South Korea)

- **Portuguese (pt):**
  - pt_PT (European Portuguese)
  - pt_BR (Brazilian Portuguese)

- **Russian (ru):**
  - ru_RU (Russian as spoken in Russia)

- **Spanish (es):**
  - es_ES (European Spanish)
  - es_LA (Latin American Spanish)

- ... and many more

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

## Examples

Detailed information about examples can be found in the corresponding [`examples`](./examples) directory.

## Contributors

Thanks to the following people who have contributed to this project:

* [@estebanways](https://github.com/estebanways)

## Contact

If you want to contact us you can reach us at <stv.herrera@gmail.com>.

## License

This project uses the following license: [`License`](./COPYING).
