#!/bin/sh

for F in "$@"; do
  cat $F | grep '\\includegraphics' | grep -v ^% | cut -d{ -f2 | cut -d} -f1
  cat $F | grep '\\addplot' | grep -v ^% | cut -d{ -f2 | cut -d} -f1
done
