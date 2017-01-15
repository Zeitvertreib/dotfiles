#!/bin/bash
zenti_color(){
    local value=$(zenity --color-selection --show-palette)
    # local v1=${value}
    echo $v1
    local prefix=${value:3:4}
    local suffix=${value:9:2}
    # echo prefix $prefix
    # echo suffix $suffix
    local word=$prefix$suffix
    echo $word
}

