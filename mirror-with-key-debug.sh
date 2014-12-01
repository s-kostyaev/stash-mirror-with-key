#!/bin/bash

keyfile=`mktemp`
repo_path="$1"
shift
email="$1"
while shift; do
	echo "$1" >> $keyfile
done
ssh-agent bash -c "ssh-add $keyfile; git push --mirror $repo_path 2>&1 | mail -s `hostname` $email"

rm -f $keyfile

exit 0
