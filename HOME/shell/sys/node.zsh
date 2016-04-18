PATH=${PATH}:${HOME}/Devel/node/current/bin

if [ -d ${HOME}/.npm-packages ]
then
	PATH=${PATH}:${HOME}/.npm-packages/bin
fi

# SOME ANDROID SHIT
export ANDROID_HOME=${HOME}/Devel/Android/current
PATH=${PATH}:${HOME}/Devel/Android/current/tools
