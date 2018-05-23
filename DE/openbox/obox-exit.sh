#! /bin/bash

obox-exit() {
    if [ $(type -t bl-exit) ]; then
        bl-exit
    fi
    if [ $(type -t oblogout) ]; then
        oblogout
    fi
}


obox-exit
