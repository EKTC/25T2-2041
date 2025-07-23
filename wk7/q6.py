#! /usr/bin/env python3

import sys

n_lines = 10
if len(sys.argv) > 1 and sys.argv[1].startswith("-"):
    arg = sys.argv[1]
    arg = arg[1:]
    n_lines = arg
    sys.argv.pop(1)

for filename in sys.argv[1:]:
    try:
        data = open(filename, "r")
        print(f"==>{filename}<==")

        counter =  0
        for line in data.readlines():
            if counter > int(n_lines):
                break
            
            print(line, end="")
            counter += 1

        data.close()
    except:
        print("Not a valid file")