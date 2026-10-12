#!/data/data/com.termux/files/usr/bin/bash
set -e

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$SCRIPT_DIR/config/p10k.zsh"
P10K="$HOME/.p10k.zsh"
ZSHRC="$HOME/.zshrc"
STAMP="$(date +%Y%m%d-%H%M%S)"

echo "╭──────────────────────────────╮"
echo "│     AM Powerlevel10k Setup   │"
echo "╰──────────────────────────────╯"

if ! command -v zsh >/dev/null 2>&1; then
  echo "Error: Install Zsh first: pkg install zsh"
  exit 1
fi

if [[ ! -f "$CONFIG" ]]; then
  echo "Error: config/p10k.zsh not found."
  echo "Run this script from the cloned repository."
  exit 1
fi

if [[ -f "$P10K" ]]; then
  cp -p "$P10K" "$P10K.backup-$STAMP"
  echo "Backup created: $P10K.backup-$STAMP"
fi

if [[ -f "$ZSHRC" ]]; then
  cp -p "$ZSHRC" "$ZSHRC.backup-$STAMP"
  echo "Backup created: $ZSHRC.backup-$STAMP"
fi

cp "$CONFIG" "$P10K"

SETTINGS="$SCRIPT_DIR/config/am-settings.zsh"
if [[ -f "$SETTINGS" ]]; then
  mkdir -p "$HOME/.config/am-p10k-zsh-config"
  cp "$SETTINGS" "$HOME/.config/am-p10k-zsh-config/am-settings.zsh"
fi

SETTINGS="$SCRIPT_DIR/config/am-settings.zsh"
if [[ -f "$SETTINGS" ]]; then
  mkdir -p "$HOME/.config/am-p10k-zsh-config"
  cp "$SETTINGS" "$HOME/.config/am-p10k-zsh-config/am-settings.zsh"
fi
touch "$ZSHRC"

if ! grep -Fq 'source "$HOME/.p10k.zsh"' "$ZSHRC"; then
  printf '\n# Load AM Powerlevel10k configuration\n[[ -r "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"\n' >> "$ZSHRC"
fi

echo "AM Powerlevel10k configuration installed."
echo "Restart Zsh or run: source ~/.zshrc"
