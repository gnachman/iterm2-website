#!/bin/bash
# Start a local Jekyll preview server for the iTerm2 website.
#
# Serves the site at http://localhost:4000/ and watches the source
# tree, so edits to .md files and images are rebuilt automatically
# (refresh your browser to see them). Press Ctrl-C to stop.
#
# Requires the bundled gems: run `bundle install` once first.
# (webrick is included for Ruby 3.4+, whose stdlib no longer ships it.)

set -e
cd "$(dirname "$0")"

exec bundle exec jekyll serve --watch --port 4000 "$@"
