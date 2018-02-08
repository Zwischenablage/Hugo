#!/bin/bash

ERRORSTRING="Error. Please make sure you've indicated correct parameters"

if [ $# -eq 0 ]
then
	echo $ERRORSTRING;
elif [ $1 == "go" ]
then
	if [ -z $2 ]
	then
		hugo && rsync --dry-run -az --force --delete public/ --progress --exclude-from=.rsyncignore ./ daniel@danielendr.es:/srv/http/danielendr.es/about/
	elif [ $2 == "live" ]
	then
		hugo && rsync -az --force --delete public/ --progress --exclude-from=.rsyncignore ./ daniel@danielendr.es:/srv/http/danielendr.es/about/
	else
		echo $ERRORSTRING
	fi
fi


