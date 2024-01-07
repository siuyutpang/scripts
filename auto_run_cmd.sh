#!/usr/bin/env bash

# ====================================================
#    Filename:      auto_run_cmd.sh
#    Date:          2024-01-07 20:01
#    Author:        siuyutpang
#    Email:         siuyutpang@gmail.com
#    Description:   利用entr实现热加载功能
# ====================================================

trap "exit" SIGINT

while true; do
    fd -e go | entr -dcrp sh -c 'go run main.go'
done 2>/dev/null
