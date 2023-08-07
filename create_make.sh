#!/bin/bash

if [[ -f "$1" ]]; then
    filename=$(basename "$1")
    no_suffix=$(sed "s/\..*//g" <<<$filename)
    suffix=$(sed 's/.*\.//' <<<$filename)
    if ! [[ "$suffix" =~ [sS] ]]; then
        echo "Invalid file extension!"
    exit 1
    fi
    dirname=$(dirname $1)
    if [[ -d $dirname ]]; then
        cd $dirname
        echo $no_suffix":" > Makefile
        echo -e "\tas -o "$no_suffix".o "$filename >> Makefile
        echo -e "\tld -o $no_suffix "$no_suffix".o" >> Makefile
    fi
fi


