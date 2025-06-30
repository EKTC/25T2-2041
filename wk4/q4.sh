#!/bin/dash

# sed -E 's/COMP2041/COMP2042/g' 
# sed -E 's/COMP9044/COMP9042/g'

for file in "$@"
do
    echo "$file"
    if [ ! -f $file ]
    then
        echo "Not a file"
        continue
    fi

    temp="$(mktemp)"
    sed -E 's/COMP2041/COMP2042/g; s/COMP9044/COMP9042/g' $file > $temp
    mv "$temp" "$file"

    rm -f "$temp"
done