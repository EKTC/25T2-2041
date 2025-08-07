import sys
import re 

try:
    arg = int(sys.argv[1])
except:
    arg = sys.argv[1][1:-1]

print(arg)
for input in sys.stdin:

    if re.search(rf'^{arg}$', input):
        print(input)
        sys.exit(0)
    
    print(input, end="")


