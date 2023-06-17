# Festival Installation and Basic Configuration for Commbase Applications

In this document, we will use Debian GNU/Linux to demonstrate the installation steps, but you can use any of your preferred distros and have the same result.

## System update

```sh
sudo apt-get update
```

You can also upgrade like this:

```sh
sudo apt-get -u upgrade
```

## Installation

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

Now, you see the REPL interactive shell.

```code
festival>
```

Type in (voice.list) and press enter.

You will have the next output:

```log
(kal_diphone)
```

Exit the interactive shell.

```sh
festival> (exit)
```

## Install extra voices

Search for voices in English.

```sh
apt-cache search mbrola | grep "us"
```

Install specific (US English) voices.

```sh
sudo apt-get install festvox-us1 festvox-us2 festvox-us3
```

List the voices available.

```sh
$ festival
```

Now, you see the REPL interactive shell:

```sh
festival>
```

Type in (voice.list) and press enter.

You will have the next output:

```log
(kal_diphone us1_mbrola us2_mbrola us3_mbrola)
```

These are the different voices to choose from.

## Test your new voice tones (voice packages)

Once in the interactive shell, you have to add the prefix "voice_" to a voice from the voices list.

```sh
(voice_us1_mbrola)
(SayText "Hello from Ubuntu")
(tts "story.txt" nil)
(intro)
(exit)
```

Now your voice is changed.

You can also install voices from alternative internet sources available.

## Set a voice tone as default

Set up the new voice in the festival configuration file **/etc/festival.scm**.

```sh
sudo cp -dpR /etc/festival.scm /etc/festival.scmBAK
# nano /etc/festival.scm

Or as user, use:

```sh
$ sudo nano /etc/festival.scm
```

Attach the next line to the end of the file:

```code
(set! voice_default 'voice_us1_mbrola)
```

Save changes made.

## Test the completed installation:

```sh
echo "Hi, How are you doing? This is Esteban, but you can call me Steve" | festival --tts
```

Verify that the sentence above is spoken using the new voice defined in the config file.

