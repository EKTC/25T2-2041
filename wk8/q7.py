import sys
import re
import subprocess

for url in sys.argv[1:]:
    process = subprocess.run(f"wget -q -O- {url}", shell=True, capture_output=True, text=True)
    info = process.stdout

    for number in re.findall(r"[\d \-]+", info):
        # print(number)
        number=re.sub(r"\D", "", number)
        if len(number) >= 8 and len(number) <= 15:
            print(number)
