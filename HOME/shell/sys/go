# -*- coding: utf-8 -*-
# vim: set et sw=4 ts=4:

case ${OSTYPE} in
    FreeBSD)
        GOOS=freebsd
        GOARCH=amd64
        GOROOT=/usr/local/go
    ;;
    Darwin)
        GOROOT=/usr/local/go
        export PATH=${PATH}:${GOROOT}/bin
    ;;
esac


alias gorun='go run'
