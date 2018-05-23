#! /bin/bash

filemanager() {
    if [ $(type -t bl-file-manager) ]; then
        bl-file-manager
    else
        pcmanfm
    fi
}

filemanager
