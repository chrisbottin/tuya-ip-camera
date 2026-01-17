#!/usr/bin/env python3
import re
import sys

infile = sys.argv[1]
outfile = sys.argv[2]

i = open(infile,"r")
o = open(outfile,"wb")
lineNumber = 0

for line in i.readlines():
    lineNumber += 1
    # line = 80600000: 27 05 19 56 54 25 3a 75 5f e1 f4 88 00 16 4b e0    '..VT%:u_.....K.
    line = line.strip()
    lineCopy = line
    match = re.match(r'(^[0-9a-f]{8}:)\s*',line)
    if match:
        # remove address
        line = re.split(r'^[0-9a-f]{8}:\s*',line)
        if len(line) == 2:
            line = line[1]
            line = line.replace(" ","")[:32]
            try:
                data = bytes.fromhex(line)
                o.write(data)
            except Exception as e:
                print(f"Error on line {lineNumber}: {lineCopy}\nException: {e}")
                break