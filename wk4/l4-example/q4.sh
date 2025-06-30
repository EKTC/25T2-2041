#!/bin/dash

# sed -E 's/COMP2041/COMP2042/g' 
# sed -E 's/COMP9044/COMP9042/g'

for file in "$@"
do
    echo "$file"
done