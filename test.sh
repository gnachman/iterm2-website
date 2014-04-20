#!/bin/bash
export PATH="$HOME/bin:$HOME/.gems/bin:$PATH"
export RUBYLIB="$HOME/lib:$RUBYLIB"
export GEM_HOME=$HOME/.gems
./generate_downloads.py > _posts/2013-06-01-downloads.md
jekyll serve
