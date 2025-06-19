#!/bin/dash

for file in *.c
do
    echo "$file includes:"
    cat "$file" | grep -E '^#include' |
    sed -E 's/.*[<"](.*\.h)[>"]/    \1/'
done