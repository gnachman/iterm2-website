#! /bin/bash

# checks that the sequence parser does ignore unknown sequences properly.

testcase()
{
    printf '»'
    printf '\033[%s0%s_' "$1" "$2"
    printf '«\n'
}


echo "Check the following lines contain exactly '»«' and nothing else."
for i in '' '=' ; do
    testcase "$i" ' '
    testcase "$i" '"'
    testcase "$i" '$'
    testcase "$i" "'"
    testcase "$i" '*'
done

# OSC
printf '»\033]1415934836;OSC\033\\«\n'

