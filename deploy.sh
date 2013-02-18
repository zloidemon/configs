#!/bin/sh

DIFF=diff
DATE=$(date "+%s")
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
    ${DIFF} -up ${_SRC} ${_DST} 
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
          echo "NOTICE: file will backuped as ${_DST}.bak."
          if [ -f ${_DST}.bak ]
          then
            echo "NOTICE: ${_DST}.bak exist and will moved."
            mv -v ${_DST}.bak ${_DST}.bak.${DATE}
          fi
          cp ${_DST} ${_DST}.bak
          break
        elif [ "x${_READ}" = "xno" ]
        then
          echo "NOTICE: Backuping ${_SRC} cancelled."
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

    update) echo -n "\
  Ussage:
    update:              similar - git pull.
";;

    backup) echo -n "\
  Ussage:
    backup list:         list backuped files.
";;

    *) echo -n "\
  Ussage:
    install:             force installing configs.
    backup:              backup operations.
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
  backup)
    case ${2} in
      list)
        cd ${HOME} &&
        for l in ${CONFIGS}
        do
          ls -1 .${l}.bak* 2> /dev/null
        done;;
      *) ussage ${1};;
    esac;;
  update)
    case ${2} in
      help|?) ussage ${1};;
      *)      git pull;;
    esac;;
  remove)
    echo remove;;
  *)
    ussage;;
esac    

