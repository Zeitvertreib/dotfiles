#! /bin/bash

obox-run() {
    if [ $(type -t gmrun) ]; then
        gmrun
    else
        dmenu_extended_run
    fi
}


obox-run
