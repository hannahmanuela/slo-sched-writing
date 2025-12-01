#!/bin/sh

while :; do
    case $1 in
        --exclude-dir) exclude_dir="$2"
        shift
        ;;
        *) break
    esac
    shift
done

FLIST="$1"

while :;
do
    LAST="$FLIST"
    for F in $LAST; do
	NL=`cat $F | grep '\\\\\\(include\|input\\){' | grep -v ^% | cut -d{ -f2 | cut -d} -f1 | grep -v ^$exclude_dir/ | grep -v glyphtounicode`
	for F2 in $NL; do
            if [ -e "$F2" ]; then
	        FLIST="$FLIST $F2"
            else
	        FLIST="$FLIST $F2.tex"
            fi
	done
    done
    FLIST=`ls $FLIST | sort | uniq`

    if [ "$LAST" = "$FLIST" ]; then
	echo $LAST
	exit 0
    fi
done
