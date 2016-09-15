#!/bin/bash
set -x
echo 'Redirect 302 /nightly/latest http://www.iterm2.com/nightly/'$1 > ~/iterm2.com/nightly/.htaccess
ln -s ~/iterm2.com/nightly/*zip ~/iterm2.com/downloads/nightly/
true
