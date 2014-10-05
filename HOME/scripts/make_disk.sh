#!/bin/sh

IN=cddata
OUT=iso
REC="--recipient g.veniamin@googlemail.com --recipient vg@FreeBSD.org"

function iso()
{
	find ${IN} -name '.DS_Store' -delete
	for e in $(ls ${IN})
	do
		echo "Start building ${e}"
		hdiutil makehybrid -o ${OUT}/${e}.iso ${IN}/${e} -iso -joliet
	done
}

function enc()
{
	for s in $(ls ${OUT})
	do
		echo "Start encruption ${s}"
		gpg --trust-model always --output ${OUT}/${s}.gpg --encrypt ${REC} ${OUT}/${s} 
		gpg --armor --detach-sig ${OUT}/${s}.gpg
		rm ${OUT}/${s}
	done
}

case $1 in
	clean) rm -fr ${OUT} && mkdir ${OUT};;
	iso) iso ;;
	enc) enc ;;
esac
