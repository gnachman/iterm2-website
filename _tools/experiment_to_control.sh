#!/bin/bash
cd ~
rm -f ~/testing.xml
./copy_experiment_appcast_to_testing_appcast.py > ~/testing.xml
echo '<?xml version="1.0" encoding="utf-8"?>' > iterm2-website/source/appcasts/testing.xml
cat ~/testing.xml >> iterm2-website/source/appcasts/testing.xml
vi iterm2-website/source/appcasts/testing_changes.txt
