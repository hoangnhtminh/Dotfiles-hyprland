# ─────────────────────────────────────────
# ZSH CONFIG - Hyprland Rice
# ─────────────────────────────────────────
# Nếu dùng zsh
echo '
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec Hyprland
fi' >> ~/.zprofile

# Nếu dùng bash
echo '
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec Hyprland
fi' >> ~/.bash_profile
[[ $- != *i* ]] && return

# ─── History ─────────────────────────────
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

# ─── Keybind ─────────────────────────────
bindkey -e

# ─── Plugins (Zinit) ─────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit
zinit cdreplay -q

# ─── Completion styling ───────────────────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# ─── FZF theme (Catppuccin) ───────────────
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS="
--height=40%
--layout=reverse
--border
--color=bg:#1E1E2E
--color=bg+:#313244
--color=fg:#CDD6F4
--color=fg+:#F5E0DC
--color=hl:#F38BA8
--color=prompt:#CBA6F7
--color=pointer:#F5E0DC
--color=marker:#B4BEFE
"

# ─── Preview with bat / eza ───────────────
export FZF_CTRL_T_OPTS="
--preview 'bat --color=always --line-range :500 {}'
"

export FZF_ALT_C_OPTS="
--preview 'eza --tree --color=always {} | head -200'
"

# ─── Tools init ───────────────────────────

# better cd
eval "$(zoxide init zsh)"

# better cat
export BAT_THEME="Catppuccin-mocha"
alias cat='bat --paging=never'

# ─── Aliases ──────────────────────────────

alias ls='eza --icons'
alias ll='eza -lh --icons'
alias la='eza -lah --icons'
alias lt='eza --tree --level=2 --icons'

alias grep='rg'

alias find='fd'

alias vim='nvim'

alias top='btop'

alias update='sudo pacman -Syu'

alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# ─── Git shortcuts ───────────────────────

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

# ─── Python venv helper ──────────────────

venv() {
  source ${1:-.venv}/bin/activate
}

# ─── Startup visuals ─────────────────────

if command -v fastfetch >/dev/null; then
  fastfetch
fi

# ─── Prompt ─────────────────────────────

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.json)"

# allow comments
setopt interactivecomments
export BAT_THEME="base16"
export TMUX_TMPDIR=/tmp
export TMUX_TMPDIR=/tmp

export PATH="$PATH:$HOME/competitive"
alias dlspot="~/.config/scripts/dlspot.sh"
alias dlmusic="~/.config/scripts/dlmusic.sh"
alias dlmusic="~/.config/scripts/dlmusic.sh"
