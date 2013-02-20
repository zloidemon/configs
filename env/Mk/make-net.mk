.if ${.CURDIR:M*/mail/mutt*}
WITH_MUTT_MAILDIR_HEADER_CACHE=yes
.endif

.if ${.CURDIR:M*/net-im/mcabber*}
WITH_GPGME=yes
WITH_OTR=yes
WITH_ASPELL=yes
.endif
