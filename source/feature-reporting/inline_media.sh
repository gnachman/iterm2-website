#!/bin/bash

# Copyright 2020 George Nachman
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software without
# specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

function print_osc() {
    printf "\033]"
}

function print_st() {
    printf "\a"
}

function load_version() {
    if [ -z ${IMGCAT_BASE64_VERSION+x} ]; then
        export IMGCAT_BASE64_VERSION=$(base64 --version 2>&1)
    fi
}

function b64_encode() {
    load_version
    if [[ "$IMGCAT_BASE64_VERSION" =~ GNU ]]; then
        # Disable line wrap
        base64 -w0
    else
        base64
    fi
}

function b64_decode() {
    load_version
    if [[ "$IMGCAT_BASE64_VERSION" =~ fourmilab ]]; then
      BASE64ARG=-d
    elif [[ "$IMGCAT_BASE64_VERSION" =~ GNU ]]; then
      BASE64ARG=-di
    else
      BASE64ARG=-D
    fi
    base64 $BASE64ARG
}

function error() {
    echo "ERROR: $*" 1>&2
}

## Main

if [ -t 0 ]; then
    has_stdin=f
else
    has_stdin=t
fi

function up() {
  printf "\033[%dA" $1
}

function right() {
  printf "\033[%dC" $1
}

function width() {
  s=$(printf "%-$1s" "-")
  echo "${s// /-}"
}

function outline() {
    width $1
    up 1
    up $2
    seq $2 | sed -e "s/.*/$(right $1)|/"
    echo ""
    echo ""
}

kitten=$(cat kitten.jpg | base64)

# $1 name=filename or empty string to omit
# $2 content
# $3 width=auto|<integer>px|<integer>
# $4 height=auto|<integer>px|<integer>
# $5 preserveAspectRatio=<bool>
# $6 expected width
# $7 expected height

function send() {

    print_osc
    printf '1337;File='
    if [[ -n "$1" ]]; then
      printf "name=%s" $(printf "%s" "$1" | /usr/bin/base64)
    fi
    printf "%s" "$2" | b64_decode | wc -c | awk '{printf ";size=%d",$1}'
    if [[ -n "$3" ]]; then
        printf ";width=%s" "$3"
    fi
    if [[ -n "$4" ]]; then
        printf ";height=%s" "$4"
    fi
    if [[ -n "$5" ]]; then
        printf ";preserveAspectRatio=%s" "$5"
    fi
    printf ";inline=1"
    printf ":"
    printf "%s" "$2"
    print_st
    printf '\n'

    outline $6 $7

}

function send_no_outline() {

    print_osc
    printf '1337;File='
    if [[ -n "$1" ]]; then
      printf "name=%s" $(printf "%s" "$1" | /usr/bin/base64)
    fi
    printf "%s" "$2" | b64_decode | wc -c | awk '{printf ";size=%d",$1}'
    if [[ -n "$3" ]]; then
        printf ";width=%s" "$3"
    fi
    if [[ -n "$4" ]]; then
        printf ";height=%s" "$4"
    fi
    if [[ -n "$5" ]]; then
        printf ";preserveAspectRatio=%s" "$5"
    fi
    printf ";inline=1"
    printf ":"
    printf "%s" "$2"
    print_st

}

echo "Set terminal to 185 cells wide, 55 rows tall. Use a font with a cell size of 7x13.
echo "-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"

# These commented-out tests are for scroll regions. They need to be run by themselves after clearing the screen. Uncomment one and add "exit 0" after it.

#echo "left-right margin from 10 to 50, image of width 60"
#echo -n "[?69h[10;50s          "
#echo ""
#echo ""
#echo ""
#echo ""
#send "test1" "$kitten" 60 auto 1 40 10
#echo -n "[?69l"

#echo "left-right margin from 10 to 50, image of width 60, cursor outside"
#echo -n "[?69h[10;50s"
#echo ""
#echo ""
#echo ""
#echo ""
#send "test1" "$kitten" 60 auto 1 40 10
#echo -n "[?69l"

# Note: no outline here. The result should be the lowest 21 rows of the image.
#echo "top-bottom margin from 10 to 30, cursor inside"
#echo -n "[?69h[10;30r[10;1H"
#send_no_outline "test1" "$kitten" auto 40 1 100 20
#echo -n "[?69l;[r"

echo Test different width/height modes preserving aspect ratio

echo width=auto, height=auto
send "test1" "$kitten" auto auto 1 147 53

echo width=100 cells, height=auto
send "test1" "$kitten" 100 auto 1 100 35

echo width=70px, height=auto
send "test1" "$kitten" 70px auto 1 10 3

echo width=20%, height=auto
send "test1" "$kitten" 20% auto 1 37 13


echo width=auto, height=10 cells
send "test1" "$kitten" auto 10 1 28 10

echo width=100 cells, height=10 cells
send "test1" "$kitten" 100 10 1 100 10

echo width=70px, height=10 cells
send "test1" "$kitten" 70px 10 1 10 10

echo width=20%, height=10 cells
send "test1" "$kitten" 20% 10 1 37 10


echo width=auto, height=65px
send "test1" "$kitten" auto 65px 1 13 5

echo width=100 cells, height=65px
send "test1" "$kitten" 100 65px 1 100 5

echo width=70px, height=65px
send "test1" "$kitten" 70px 65px 1 10 5

echo width=20%, height=65px cells
send "test1" "$kitten" 20% 65px 1 37 5


echo width=auto, height=20%
send "test1" "$kitten" auto 20% 1 30 11

echo width=100 cells, height=20%
send "test1" "$kitten" 100 20% 1 100 11

echo width=70px, height=20%
send "test1" "$kitten" 70px 20% 1 10 11

echo width=20%, height=20% cells
send "test1" "$kitten" 20% 20% 1 37 11

# --

echo Test different width/height modes stretching

echo width=auto, height=auto
send "test1" "$kitten" auto auto 0 147 53

echo width=100 cells, height=auto
send "test1" "$kitten" 100 auto 0 100 35

echo width=70px, height=auto
send "test1" "$kitten" 70px auto 0 10 3

echo width=20%, height=auto
send "test1" "$kitten" 20% auto 0 37 13


echo width=auto, height=10 cells
send "test1" "$kitten" auto 10 0 28 10

echo width=100 cells, height=10 cells
send "test1" "$kitten" 100 10 0 100 10

echo width=70px, height=10 cells
send "test1" "$kitten" 70px 10 0 10 10

echo width=20%, height=10 cells
send "test1" "$kitten" 20% 10 0 37 10


echo width=auto, height=65px
send "test1" "$kitten" auto 65px 0 13 5

echo width=100 cells, height=65px
send "test1" "$kitten" 100 65px 0 100 5

echo width=70px, height=65px
send "test1" "$kitten" 70px 65px 0 10 5

echo width=20%, height=65px cells
send "test1" "$kitten" 20% 65px 0 37 5


echo width=auto, height=20%
send "test1" "$kitten" auto 20% 0 30 11

echo width=100 cells, height=20%
send "test1" "$kitten" 100 20% 0 100 11

echo width=70px, height=20%
send "test1" "$kitten" 70px 20% 0 10 11

echo width=20%, height=20% cells
send "test1" "$kitten" 20% 20% 0 37 11

# --

echo width=370, height=10, preserve aspect ratio
send "test1" "$kitten" 370 10 1 185 5

echo width=370, height=10, stretch
send "test1" "$kitten" 370 10 0 185 5

# overheight is too hard to verify with this mechanism, so these are commented out.
#echo width=185, height=510, preserve aspect ratiok
#send "test1" "$kitten" 185 510 1 93 255 

#echo width=185, height=510, stretch
#send "test1" "$kitten" 185 510 1 93 255 

# -- 

echo Test sixel

cat snake.six
echo ""
outline 43 18

echo Broken image
send "test1" $(echo hello world | base64) auto auto 1 3 2

exit 0
