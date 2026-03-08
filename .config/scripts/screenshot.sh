#!/usr/bin/env bash
# ============================================================
# SCREENSHOT - scripts/screenshot.sh
# Dùng grim + slurp + swappy
# ============================================================

SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"
FILENAME="$SAVE_DIR/$(date +%Y%m%d_%H%M%S).png"

notify() {
    notify-send "📸 Screenshot" "$1" -i "$FILENAME" -t 3000
}

case "$1" in
    full)
        grim "$FILENAME"
        wl-copy < "$FILENAME"
        notify "Toàn màn hình đã lưu"
        ;;
    area)
        REGION=$(slurp -d -c "e8824a" -b "1a151244" -s "e8824a22")
        [ -z "$REGION" ] && exit 1
        grim -g "$REGION" - | swappy -f - -o "$FILENAME"
        wl-copy < "$FILENAME"
        notify "Vùng chọn đã lưu"
        ;;
    window)
        WIN=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$WIN" - | swappy -f - -o "$FILENAME"
        wl-copy < "$FILENAME"
        notify "Cửa sổ đã lưu"
        ;;
    *)
        # Default: area select
        REGION=$(slurp -d)
        [ -z "$REGION" ] && exit 1
        grim -g "$REGION" "$FILENAME"
        wl-copy < "$FILENAME"
        notify "Screenshot đã lưu"
        ;;
esac
