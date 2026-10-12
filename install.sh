#!/data/data/com.termux/files/usr/bin/bash

set -e

echo "╭────────────────────────────╮"
echo "│   AM Powerlevel10k Setup   │"
echo "╰────────────────────────────╯"

if ! command -v zsh >/dev/null 2>&1; then
    echo "Error: Install Zsh first: pkg install zsh"
    exit 1
fi

if [[ ! -f "$HOME/.p10k.zsh" ]]; then
    echo "Error: ~/.p10k.zsh not found."
    echo "Configure Powerlevel10k first, then run this installer."
    exit 1
fi

cp "$HOME/.p10k.zsh" "$HOME/.p10k.zsh.am-backup"
echo "Backup created: ~/.p10k.zsh.am-backup"
echo "Your existing configuration has not been overwritten."
echo "Installer is ready for the AM configuration."
