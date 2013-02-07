#PRG	"zshtmp"
#INF	"autogenerate aliases and any"

function zshtmp(){
	ZTMP=$HOME/.zshtmp
	case $1 in
		rehash)
			if [ -f $HOME/.zshtmp ];then
				rm $ZTMP
				touch $ZTMP
			else
				touch $ZTMP
			fi
			whichtest(){
				which $1 2> /dev/null > /dev/null
			}



			for i in ee nano vi;do
				if whichtest ${i};then
					echo "export ALTERNATE_EDITOR=${i}">>$ZTMP
				break
				fi
			done
			
			#converting mp3 tags russian(CP1251) to UTF-8
			for i in mid3iconv mid3iconv-2.5 mid3iconv-2.6 mid3iconv-2.7;do
				if whichtest ${i};then
					echo "alias convert_tags='${i} -eCP1251 --remove-v1 *.mp3'">>$ZTMP
				break
				fi
			done

			#SUDO
			if whichtest sudo;then 
				echo "alias smake='sudo make'">>$ZTMP
				echo "alias s='sudo'">>$ZTMP
			fi

  			#HTOP
			if whichtest htop;then
				echo "alias top='htop'">>$ZTMP
			fi

			#Color diff
			if whichtest colordiff;then
				echo "alias cdiff='colordiff'">>$ZTMP
			fi


			#Color df
			if whichtest cdf;then
				echo "alias df='cdf'">>$ZTMP
			fi

			#PAGER for mans
			if whichtest most;then
				echo "export PAGER=most">>$ZTMP
			fi

			#Specific os stuff
			if [ -f $HOME/.zsh/aliases/${ZHELP_OS}_aliases ];then
				source $HOME/.zsh/aliases/${ZHELP_OS}_aliases
			fi

		;;
		*)
			echo "Usage:"
			echo "           rehash for regenerate the .zshtmp"
		;;
	esac
}
