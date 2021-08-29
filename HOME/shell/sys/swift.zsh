case ${OSTYPE} in
	Darwin)
		export TOOLCHAINS=swift;;
esac

alias spi='swift package init'
alias spx='swift package generate-xcodeproj'
alias spu='swift package update'
alias spb='swift build'
alias spt='swift test'
