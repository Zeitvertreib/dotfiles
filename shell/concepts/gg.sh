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

# cd() {
    # local gg="$HOME/tmp/syms"
    # if [[ $1 == "gg" && ! -d "gg" ]]; then
        # cd $gg;
    # else
        # builtin cd $@
    # fi
# }

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
    # does not work, cuz locale varibale hardcoded
    if [[ $1 == "setup" ]]; then
        if [[ $PWD  == "$HOME" ]]; then
            mkdir ~/tmp/syms
            echo regular syms dir @$gg set up
        else
            echo speicherort for gg in "$PWD/syms" directory?
            read -n1 -p "Do that? [y,n] " reply
            case $reply in
                [yY]*) echo chosen
                    local rpwd=$(realpath $PWD)
                    if ! [ -f $rpwd/syms ]; then
                        mkdir $rpwd/syms
                    fi
                    (ln -s $rpwd/syms ~/tmp/syms)
                    ;;
                *) echo; echo not accepted
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

    if [[ -e $linked ]] && [[ $1 != "" ]] && [[ $2 != "" ]]; then
        # get path for variable from shortcut as variable
        # gg shortcut varibale
        declare -g ${2}=$(realpath $linked;)
        echo $(realpath $linked;) as \$$2 added as global var
        # export ${2}
        return
    fi
    if [[ ! -e $linked ]] && [[ $1 != "" ]] && [[ $2 != "" ]]; then
        # name a shortcut --> gg target newshortcutname
        (ln -s $from/$1 $gg/$2)
        echo $1 as $2 added to gg
        return
    fi

    # shortcut this directory
    # local d_instruction=[[ $1 == $key_dirshortcut ]]
    if [[ $1 == "lkjsahlakjshflsakjdhfalskjdf" ]]; then

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
