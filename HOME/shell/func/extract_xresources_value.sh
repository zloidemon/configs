# -*- coding: utf-8 -*-
# vim: set et sw=4 ts=4:

function extract_xresources_value() {
    if [ -f "${_X_USER_RESOURCES}" ]
    then
       local file=${_X_USER_RESOURCES}
       local field=${1}
    elif [ -f "${1}" ]
       local file=${1}
       local field=${2}
    then
        echo "file ${file} not found"
    fi

    local val=$(cat ${file} | awk -F ' ' "/User.${field}:/{printf \$2}")
    echo ${val}
}

_F_EXTRACT_XRESOURCES_VALUE=1
