.if ${.CURDIR:M*/www/nginx-devel*}
WITH_CTPP2=yes
WITH_LUA=yes
.endif

.if ${.CURDIR:M*/databases/redis*}
WITH_LUAJIT=yes
.endif

.if ${.CURDIR:M*/databases/mongodb*}
WITH_V8=yes
.endif
