#!/bin/sh

INSTALL=install
PERMS="-v -m 0700"

CONFIGS="Xresources colordiffrc gitconfig i3status.conf porttools tmux.conf \
        vimrc xinitrc"

checking()
{
  local _SRC _DST _READ
  _SRC=${1}
  _DST=${2}
  if [ -f ${_DST} ]
  then
    diff -up ${_SRC} ${_DST} 
    if [ $? -eq 0 ]
    then
      echo "NOTICE: ${_DST} exist but do not midifed."
    else
      echo "WARNING: ${_DST} and ${_SRC} has diffirend."
      while true
      do
        echo -n "Do you want backup?(yes/no): "
        read _READ
        if   [ "x${_READ}" = "xyes" ]
        then
          echo "NOTICE: file will backuped as ${_DST}.bak and reinstall."
          cp ${_DST} ${_DST}.bak
          break
        elif [ "x${_READ}" = "xno" ]
        then
          echo "NOTICE: Installing ${_SRC} without backup."
          break
        else
          continue
        fi
      done
    fi
  fi
}

installing()
{
  local _SRC _DST
  for config in $*
  do
    _SRC=HOME/${config}
    _DST=${HOME}/.${config}

    checking ${_SRC} ${_DST}

    if [ -f ${_SRC} ]
    then
      ${INSTALL} ${PERMS} ${_SRC} ${_DST}
    else
      echo "ERROR: ${_SRC} doesn't exist."
      ${0} install list
    fi
  done
}

ussage()
{
  case ${1} in
    install) echo -n "\
  Ussage:
    install all:         installing all files.
    install list:        aviable configs.
    install once vimrc:  for installing vimrc.
";;

    *) echo -n "\
  Ussage:
    install:             force installing configs.
    update:              update configs and check diff.
    remove:              remove configs.
";;
  esac
}

case ${1} in
  install)
    case ${2} in
      all)  installing ${CONFIGS};;
      list) echo "Aviable files:" &&
        for l in ${CONFIGS}
        do
          echo "    ${l}"
        done;;
      once) installing ${3};;
      *)    ussage ${1};;
    esac;;
  update)
    echo UPDATE;;
  remove)
    echo remove;;
  *)
    ussage;;
esac    

