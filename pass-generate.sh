#!/bin/bash

set -e

QUERY=$1
PATH=/opt/homebrew/bin:$HOME/.brew/bin:/usr/local/bin:$PATH

pass generate "$QUERY" 32 -c 
