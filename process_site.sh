#!/bin/bash
tar cvfz ~/backup`date +%s`.tgz ~/iterm2.com
export PATH="$HOME/bin:$HOME/.gems/bin:$PATH"
export RUBYLIB="$HOME/lib:$RUBYLIB"
export GEM_HOME=$HOME/.gems
rm -rf ~/iterm2.com_stage
./generate_downloads.py > source/downloads.md
jekyll build -d ~/iterm2.com_stage
cd ~/iterm2.com_stage && tar cvfz all.tgz *
cd ~/iterm2.com && tar xvfz ~/iterm2.com_stage/all.tgz
