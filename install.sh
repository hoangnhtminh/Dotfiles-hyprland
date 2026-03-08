#!/bin/bash
set -e

echo "🍊 Installing Warm Orange Rice dotfiles..."

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'

log()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${ORANGE}[!]${NC} $1"; }
err()  { echo -e "${RED}[✗]${NC} $1"; exit 1; }

# Check Arch
[ -f /etc/arch-release ] || err "Arch Linux only!"

# Install packages
log "Installing packages..."
sudo pacman -S --needed --noconfirm \
    hyprland hyprlock hypridle \
    waybar rofi-wayland \
    swaync wlogout \
    kitty foot \
    thunar tumbler \
    swww gammastep \
    zathura zathura-pdf-mupdf \
    imv mpv \
    playerctl \
    grim slurp grimblast \
    wl-clipboard cliphist \
    ttf-jetbrains-mono-nerd \
    noto-fonts-cjk \
    oh-my-posh \
    fastfetch \
    bat eza zoxide fzf \
    yazi ffmpegthumbnailer \
    neovim \
    git base-devel

# Install yay if needed
if ! command -v yay &>/dev/null; then
    log "Installing yay..."
    git clone --depth=1 https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
fi

# AUR packages
log "Installing AUR packages..."
yay -S --needed --noconfirm \
    auto-cpufreq \
    papirus-icon-theme \
    papirus-folders \
    graphite-gtk-theme-git \
    spotdl \
    yt-dlp

# Backup existing config
if [ -d ~/.config/hypr ]; then
    warn "Backing up existing config..."
    cp -r ~/.config ~/config.backup.$(date +%Y%m%d)
fi

# Copy dotfiles
log "Copying dotfiles..."
cp -r .config/* ~/.config/
[ -f .zshrc ]    && cp .zshrc ~/
[ -f .zprofile ] && cp .zprofile ~/

# Set permissions
chmod +x ~/.config/scripts/*.sh

# Set GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Graphite-orange-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Papirus folders
papirus-folders -C orange --theme Papirus-Dark

# Enable services
sudo systemctl enable --now auto-cpufreq

# zram
sudo tee /etc/systemd/zram-generator.conf << 'ZRAM'
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
ZRAM
sudo systemctl daemon-reload

# swappiness
echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-swappiness.conf
sudo sysctl --system

log "Done! Please reboot and select Hyprland in Ly."
