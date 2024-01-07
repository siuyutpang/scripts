#!/usr/bin/env bash

# ====================================================
#    Filename:      freq_commands.sh
#    Date:          2024-01-07 18:40
#    Author:        siuyutpang
#    Email:         siuyutpang@gmail.com
#    Description:   百分比形式显示频繁使用的shell命令
# ====================================================

function history_stats() {
    local entries=${1:-10}
    fc -l 1 \
        | awk '{map[$4]++;} END {for (cmd in map) printf "%d %f%% %s\n", map[cmd], map[cmd]/NR*100, cmd;}' \
        | grep -v './' \
        | column -c3 -s ' ' -t \
        | sort -nr \
        | nl \
        | head -n "$entries"
}

history_stats "$@"
