keyload()
{
	if [ $# -eq 0 ]
	then
		echo "[keyload]: please write keyname"
		echo "   keyload id_rsa"
		return 0
	fi

	local _key
	_key=${1}
	echo "[keyload]: start loading ${_key}"
	if [ ${OSTYPE} != 'Darwin' ] | [ ${USER} != 'root' ]
	then
		which keychain 2>/dev/null >/dev/null && eval $(keychain --quiet --eval ${_key})
	else
		echo "[keyload]: ${_key} couldn't load for ${USER}"
	fi
}
