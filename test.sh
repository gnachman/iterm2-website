#!/bin/bash
test `hostname` = bryan && (cp _gemfiles/* .)
cp source/appcasts/* ~/iterm2.com/misc
cp -v -n downloads/beta/* ~/iterm2.com/downloads/beta/
cp -i -v -n downloads/stable/* ~/iterm2.com/downloads/stable/
export GEM_HOME=$HOME/.newgems
./generate_downloads.py > source/downloads.md
bundle exec jekyll serve --trace
