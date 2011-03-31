#!/bin/bash
tar cvfz ~/backup`date +%s`.tgz ~/iterm2.com
export PATH="$HOME/bin:$HOME/.gems/bin:$PATH"
export RUBYLIB="$HOME/lib:$RUBYLIB"
export GEM_HOME=$HOME/.gems
jekyll --no-auto ~/iterm2.com
