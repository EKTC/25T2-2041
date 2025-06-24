#!/bin/dash
apple="and"

# Statement to check if its a string
if ! [ "$apple" -eq 1 ] 2> /dev/null
then
    echo "String found not valid"
    exit 1
fi

# We want a number

