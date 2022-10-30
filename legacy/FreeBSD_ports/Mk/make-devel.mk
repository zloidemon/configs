.if ${.CURDIR:M*/devel/ccache*}
WITH_STATIC=yes
NO_CCACHE=yes
.endif

.if ${.CURDIR:M*/devel/ipython*}
WITHOUT_X11=yes
.endif

.if ${.CURDIR:M*/devel/subversion*}
WITHOUT_STATIC=yes
.endif
