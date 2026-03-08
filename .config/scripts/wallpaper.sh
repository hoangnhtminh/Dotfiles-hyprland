#!/usr/bin/env bash
# ============================================================
# WALLPAPER SCRIPT - scripts/wallpaper.sh
# Dùng swww để chuyển wallpaper mượt
# ============================================================
if pidof rofi > /dev/null; then
    pkill rofi
fi

WALL_DIR="$HOME/Pictures/Wallpapers"
CACHE_FILE="$HOME/.cache/current_wallpaper"
TRANSITION="grow"       # grow | fade | slide | wave | outer
TRANS_STEP=90
TRANS_FPS=60
TRANS_DURATION=0.8

mkdir -p "$WALL_DIR" "$HOME/.cache"

apply_wallpaper() {
    local wall="$1"
    swww img "$wall" \
        --transition-type "$TRANSITION" \
        --transition-step "$TRANS_STEP" \
        --transition-fps "$TRANS_FPS" \
        --transition-duration "$TRANS_DURATION" \
        --transition-bezier "0.25,1,0.25,1"
    echo "$wall" > "$CACHE_FILE"
}

case "$1" in
    pick)
        # Dùng rofi để chọn wallpaper từ thư mục
        SELECTED=$(find "$WALL_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) \
            | while read -r f; do
                echo -en "$f\x00icon\x1f$f\n"
              done \
            | rofi -dmenu -show-icons -p "  Wallpaper" \
                   -theme ~/.config/rofi/launcher.rasi)
        [ -n "$SELECTED" ] && apply_wallpaper "$SELECTED"
        ;;

    restore)
        # Khôi phục wallpaper từ lần trước
        if [ -f "$CACHE_FILE" ]; then
            WALL=$(cat "$CACHE_FILE")
            [ -f "$WALL" ] && apply_wallpaper "$WALL"
        else
            # Nếu chưa có, lấy wallpaper đầu tiên tìm thấy
            FIRST=$(find "$WALL_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | head -1)
            [ -n "$FIRST" ] && apply_wallpaper "$FIRST"
        fi
        ;;

    random)
        RAND=$(find "$WALL_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) \
               | shuf -n1)
        [ -n "$RAND" ] && apply_wallpaper "$RAND"
        ;;

    next)
        CURRENT=$(cat "$CACHE_FILE" 2>/dev/null)
        mapfile -t WALLS < <(find "$WALL_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) | sort)
        TOTAL=${#WALLS[@]}
        [ "$TOTAL" -eq 0 ] && exit 1
        IDX=0
        for i in "${!WALLS[@]}"; do
            [[ "${WALLS[$i]}" == "$CURRENT" ]] && IDX=$(( (i+1) % TOTAL ))
        done
        apply_wallpaper "${WALLS[$IDX]}"
        ;;

    *)
        echo "Usage: $0 {pick|restore|random|next}"
        exit 1
        ;;
esac
