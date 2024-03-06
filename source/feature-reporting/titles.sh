#!/bin/bash

do_test()
{
    CODE="$1"
    KIND="$2"

    FIRST=$RANDOM"0"
    printf "\e]${CODE};${FIRST}\e\\"
    echo "The ${KIND} title should be \"${FIRST}\". If it is then you can set the title with OSC ${CODE}. Otherwise, press ^C to quit now."
    read x

    SECOND=$RANDOM"2"
    printf "\e[22;${CODE}t"
    printf "\e]${CODE};${SECOND}\e\\"

    echo "The ${KIND} title should be \"${SECOND}\". Verify and press enter. Otherwise, press ^C to quit now."
    read x

    printf "\e[23;${CODE}t"
    echo "The ${KIND} title should be \"${FIRST}\". If it is then you can push and pop the ${KIND} title with CSI 22/23 ; ${CODE} t."
    echo "Press enter to continue."
    read x
}

do_test 0 "window and icon"
do_test 1 icon
do_test 2 window
