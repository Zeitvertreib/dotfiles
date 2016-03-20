#!/bin/bash

# create a virtualenv currtent directory and install the following
# django for python 3 , ipython
# not well tested
set -e   # abort on errors

echo arg 1 = :$1: arg 2 = :$2: arg 3 = :$3:
# varfuervenv=$1
# function doit {
# shopt -s dotglob
pip_version="pip-3.2"
# echo arg 1 = :$1: arg 2 = :$2: arg 3 = :$3:
# 
if [ $# -eq 1 ]
then
    virtualenv -p /usr/bin/python3.2 $1
    cd $1
    source bin/activate
    $pip_version install https://www.djangoproject.com/download/1.7c3/tarball/
    $pip_version install bpython
    deactivate
else
    echo "parameteranzahl nicht korrekt (einer für das verzeichnis verlangt)"
fi
# }

# doit

# if [[ ( -h $dest && $(readlink -n "$dest") != $source ) || -f $dest || -d $dest ]]
# then
#     read -p "Overwrite $dest? " answer
# else
#     answer=y
# fi
# [[ $answer == y ]] && ln -s -n -f -v -- "$source" "$dest"
