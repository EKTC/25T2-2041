import re
import subprocess
import sys
from collections import Counter
from argparse import ArgumentParser
import requests
from bs4 import BeautifulSoup

parser = ArgumentParser()
parser.add_argument("-f", "--frequency", action="store_true", help="print tags by freq")
parser.add_argument("url", help="url to search")
args = parser.parse_args()

response = requests.get(args.url)
data = response.text.lower()
# p = subprocess.run(["wget", "-q", "-O-", args.url], text=True, capture_output=True)
# print(p)
# data = p.stdout.lower()
soup = BeautifulSoup(data, "html5lib")
tags = soup.find_all()
names = [ tag.name for tag in tags ]
# print(data)
# data = re.sub(r"<!--.*?-->", "", data, flags=re.DOTALL)
# tags = re.findall(r"<(\w+)", data)
# print(tags)

# counter = Counter()
# for tag in tags:
#     counter[tag] += 1
c1 = Counter(names)
# print(counter)
print(c1)
if args.frequency:
    for tag, count in reversed(c1.most_common()):
        print(f"{tag} {count}")
else:
    for tag, count in sorted(c1.items()):
        print(f"{tag} {count}")
