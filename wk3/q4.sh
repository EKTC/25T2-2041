#!/bin/dash

if [ "$#" -eq 1 ]
then
    i=1
    while [ "$i" -le "$1" ]
    do
        echo "$i"
        i=$((i + 1))
    done
elif [ "$#" -eq 2 ]
then
    i="$1"
    while [ "$i" -le "$2" ]
    do
        echo "$i"
        i=$((i + 1))
    done
elif [ "$#" -eq 3 ]
then
    i="$1"
    while [ "$i" -le "$2" ]
    do
        echo "$i"
        i=$((i + $3))
    done
else 
    echo "$0: Usage Error" 1>&2
    exit 1
fi