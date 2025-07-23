#! /usr/bin/env python3

import sys

n_lines = 10
if len(sys.argv) > 1 and sys.argv[1].startswith("-"):
    arg = sys.argv[1]
    arg = arg[1:]
    n_lines = arg

counter = 1
for line in sys.stdin:
    if counter > int(n_lines):
        break
    print(line, end="")
    counter += 1