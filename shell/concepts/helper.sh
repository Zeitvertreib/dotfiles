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

sym_backup_file(){
    # replace a file with a symlink (preserve org file) and save the old file
    # shopt -s extglob
    local target_org_file=$1
    local injection=$2
    local msg=$@
    local now=$(date +"%m_%d_%Y")

    if [[ $2 == undo ]]; then
        echo $target_org_file
        echo from sym_backup_file '$2: '$2
        mv ${target_org_file}_[0-9]* $target_org_file
        return
    fi

    if [ -f $target_org_file ] && [ ! -L $target_org_file ]; then
        mv $target_org_file ${target_org_file}_$now
        ln -s $injection $target_org_file
        echo "$msg"
    fi
}

function _compgen_setup
{
    local cmd=$1 cur=$2 pre=$3
    commands="tint2 openbox conky"
    # declare -a commands=(tint2 openbox conky)

    if [[ $pre == "$cmd" ]]; then
        # COMPREPLY=( $(compgen -W "pos1a-example pos1b-example" -- "$cur") )
        COMPREPLY=( $(compgen -W "${commands[@]}" -- "$cur") )
        return
    fi

    if [[ $pre == pos1* ]]; then
        COMPREPLY=( $(compgen -W "${commands[@]}" -- "$cur") )
        # COMPREPLY=( $(compgen -W "pos2a-example pos2b-example" -- "$cur") )
        return
    fi
}

setup(){
    if [[ -e $DIR/DE/$1/distribute ]]; then
        echo distribute found
        . $DIR/DE/$1/distribute $@
    else
        echo $DIR/DE/$1/distribute not found
    fi
    }

complete -F _compgen_setup setup

faeria_shoot() {
    local folder=~/tmp/syms/decks_faeria
    cd $folder
    local name
    read -p "Deckname: " name
    faeria_crop $name
    sleep 1s
    faeria_link $name\_s.png
    }

faeria_link() {
    # local folder=~/tmp/syms/decks_faeria
    local target=$1
    ln -sf $target in_use.png
    }

faeria_crop() {
    local folder=~/tmp/syms/decks_faeria
    cd $folder
    local output_img=$1
    scrot "$output_img.png" -q 100
    # local input_img=$1;
    convert $output_img.png -crop 240x510+2530+20 +repage $output_img\_s.png;
    convert $output_img.png -crop 260x530+2520+10 +repage $output_img\_l.png;
    }

faeria_collection() {
    local now=$(date +"%m%d%Y_%l_%M")
    local folder=~/tmp/syms/decks_faeria
    cd $folder
    local format=${1-s}
    files=(*$format.png)
    echo $format \| echo ${files[@]}
    convert ${files[@]} +append large-$now.png
    }
