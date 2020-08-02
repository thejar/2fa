#! /usr/bin/bash
if [[ "$#" -ne "1" ]]; then
    echo "Usage: $0 <pattern>"
    exit 1
fi
set -e
#read -p "key: " -s key
all=$(bcrypt -o keys.bfe | grep $1)
for line in $all; do
    IFS='|' read -a arr <<<$line
    email=${arr[0]}
    issuer=${arr[1]}
    secret=${arr[2]}
    echo $email $issuer
    oathtool --totp -v -b $secret;
done
