#! /usr/bin/bash
if [[ "$#" -ne "2" ]]; then
    echo "$#"
    echo "Usage: $0 <email> <issuer>"
    exit 1
fi
set -e
read -p "Encryption key: " -s key
read -p "Secret: " secret
if [[ -f "keys.bfe" ]]; then
    printf "${key}\n" | bcrypt keys.bfe 2> /dev/null || (echo "incorrect key" && exit 1)
fi
echo "$1|$2|$secret" >> keys
printf "${key}\n${key}\n" | bcrypt keys 2> /dev/null
echo
