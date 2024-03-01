# commbase-stt-whisper-reactive-p

A reactive version of STT engine with remote for Commbase.

[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Python Version](https://img.shields.io/badge/Python-3.10%20%7C%203.11%20%7C%203.12-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11%20%7C%203.12-blue)

commbase-stt-whisper-reactive-p is an ASR (Automatic Speech Recognition) engine. It is capable of converting spoken language into written text for any application that needs speech-to-text functionality. It packages a remote app that sends voice messages over SSH (Secure Shell), wirelessly through networks to a Commbase Whisper in the local machine or in a remote host, making it a reliable and secure solution for any application that needs speech-to-text functionality.

Reactive means the engine is always lazily listening, processing the voice messages only when they arrive. Therefore, engine has 2 strokes: passive and processing.

<img alt="commbase-stt-whisper-reactive-p" src="commbase-stt-whisper-reactive-p.jpg?raw=true" width="512" height="512" />

## Examples

Detailed information about examples can be found in the corresponding [`examples`](./examples) directory.

## Contributors

Thanks to the following people who have contributed to this project:

* [@estebanways](https://github.com/estebanways)

## Contact

If you want to contact us you can reach us at <stv.herrera@gmail.com>.

## License

This project uses the following license: [`License`](./COPYING).
