#!/bin/sh

#PRG	"upkey"
#INF	"auto add your pub key to ssh server"

upkey() {
	if [ -z $2 ];then
		PORT=22
	else
		PORT=$2
	fi
	if [ -z $1 ];then
		echo "Please specify user@host.ltd and port as the first switch to this script"
	else	
		for x in `find ~/.ssh -type f -name "id_*.pub"|awk '{printf $1 " "}'`;do
			KEY="$x"
				if [ -f "$x" -a -n "$x" ];then
					KEYCODE=`cat $KEY`
					ssh -p $PORT -q $1 "test -d ~/.ssh || mkdir ~/.ssh && chmod 700 ~/.ssh; echo "$KEYCODE" >> ~/.ssh/authorized_keys; chmod 644 ~/.ssh/authorized_keys"
				else
					echo $KEY not found
			fi
		done
	fi
}
