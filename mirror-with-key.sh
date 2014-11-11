#!/bin/bash

keyfile=`mktemp`
repo_path="$1"
while shift; do
	echo "$1" >> $keyfile
done
ssh-agent bash -c "ssh-add $keyfile; git push --mirror $repo_path"
rm -f $keyfile

exit 0
