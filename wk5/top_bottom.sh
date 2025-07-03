#!/bin/dash

top_and_bottom() {
    echo "$1"
    cat "$1" | head -n 1 
    cat "$1" | tail -n 1
    echo "\n"
}

for file in "$@"
do
    if [ ! -f "$file" ]
    then
        echo "File does not exist" >&2
        continue
    fi

    top_and_bottom "$file"
done