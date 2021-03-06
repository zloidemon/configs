#PRG	"spaces_ani"
#INF	"disable Spaces workspace change animation"

#Disable Spaces workspace change animation
function spaces_ani(){
	case $1 in
	y|yes)
		defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES && killall Dock;;
	n|no)
		defaults delete com.apple.dock workspaces-swoosh-animation-off && killall Dock;;
	*)
		echo "Disable Spaces workspace change animation.\nuse:\tyes\n\tno"
		if defaults read com.apple.dock workspaces-swoosh-animation-off 2> /dev/null >/dev/null;then
			SPACES_AN_STATUS="disabled"
		else
			SPACES_AN_STATUS="enabled"
		fi
		echo Animations: $SPACES_AN_STATUS ;;
	esac
}
