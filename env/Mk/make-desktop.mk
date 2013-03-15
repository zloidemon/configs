.if ${.CURDIR:M*/net-im/skype*}
WITHOUT_VIDEO=yes
.endif

.if ${.CURDIR:M*/print/qpdfview*}
WITH_DJVU=yes
.endif
