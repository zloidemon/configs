keyload()
{
	local _key
	_key=${1}
	echo "start loading ${_key}"
	if [ ${OSTYPE} != 'Darwin' ] | [  ${USER} != 'root' ]
	then
		which keychain 2>/dev/null >/dev/null && eval $(keychain --quiet --eval ${_key})
	else
		echo "${_key} couldn't load for ${USER}"
	fi
}
