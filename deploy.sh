#!/bin/bash

ERRORSTRING="Error. Please make sure you've indicated correct parameters"

if [ -z "${RSYNC_TARGET}" ]
then
	echo "environment variable RSYNC_TARGET is not set"
	exit 0
fi

if [ $# -eq 0 ]
then
	echo $ERRORSTRING;
elif [ $1 == "go" ]
then
	if [ -z $2 ]
	then
		hugo && rsync --dry-run -az --force --delete public/ --progress --exclude-from=.rsyncignore ./ $RSYNC_TARGET
	elif [ $2 == "live" ]
	then
		hugo && rsync -az --force --delete public/ --progress --exclude-from=.rsyncignore ./ $RSYNC_TARGET
	else
		echo $ERRORSTRING
	fi
fi


