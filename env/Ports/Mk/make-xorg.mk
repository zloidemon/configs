.if ${.CURDIR:M*/x11/dmenu*}
WITH_XFT=yes
.endif

.if ${.CURDIR:M*/x11-servers/xorg-server*}
WITH_HAL=no
.endif
