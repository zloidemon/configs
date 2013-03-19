.if ${.CURDIR:M*/mail/mutt*}
WITH_MUTT_MAILDIR_HEADER_CACHE=yes # Old port option, need delete in 2014y
WITH_MAILDIR_HEADER_CACHE=yes
WITH_IMAP_HEADER_CACHE=yes
WITH_TOKYOCABINET=yes
.endif

.if ${.CURDIR:M*/net-im/mcabber*}
WITH_GPGME=yes
WITH_OTR=yes
WITH_ASPELL=yes
.endif
