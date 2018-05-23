#! /bin/bash

obox-terminal() {
    if [ $(type -t x-terminal-emulator) ]; then
        x-terminal-emulator
    else
        terminator
    fi
}


obox-terminal
