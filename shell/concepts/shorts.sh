#!/bin/bash
# http://superuser.com/questions/1021971/how-to-create-menu-for-environment-variable-names-and-values-starting-with-zv
shorts () {

    arr=()
    while read v; do arr+=( "$(printf "%s=%s" "$v" "${!v}")" ); done < <(compgen -v zv)
    select i in "${arr[@]}"; do cd "${i#*=}"; break; done
}
