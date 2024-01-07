#!/usr/bin/env python

import os
import argparse

def helper(location: str):
    count = 0
    for _, _, files in os.walk(location):
        count += len(files)
    print(count)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="count the number of files in a specified directory")
    parser.add_argument("-d", "--directory", type=str, required=True, metavar='', help="directory location")
    args = parser.parse_args()
    helper(args.directory)
