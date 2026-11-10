WITH_NEW_XORG=yes
WITH_KMS=yes

.if ${.CURDIR:M*/net-im/skype*}
WITHOUT_VIDEO=yes
.endif

.if ${.CURDIR:M*/print/qpdfview*}
WITH_DJVU=yes
.endif

.if ${.CURDIR:M*/www/luakit*}
WITH_LUAJIT=yes
.endif
