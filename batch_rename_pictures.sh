#!/usr/bin/env bash

# ====================================================
#    Filename:      batch_rename_pictures.sh
#    Date:          2024-01-07 19:49
#    Author:        siuyutpang
#    Email:         siuyutpang@gmail.com
#    Description:   批量重命名图片名
# ====================================================

path="${1:-.}"

rename_pics() {
    shopt -s nullglob

    declare -i cnt=1

    # 防止在重命名过程中导致名字冲突
    for pic in *.{jpg,png}; do
        if [ -f "$pic" ]; then
            ext="${pic##*.}"
            printf -v new_name "%09d.%s" $cnt $ext
            mv $pic $new_name
            cnt+=1
        fi
    done

    cnt=1

    for pic in *.{jpg,png}; do
        if [ -f "$pic" ]; then
            ext="${pic##*.}"
            printf -v new_name "%02d.%s" $cnt $ext
            mv $pic $new_name
            cnt+=1
        fi
    done

    shopt -u nullglob
}


generate_md() {
    local location="$path/README.md"
    echo "wallpapers showcase" > $location
    for pic in "$path"/*.{jpg,png}; do
        echo "$pic" >> $location
        echo "![$pic]($pic)" >> $location
    done
}

main() {
    (cd $path && rename_pics)
}

main
