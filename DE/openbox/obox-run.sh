#! /bin/bash

obox-run() {
    if [ $(type -t gmrun) ]; then
        gmrun
    else
        rofr.sh -r
    fi
}


obox-run
