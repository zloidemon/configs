# -*- coding: utf-8 -*-
# vim: set et sw=4 ts=4:

function pastebin() {
    fload()
    {
        local _tfile

        _tfile=${1}
        TFILE=$(cat ${_tfile}|sed 's|%|%25|g;s|&|%26|g;s|+|%2b|g;s|;|%3b|g')

        curl 'http://pastebin.com/api/api_post.php' \
            -d "api_paste_code=${TFILE}" \
            -d 'api_option=paste' \
            -d 'api_dev_key=CHANGE_ME' \
            -d 'api_paste_expire_date=1D'
    }

    case $1 in
    -h)
        echo "Usage:" \
        "        pastebin filename for paste a file" \
        " or" \
        "        pastebin without arguments (edit mode)"
    ;;
    *)    if [ -n "${1}" -a -f "${1}" ]
          then
              if [ -s "$1" ]
              then
                  fload ${1}
              else
                  echo "file ${1} is empty"
              fi
          else
              TEMPFILE=$(mktemp -q /tmp/pastebin.XXXXXX)
              ${EDITOR} ${TEMPFILE}
              if [ -s "${TEMPFILE}" ]
              then
                  fload ${TEMPFILE}
              fi
              rm ${TEMPFILE}*
          fi
    ;;
    esac
}
