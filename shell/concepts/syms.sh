#!/bin/bash

# koente besser sein, funzt aber

# export PATH="$CDPATH:$(<$HOME/tmp)"
# echo $CDPATH
function _compgen_work
{   
    local cmd=$1 cur=$2 pre=$3
    # local dir="$(~/gg/)"

    gg=$(ls ~/tmp/syms/)
    # gg=$(ls $dir)
    if [[ $pre == "$cmd" ]]; then
        # COMPREPLY=( $(compgen -W "pos1a-example pos1b-example" -- "$cur") )
        COMPREPLY=( $(compgen -W "$gg add" -- "$cur") )
        return
    fi

    if [[ $pre == pos1* ]]; then
        COMPREPLY=( $(compgen -W "$gg add" -- "$cur") )
        # COMPREPLY=( $(compgen -W "pos2a-example pos2b-example" -- "$cur") )
        return
    fi
}

complete -F _compgen_work gg

cd() {
    local gg="$HOME/tmp/syms"
    if [[ $1 == "gg" && ! -d "gg" ]]; then
        cd $gg;
    else
        builtin cd $1
    fi
}

gg() {
    local gg="$HOME/tmp/syms"
    local from=$(pwd -P)
    local eingang="${from##*/}"

    if [[ $1 == "" ]]; then
        ls -lh $gg;
        return;
    fi

    if [[ -L $gg/$1 ]]; then
        # catch remove
        if [[ $2 == "rm" ]]; then
            rm $gg/$1;
        else
                # triggers only on absolute path
            cd $gg/$1;
            cd $(pwd -P);
        fi
    fi

    if [[ $1 == "add" ]]; then
        # $2 is traded as special mark, to prevent duplicates
        # $2 can be ommited
        (ln -s $PWD $gg/${eingang}_$2)
    fi

    # make the folder.. when run the first time only
    if [[ ! -d $gg ]]; then
        mkdir $gg
    fi

}

function sib() {
    # from http://unix.stackexchange.com/questions/41214/how-can-i-cd-to-the-previous-next-sibling-directory
    ## sib  search sibling directories 
    ##   prompt for choice (when two or more directories are found, current dir is removed from choices) 
    ##   change to directory after selection 
    local substr=$1
    local curdir=$(pwd)
    local choices=$(find .. -maxdepth 1 -type d -name "*${substr}*" | grep -vE '^..$' | sed -e 's:../::' | grep -vE "^${curdir##*/}$" | sort)
    if [ -z "$choices" ]; then
        echo "Sibling directory not found!"
        return
    fi
    local count=$(echo "$choices" | wc -l)
    if [[ $count -eq 1 ]]; then
        cd ../$choices
        return 
    fi
    select dir in $choices; do
        if [ -n "$dir" ]; then
            cd ../$dir
        fi
        break
    done
}
