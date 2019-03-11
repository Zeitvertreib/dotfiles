#! /bin/bash

bunsen-conf() {
    if [ $1 -gt 0 ]; then
        amixer set Master 10%+
    else
        amixer set Master 10%-
    fi
}

manjaro-conf() {
    if [[ $1 -gt 0 ]]; then
        pamixer -i 2
    else
        pamixer -d 2
    fi
}

obox-terminal() {
    echo number $1
    if [ $(type -t amixer) ]; then
        bunsen-conf $1
    else
        echo number $1
        manjaro-conf $1
    fi
}

obox-terminal $1
