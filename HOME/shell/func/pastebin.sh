#!/bin/sh

#PRG	"pastebin"
#INF	"paste your text"

pastebin()
{
	fload()
	{
		local _tfile 
		_tfile=${1}
		TFILE=$(cat ${_tfile}|sed 's|%|%25|g;s|&|%26|g;s|+|%2b|g;s|;|%3b|g')
		curl -d "api_paste_code=${TFILE}" -d 'api_option=paste' -d \
			'api_dev_key=b4d8fe0871fb0da5ca94939137cab423' -d 'api_paste_expire_date=1D' \
			'http://pastebin.com/api/api_post.php'
	}

	case $1 in
	
	-h)
		echo "Usage:" \
		"        pastebin filename for paste a file" \
		" or" \
		"        pastebin 'just text' for edit mode"	
	;;

	*)	if [ -n "$1" -a -f "$1" ];then	
			if [ -s "$1" ];then
				fload $1
			else
				echo file $1 is empty
			fi
		else
			TEMPFILE=`mktemp -q /tmp/pastebin.XXXXXX`
			$EDITOR $TEMPFILE
			if [ -s "$TEMPFILE" ]; then
				fload $TEMPFILE
			fi
			rm ${TEMPFILE}*
		fi
	;;

esac

}
