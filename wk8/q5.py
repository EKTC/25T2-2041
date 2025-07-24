import sys

w1 = set()
with(open(sys.argv[1])) as f1:
    for line in f1:
        line = line.strip()
        w1.add(line)

w2 = set()
with(open(sys.argv[2])) as f2:
    for line in f2:
        line = line.strip()
        w2.add(line)

# for word in w1 - w2:
#     print(word)

w3 = set(w1 & w2)
for w in w3:
    print(w)