#!/bin/dash
# ./var_split.sh $(echo $y)

echo "$#"
for arg in "$@"
do
    echo $arg
done