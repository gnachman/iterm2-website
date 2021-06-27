#!/bin/bash
cp source/appcasts/* ~/iterm2.com/misc
cp -v -n downloads/beta/* ~/iterm2.com/downloads/beta/
cp -i -v -n downloads/stable/* ~/iterm2.com/downloads/stable/
export GEM_HOME=$HOME/.gems2
./copy-shell-integration.sh
./generate_downloads.py > source/downloads.md
$GEM_HOME/bin/bundle exec jekyll build
