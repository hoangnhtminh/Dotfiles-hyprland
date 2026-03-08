#!/usr/bin/env bash
PID_FILE="/tmp/wl-record.pid"
SAVE_DIR="$HOME/Videos/Recordings"
mkdir -p "$SAVE_DIR"
FILE="$SAVE_DIR/$(date +%Y%m%d_%H%M%S).mp4"

is_running() {
    [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null
}

stop_record() {
    if [ -f "$PID_FILE" ]; then
        kill "$(cat "$PID_FILE")" 2>/dev/null
        rm -f "$PID_FILE"
        notify-send "⏹ Recording" "Đã lưu vào $SAVE_DIR" -t 3000
    fi
}

start_record() {
    case "$1" in
        area)
            REGION=$(slurp)
            [ -z "$REGION" ] && exit 0
            wf-recorder -g "$REGION" -f "$FILE" &
            ;;
        *)
            wf-recorder -f "$FILE" &
            ;;
    esac
    echo $! > "$PID_FILE"
    notify-send "⏺ Recording" "Đang quay màn hình..." -t 2000
}

if is_running; then
    stop_record
else
    start_record "$1"
fi
