from glob import glob
import sys

total = 0
for file in glob("*.[ch]"):
    with open(file) as f:
        lines = f.readlines()
        n_lines = len(lines)
        print(f"{n_lines} {file}")
        total += n_lines

print(total)