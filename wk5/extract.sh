#!/bin/dash

for archive in "$@"
do
    if [ ! -f "$archive" ]
    then
        echo "File does not exist" >&2
        continue
    fi

    # zip, tar
    case "$archive" in
        *.zip)  unzip   "$archive" ;; 
        *.tar)  tar -xf  "$archive" ;;
        *) echo "Not a valid file" ;;
    esac

done