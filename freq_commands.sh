#!/usr/bin/env bash

# ====================================================
#    Filename:      freq_commands.sh
#    Date:          2024-01-07 18:40
#    Author:        siuyutpang
#    Email:         siuyutpang@gmail.com
#    Description:   百分比形式显示频繁使用的shell命令
# ====================================================

history | \
awk '{map[$4]++;} END {for (cmd in map) printf "%d %f%% %s\n", map[cmd], map[cmd]/NR*100, cmd;}' | \
grep -v './' | \
column -s' ' -t | sort -nr | nl | head -n10
