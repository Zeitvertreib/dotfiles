#!/bin/bash


string(){
    read -p "var2: " var2
    read -p "var: 1" var1

    echo var2 $var2
    echo var1 $var1
    if [ "$var1" ]; then
        echo var1 is set: $var1
    fi
    if [ -z "$var1" ]; then
        echo var1 is set, checked by -z flag: no value
    fi
    if [ "$var2" ]; then
        echo var2 is set: $var2
    fi
    if [ -z "$var2" ]; then
        echo var2 is set, checked by -z flag: no value
    fi

}
# http://superuser.com/questions/1021971/how-to-create-menu-for-environment-variable-names-and-values-starting-with-zv
shorts () {

    arr=()
    while read v; do arr+=( "$(printf "%s=%s" "$v" "${!v}")" ); done < <(compgen -v zv)
    select i in "${arr[@]}"; do cd "${i#*=}"; break; done
}
