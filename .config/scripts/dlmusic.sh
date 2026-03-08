#!/bin/bash
URL=$1
OUTDIR="${2:-$HOME/Music}"

if [ -z "$URL" ]; then
    echo "Usage: dlmusic <url> [output_dir]"
    exit 1
fi

yt-dlp \
    -x \
    --audio-format mp3 \
    --audio-quality 0 \
    --embed-thumbnail \
    --embed-metadata \
    --add-metadata \
    --parse-metadata "%(title)s:%(meta_title)s" \
    --concurrent-fragments 4 \
    --output "$OUTDIR/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" \
    "$URL"

notify-send "✓ Download" "Tải xong vào $OUTDIR" -t 3000
