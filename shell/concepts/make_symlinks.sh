#!/bin/bash

# unused (?)
# create a symlink at $dest pointing to $source
# not tested
set -e   # abort on errors

function doit {
shopt -s dotglob

# must find this in tree:
datenspeicher=data # ordnername, auf dessen Inhat verlinkt werden soll

if [ ${PWD##*/$datenspeicher/} != $PWD ]; then #falls gleich, dann konnte er nicht heraus geschnitten werden
    echo "PWD has \$datenspeicher = '$datenspeicher'"
    while [[ $PWD != '/' && ${PWD##*/} != "$datenspeicher" ]];
        do
            cd ..
            echo $PWD
        done
    cd $PWD/migrate
    list=$(ls -a | grep .[a-z])
    echo $list
for x in $list;
    do
        ln -s $PWD/$x $HOME/$x
        # echo $HOME/$x
    done
fi
}
# doit

# if [[ ( -h $dest && $(readlink -n "$dest") != $source ) || -f $dest || -d $dest ]]
# then
#     read -p "Overwrite $dest? " answer
# else
#     answer=y
# fi
# [[ $answer == y ]] && ln -s -n -f -v -- "$source" "$dest"
