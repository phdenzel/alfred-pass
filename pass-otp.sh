#!/bin/bash

set -e

QUERY=$1
PATH=/opt/homebrew/bin:$HOME/.brew/bin:/usr/local/bin:$PATH


#pass otp "$QUERY" | awk 'BEGIN{ORS=""} {print; exit}' | pbcopy
pass otp -c "$QUERY"
osascript -e 'display notification "Copied OTP key to clipboard" with title "Unix pass"'
