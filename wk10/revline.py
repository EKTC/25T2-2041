import sys

for line in sys.stdin:
    words = line.split()
    words = reversed(words)
    print(" ".join(words))

list = "123456789"