#!/usr/bin/env bash
TEMP=5000
PID_FILE="/tmp/gammastep.pid"

is_running() {
    [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null
}

start_sunset() {
    gammastep -O $TEMP &
    echo $! > "$PID_FILE"
}

stop_sunset() {
    if [ -f "$PID_FILE" ]; then
        kill "$(cat "$PID_FILE")" 2>/dev/null
        rm -f "$PID_FILE"
    fi
    # Reset màu về bình thường
    gammastep -O 6500 &
    sleep 1
    kill $! 2>/dev/null
}

case "$1" in
    toggle)
        if is_running; then
            stop_sunset
            notify-send "🌙 Eye Care" "Eye care: OFF" -t 2000
        else
            start_sunset
            notify-send "🌙 Eye Care" "Eye care: ON (${TEMP}K)" -t 2000
        fi
        ;;
    status)
        if is_running; then
            echo '{"text":"󰛩","tooltip":"Eye Care: ON","class":"active"}'
        else
            echo '{"text":"󰛨","tooltip":"Eye Care: OFF","class":""}'
        fi
        ;;
    start) start_sunset ;;
    stop)  stop_sunset  ;;
esac
