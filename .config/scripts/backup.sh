#!/usr/bin/env bash
BACKUP_DIR="$HOME/backup/dotfiles"
DATE=$(date +%Y%m%d_%H%M%S)
DEST="$BACKUP_DIR/$DATE"
mkdir -p "$DEST"

# Các file/thư mục cần backup
CONFIGS=(
    "$HOME/.config/hypr"
    "$HOME/.config/waybar"
    "$HOME/.config/rofi"
    "$HOME/.config/swaync"
    "$HOME/.config/wlogout"
    "$HOME/.config/kitty"
    "$HOME/.config/foot"
    "$HOME/.config/colors"
    "$HOME/.config/fastfetch"
    "$HOME/.config/cava"
    "$HOME/.config/ohmyposh"
    "$HOME/.config/scripts"
    "$HOME/.config/mozilla"
    "$HOME/.zshrc"
    "$HOME/.zprofile"
)

for item in "${CONFIGS[@]}"; do
    if [ -e "$item" ]; then
        cp -r "$item" "$DEST/"
        echo "✓ $item"
    else
        echo "✗ Không tìm thấy: $item"
    fi
done

# Nén lại
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" -C "$BACKUP_DIR" "$DATE"
rm -rf "$DEST"

echo ""
echo "✓ Backup xong: $BACKUP_DIR/backup_$DATE.tar.gz"
echo "  Size: $(du -sh "$BACKUP_DIR/backup_$DATE.tar.gz" | cut -f1)"
