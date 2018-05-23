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
        COMPREPLY=( $(compgen -W "$gg setup add" -- "$cur") )
        return
    fi

    if [[ $pre == pos1* ]]; then
        COMPREPLY=( $(compgen -W "$gg setup add" -- "$cur") )
        # COMPREPLY=( $(compgen -W "pos2a-example pos2b-example" -- "$cur") )
        return
    fi
}

complete -F _compgen_work gg

gg() {
    # [[ -L linkeists ]]
    # [[ -e filexists ]]
    local gg="$HOME/tmp/syms"
    local from=$(pwd -P)
    local eingang="${from##*/}"
    local linked="$gg/$1"

    # catch removal and exit
    if [[ -L $linked ]] && [[ $2 == "rm" ]]; then
        rm $linked;
        echo $linked removed from gg
        return
    fi

    # add a new path
    if [[ $1 == "setup" ]]; then
        if [[ $PWD  == "$HOME" ]]; then
            mkdir ~/tmp/syms
            echo regular syms dir @$gg set up
        else
            # echo speicherort for gg in "$PWD/syms" directory?
            read -n1 -p "Do that? [y,n] " reply
            case $replay in
                yy|YY)
                    echo chosen
                    # (ln -s ~/tmp/syms/ $PWD/syms)
                    ;;
                *)
                    echo; echo not accepted
                    ;;
            esac
        fi
        return
    fi

    if [[ $1 == "add" ]]; then
        # $2 is traded as special mark, to prevent duplicates
        # $2 can be ommited
        (ln -s $PWD $gg/${eingang}_$2)
        echo ${eingang}_$2 added to gg
        return
    fi

    # goto/ cd into it
    if [[ -e $linked ]] && [[ $1 != "" ]] && [[ $2 == "" ]]; then
        # triggers only on absolute path, therefore 'realpath'
        cd $(realpath $linked;)
        return
    fi

    # shortcut this directory
    # local d_instruction=[[ $1 == $key_dirshortcut ]]
    if [[ $1 != "" ]]; then

        if [[ -e $linked ]]; then
            local d_shortcut=my_$2
            echo "linked found";
            target=$(realpath $linked;);
        else
            echo $linked linked
            local d_shortcut=my_$1
            target=$from;
        fi

        # ${d_shortcut}() {
            # return $target;
        # }
        # declare -f ${d_shortcut};
        declare -g ${d_shortcut}=$target
        echo "\$$d_shortcut: $target"
    fi

    # show current links
    if [[ $1 == "" ]]; then
        ls -lh $gg;
        return;
    fi

    # make the folder.. when run the first time only
    if [[ ! -d $gg ]]; then
        mkdir $gg
    fi
}
