#!/bin/bash
export GEM_HOME=$HOME/.gems2
rm -rf ~/iterm2.com_stage
./generate_downloads.py > source/downloads.md
$GEM_HOME/bin/bundle exec jekyll build -d ~/iterm2.com_stage
cd ~/iterm2.com_stage && tar cvfz all.tgz *
cd ~/iterm2.com && tar xvfz ~/iterm2.com_stage/all.tgz
cp ~/iterm2-website/downloads/stable/.htaccess ~/iterm2.com/downloads/stable/.htaccess
