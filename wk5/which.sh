#!/bin/dash

for program in "$@"
do
    found=""
    directories=$(echo "$PATH" | tr ':' ' ')
    # echo $directories
    for dir in $directories
    do
        f="$dir/$program"
        if [ -x "$f" ]
        then
            ls -ld "$f"
            found=1
        fi
    done

    if [ -z $found ]
    then
        echo "Not found"
    fi
done