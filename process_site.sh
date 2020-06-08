#!/bin/bash
# Slow but makes a really complete backup
# tar cvfz ~/backup`date +%s`.tgz ~/iterm2.com
# Medium speed. Doesn't back up nightly builds or adhoc builds.
tar -c -v -z --exclude=$HOME/iterm2.com/nightly --exclude=$HOME/iterm2.com/adhocbuilds --exclude=$HOME/iterm2.com/adhoc --exclude=$HOME/iterm2.com/misc -f ~/backup`date +%s`.tgz ~/iterm2.com
# Fast but makes an incomplete backup
#tar -c -v -z --exclude=$HOME/iterm2.com/downloads --exclude=$HOME/iterm2.com/nightly --exclude=$HOME/iterm2.com/adhocbuilds --exclude=$HOME/iterm2.com/adhoc --exclude=$HOME/iterm2.com/misc -f ~/backup`date +%s`.tgz ~/iterm2.com
cp -v -n downloads/beta/* ~/iterm2.com/downloads/beta/
export GEM_HOME=$HOME/.gems2
rm -rf ~/iterm2.com_stage
./generate_downloads.py > source/downloads.md
$GEM_HOME/bin/bundle exec jekyll build -d ~/iterm2.com_stage
cp -R source/python-api/_downloads ~/iterm2.com_stage/python-api/_downloads
cd ~/iterm2.com_stage && tar cvfz all.tgz *
cd ~/iterm2.com && tar xvfz ~/iterm2.com_stage/all.tgz
cp ~/iterm2-website/downloads/stable/.htaccess ~/iterm2.com/downloads/stable/.htaccess
cp ~/iterm2-website/source/appcasts/final_new.xml ~/iterm2.com/appcasts/newest/
~/backup-uploader.sh
