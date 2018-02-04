#!/bin/bash
export GEM_HOME=$HOME/.newgems
./generate_downloads.py > source/downloads.md
bundle exec jekyll serve --trace
