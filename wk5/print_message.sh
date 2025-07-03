#!/bin/dash

print_message() {
    if [ $# -gt 1 ]
    then
        echo "$0: error $2"
        exit $1
    else 
        echo "$0: warning $1"
    fi
}

print_message "hello"
print_message 2 "hello"
