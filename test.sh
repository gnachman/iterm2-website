#!/bin/bash
cp source/appcasts/* ~/iterm2.com/misc
# Builds with the NoSyncSoftwareUpdateTestFeed user default read these staged
# appcasts. Prefix each version with 99999. so an installed build is offered
# the release it is being tested against even when that is its own version.
# The update's signature covers only the zip, and Sparkle's downgrade check
# reads the version inside the downloaded app, so this changes nothing else.
# Prefixing rather than replacing keeps items in order within each appcast.
perl -pi -e 's/sparkle:version="(?!99999\.)/sparkle:version="99999./g' ~/iterm2.com/misc/*.xml
cp -v -n downloads/beta/* ~/iterm2.com/downloads/beta/
cp -i -v -n downloads/stable/* ~/iterm2.com/downloads/stable/
export GEM_HOME=$HOME/.gems2
./copy-shell-integration.sh
./generate_downloads.py > source/downloads.md
$GEM_HOME/bin/bundle exec jekyll build
