#!/bin/sh

#PRG	"pastebin"
#INF	"paste your text"

pastebin() {
	fload(){
		TFILE=`cat $1|sed 's|%|%25|g;s|&|%26|g;s|+|%2b|g;s|;|%3b|g'`
		curl -d 'paste_code='$TFILE'' 'http://pastebin.com/api_public.php'
		echo
	}

	case $1 in
	
	-h)
		echo "Usage:"
		echo "        pastebin filename for paste a file"
		echo "    or"
		echo "        pastebin 'just text' for edit mode"	
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
