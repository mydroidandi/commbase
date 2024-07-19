[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Python Version](https://img.shields.io/badge/Python-3.10%20%7C%203.11%20%7C%203.12-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11%20%7C%203.12-blue)

# commbase-text-translator-phi3-mini

<img alt="commbase-text-translator-phi3-mini" src="commbase-text-translator-phi3-mini.jpg?raw=true" width="384" height="384" />

Translates text from one language to another using the Ollama API with a specific MS Phi3 language model (commbase-phi3-mini).

## Language Translation Capabilities

As an AI developed by Microsoft, Phi3 is capable of translating text across many languages. Phi3's language translation abilities are built upon a diverse dataset and advanced natural language processing algorithms that support numerous language pairs, including but not limited to:

- English (en) - Spanish (es)
- English (en) - French (fr)
- English (en) - German (de)
- English (en) - Chinese (zh)
- English (en) - Arabic (ar)
- English (en) - Italian (it)
- Japanese (ja) - Korean (ko)
- Russian (ru) - Ukrainian (uk)

These translations help facilitate communication across different linguistic backgrounds. It is important to note, however, that while Phi3 strives for accuracy and fluency in translation, its translations may not always capture the full cultural nuance or tone of human language due to inherent complexities within languages.

If you are uncertain about Phi3's translation capabilities for specific language pairs, feel free to inquire Phi3 for additional options.

## Phi3 Mini 4k/128k Instruct Models

commbase-text-translator-phi3-mini works seamlessly with Phi3 Mini 4k/128k context window models. Please verify compatibility with other model variants or adjust your prompting accordingly.

## Editions

- **commbase_text_translator_phi3_mini_literals.py**:
  - It accepts three command-line arguments: the text to translate, the source language, and the target language.
  - Examples:
    - Using literals:

       ```shell
       python commbase_text_translator_phi3_mini_literals.py """Your text containing "quotes" and 'single quotes'.""" english spanish
       ```
    - Escaping characters:

       ```shell
       python commbase_text_translator_phi3_mini_literals.py "Your text containing \"quotes\" and 'single quotes'." English Spanish
       ```

- **commbase_text_translator_phi3_mini_file.py**:
  - It accepts three command-line arguments: the path to the file with the text to translate, the source language, and the target language.
  - Example usage:
    - Appending output to a file:

       ```shell
       python commbase_text_translator_phi3_mini_file.py resources/text-to-translate.txt English Spanish >> translation.txt
       ```

## Examples

Detailed information about examples can be found in the corresponding [`examples`](./examples) directory.

## Contributors

Thanks to the following people who have contributed to this project:

* [@estebanways](https://github.com/estebanways)

## Contact

If you want to contact us you can reach us at <stv.herrera@gmail.com>.

## License

This project uses the following license: [`License`](./COPYING).
