#!/usr/bin/env bash

# ====================================================
#    Filename:      download_video_and_audio.sh
#    Date:          2024-01-07 19:54
#    Author:        siuyutpang
#    Email:         siuyutpang@gmail.com
#    Description:   自动下载视频和音频
#    Usage:         ./prog filename/urls
# ====================================================

check_available_formats() {
    yt-dlp -F $1
}

download_specified_format() {
    yt-dlp -f${1}+${2} $1
}

download_video_and_audio() {
    yt-dlp -q -f 'bv[ext=mp4]+ba[ext=m4a]' -o "${HOME}/Videos/%(title)s.mp4" $1
}

download_video_and_audio_batch() {
    yt-dlp -q -f 'bv[ext=mp4]+ba[ext=m4a]' -o "${HOME}/Videos/%(title)s.mp4" -a $1
}

download_subtitle() {
    yt-dlp -q --write-auto-sub --sub-lang en --skip-download -o "${HOME}/Videos/subtitles/%(title)s" $1
}

download_subtitle_batch() {
    yt-dlp -q --write-auto-sub --sub-lang en --skip-download -o "${HOME}/Videos/subtitles/%(title)s" -a $1
}

convert_vtt_to_srt() {
    while read -r sub; do
        ffmpeg -i "$sub" "${sub%.*}".srt
        rm "$sub"
    done < <(fd -e vtt "" "${HOME}/Videos/subtitles") &>/dev/null
}

main() {
    if [ $# -eq 1 -a -f "$1" ]; then
        download_video_and_audio_batch $1
        download_subtitle_batch $1
    else
        download_video_and_audio $@
        download_subtitle $@
    fi
    convert_vtt_to_srt
}

main $@
