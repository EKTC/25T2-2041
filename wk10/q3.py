import sys

VOWELS="aeiou"

t = str.maketrans(VOWELS.upper() + VOWELS.lower(), VOWELS.lower() + VOWELS.upper())



for line in sys.stdin:
    print(line.translate(t), end="")