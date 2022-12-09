#!/bin/sh
# -*- coding: utf-8 -*-
# vim: set et sw=4 ts=4:
#PRG    "cyr2lat"
#INF    "file names converter cyrillic to latin"

cyr2lat() {
    for NAME in $1
    do
        TRS=$(echo $NAME | sed "y/абвгдезийклмнопрстуфхцы/abvgdezijklmnoprstufxcy/")
        TRS=$(echo $TRS | sed "y/АБВГДЕЗИЙКЛМНОПРСТУФХЦЫ/ABVGDEZIJKLMNOPRSTUFXCY/")
        TRS=${TRS//ч/ch};
        TRS=${TRS//Ч/CH} TRS=${TRS//ш/sh};
        TRS=${TRS//Ш/SH} TRS=${TRS//ё/jo};
        TRS=${TRS//Ё/JO} TRS=${TRS//ж/zh};
        TRS=${TRS//Ж/ZH} TRS=${TRS//щ/sh\'};
        TRS=${TRS//Щ/SH\'} TRS=${TRS//э/je};
        TRS=${TRS//Э/JE} TRS=${TRS//ю/ju};
        TRS=${TRS//Ю/JU} TRS=${TRS//я/ja};
        TRS=${TRS//Я/JA} TRS=${TRS//ъ/\`};
        TRS=${TRS//ъ\`} TRS=${TRS//ь/\'};
        TRS=${TRS//Ь/\'}
        if [[ $(file -b "$NAME") == directory ]]
        then
            mv -v "$NAME" "$TRS"
            cd "$TRS"
            "$0"
            cd ..
        else
            mv -v "$NAME" "$TRS"
        fi
    done
}
