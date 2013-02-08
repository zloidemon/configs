if [ $OSTYPE != 'Darwin' ]; then
	which keychain 2>/dev/null >/dev/null && eval `keychain --eval ${HOME}/.ssh/id_dsa`
fi
