case ${OSTYPE} in
	Darwin)
		export TOOLCHAINS=swift;;
	Linux)
		export PATH="${PATH}:${HOME}/Devel/Swift/Toolchains/current/usr/bin";;
esac

alias spi='swift package init'
alias spx='swift package generate-xcodeproj'
alias spu='swift package update'
