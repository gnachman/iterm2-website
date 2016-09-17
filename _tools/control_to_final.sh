#!/bin/bash
set -x

cd ~
rm -f ~/final.xml
VERSION=$(~/get_control_version.py)
UNDERSCORE_VERSION=$(echo $VERSION | tr . _)
cp iterm2-website/downloads/beta/iTerm2-$UNDERSCORE_VERSION* iterm2-website/downloads/stable/

echo Remove the word beta
sleep 2

vi iterm2-website/downloads/stable/iTerm2-$UNDERSCORE_VERSION.description
vi iterm2-website/downloads/stable/iTerm2-$UNDERSCORE_VERSION.summary
cp iterm2-website/downloads/stable/iTerm2-$UNDERSCORE_VERSION.changelog iterm2-website/source/appcasts/full_changes.txt

./copy_control_appcast_to_final_appcast.py > ~/final.xml
echo '<?xml version="1.0" encoding="utf-8"?>' > iterm2-website/source/appcasts/final.xml
cat ~/final.xml >> iterm2-website/source/appcasts/final.xml

