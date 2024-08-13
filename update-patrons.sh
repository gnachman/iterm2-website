#!/bin/bash
scp source/patrons.txt bryan:iterm2.com/patrons.txt
echo -n 'https://iterm2.com/patrons.txt' | pbcopy
#open 'https://dash.cloudflare.com/fd2981af5d94d04f7535c150ada305bc/iterm2.com/caching/configuration'
