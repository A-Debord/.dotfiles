#!/bin/bash

layout=$(setxkbmap -print | tr -d "\n" | sed -E "s/.*xkb_symbols\s*\{ include \"\w+\+(\S+?)\+.*/\1\n/")

#Check equality two string variables

if [ $layout = "fr" ]; then
  setxkbmap -layout us -variant intl
else
  setxkbmap fr
fi
