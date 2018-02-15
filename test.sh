#!/bin/bash
cp -v -n downloads/beta/* ~/iterm2.com/downloads/beta/
export GEM_HOME=$HOME/.newgems
./generate_downloads.py > source/downloads.md
bundle exec jekyll serve --trace
