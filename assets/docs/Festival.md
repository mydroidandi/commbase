# Festival Installation and Basic Configuration for Commbase Applications

In this document, we will use Debian GNU/Linux to demonstrate the installation steps, but you can use any of your preferred distros and have the same result.


## Installation

```sh
sudo apt-get update
```

```sh
sudo apt-get install festival
```

## Installation test

```sh
echo "hello" | festival --tts
```

## List the voices available

```sh
festival
```

You will see the REPL interactive shell prompt.

festival>

Type in `(voice.list)` and press `Enter`.

You will have the next output:

(kal_diphone)

Exit the interactive shell.

```sh
(exit)
```

## Install extra voices

You can install voices from many internet sources, rather than the official distribution repositories.

Search for new voices in English.

```sh
apt-cache search mbrola | grep "us"
```

Install specific (US English) voices.

```sh
sudo apt-get install festvox-us1 festvox-us2 festvox-us3
```

List the voices available.

```sh
festival
```

Type in `(voice.list)` and press `Enter`.

You will have the next output:

(kal_diphone us1_mbrola us2_mbrola us3_mbrola)

These are the different voices to choose from.

## Test your new voice tones (voice packages)

Once in the interactive shell, you have to add the prefix "voice_" to a voice from the voices list.

```sh
(voice_us1_mbrola)
```

Now your voice is changed.

Test the new voice using the next prompt commands:

```sh
(SayText "Hello from Ubuntu")
(tts "story.txt" nil)
(intro)
(exit)
```

## Set a voice tone as default

Set up the new voice in the festival configuration file **/etc/festival.scm**.

```sh
sudo cp -dpR /etc/festival.scm /etc/festival.scmBAK
```

And as root, do:

```sh
nano /etc/festival.scm
```

Or as user, use:

```sh
$ sudo nano /etc/festival.scm
```

Attach the next line to the end of the file:

```code
(set! voice_default 'voice_us1_mbrola)
```

Save changes made.

## Test the complete installation:

```sh
echo "Hi, How are you doing? This is Esteban, but you can call me Steve" | festival --tts
```

Verify that the sentence above is spoken using the new voice defined in the config file.

