#!/bin/bash
URL=$1
OUTDIR="${2:-$HOME/Music}"

if [ -z "$URL" ]; then
    echo "Usage: dlspot <spotify_url_or_name> [output_dir]"
    exit 1
fi

cd "$OUTDIR"
spotdl \
    --output "{artist}/{album}/{track-number} - {title}.{output-ext}" \
    --format mp3 \
    --bitrate 320k \
    --threads 4 \
    "$URL"

notify-send "✓ SpotDL" "Tải xong vào $OUTDIR" -t 3000
