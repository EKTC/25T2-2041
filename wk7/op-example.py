#! /usr/bin/env python3 

a = 1
b = 1

w1 = "1"
w2 = str(1)

# False
if w1 is w2:
    print("w1 and w2 are equal")

# True
if a is b:
    print("a and b are equal")

# True
if w1 == w2:
    print("w1 and w2 are equal?")

# These will be the same
print(id(a), id(b))
# These wont
print(id(w1), id(w2))