#! /usr/bin/bash
set -e
#read -p "key: " -s key
all=$(bcrypt -o keys.bfe)
for line in $all; do
    IFS='|' read -a arr <<<$line
    email=${arr[0]}
    issuer=${arr[1]}
    printf "$email\t$issuer\n"
done
