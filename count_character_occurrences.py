#!/usr/bin/env python

import sys
from pprint import pprint
from collections import defaultdict

if len(sys.argv) == 2:
    message = sys.argv[1]
else:
    print('Usage: python filename "The quick brown fox jumps over a lazy dog"')
    print('or')
    print('Usage: cat filename | python - "The quick brown fox jumps over a lazy dog"')
    exit(1)

freq = defaultdict(int)
for char in message:
    freq[char] += 1
pprint(dict(freq))