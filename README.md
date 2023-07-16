# An Alfred 5 Workflow for Pass

This is an Alfred 5 workflow for [Pass - the standard Unix password manager](https://www.passwordstore.org/) 
(in order to use workflows with Alfred 5 you will have to purchase a user license).
It's based on [passmenu](http://git.zx2c4.com/password-store/tree/contrib/dmenu/passmenu), which is available for Linux.


## Setup

To make this work you need:
* [Pass](https://www.passwordstore.org/) (see homebrew)
* `gpg-agent` (see homebrew)
* `pinentry-mac` (see homebrew)
* (optionally) `fuzzywuzzy` and `python-Levenshtein` python packages

Next configure `gpg-agent` to use `pinentry-mac` and not the bundled one, editing `~/.gnupg/gpg-agent.conf`:

```
pinentry-program /usr/local/bin/pinentry-mac
```

If you prefer to keep the terminal version of `pinentry` you can use the
`pinentry.sh` wrapper from this repository as the `pinentry-program`. This will
use the ncurses version when in console and the GUI version for Alfred etc.


### GPG tweaking

You can tweak some of the `gpg-agent` settings in `~/.gnupg/gpg-agent.conf`:

```
max-cache-ttl 7200
```

After 7200 seconds, GPG will forget your master password.

## Installation

Make sure the prerequisites have been properly installed before you continue, e.g.
```bash
brew install pass pass-otp pinentry-mac
pip install fuzzywuzzy python-Levenshtein
```

Then, clone this repository and build the Alfred workflow
``` bash
git clone git@github.com:phdenzel/alfred-pass.git
cd alfred-pass && make
```
Locate the file `pass.alfredworkflow` in Finder, right-click on it and choose 'Open With -> Alfred'.
You will be prompted to install the workflow, so go ahead.


## Usage

Basic Alfred commands:

## `pass <filter terms>`

This will search through your passwords using the filter terms you provided.

The password will be copied to clipboard and cleared after 45 seconds (this is the default
`pass -c` behavior).  You can change that time by modifying the env variable
`PASSWORD_STORE_CLIP_TIME`. Or in the `pass-show.sh` file you can change this line

```
pass show -c $QUERY
```

into this one

```
pass show $QUERY | awk 'BEGIN{ORS=""} {print; exit}' | pbcopy
```

to aviod auto-clearing of clipboard.

## `pg <id>`

Calls `pass generate` to add a new password with default length of 20 chars.

## `po <filter terms>`

This will search through your OTP passwords (requires `pass-otp`) using the filter terms you provided.
