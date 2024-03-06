#! /bin/bash

# checks that the sequence parser does not alias distinct sequences to the same meaning.

testcase()
{
    printf '\033[%s31%smx\033[0m' "$1" "$2"
}


echo "Check that no letter in the next lines are red. And each is a row of only 'x'."
for i in '' '?' '>' '=' '<' ; do
    testcase "$i" ' '
    testcase "$i" '!'
    testcase "$i" '"'
    testcase "$i" '#'
    testcase "$i" '$'
    testcase "$i" '%'
    testcase "$i" '&'
    testcase "$i" "'"
    testcase "$i" '('
    testcase "$i" ')'
    testcase "$i" '*'
    testcase "$i" '+'
    testcase "$i" ','
    testcase "$i" '-'
    testcase "$i" '.'
    testcase "$i" '/'
    printf '\n'
done

testcase '?>' '&'
testcase '?>' ''
testcase '' '&#####'
testcase '?<' " !\"#$%&'()*+,-./"

printf '\n'
