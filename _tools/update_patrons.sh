#!/bin/bash
function die() {
  echo "$1"
  exit 1
}
test -f source/patrons.txt || die "Run from parent of _tools directory"
test -f "$1" || die "Can't find $1"
N=$(csvcut -l -c 0 $1 | fgrep "5 + Reward" | cut -f1 -d,)
csvcut -c 1,2 "$1" | head -n $N | tail -n +3 | tr , " " | sed -e 's/  *$//' | sort -f > source/patrons.txt
