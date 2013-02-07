#!/bin/sh

#PRG	"zalil"
#INF	"files uploader"

zalil() {
	if [ -n "$1" -a -f "$1" ];then
		if  [ "`/usr/bin/du -k $1|awk '{print $1}'`"  -lt "51200" ];then
			curl '-#' -i -F "file"=@"$1" -F "submit=%20%20Send%20%20" http://zalil.ru/upload/|grep Location|sed 's/Location: /http:\/\/zalil.ru/'
		else
			echo file $1 is too large
		fi
	else
		echo file $1  is not specified
	fi
}
