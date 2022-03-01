# !/bin/bash

cd ~

echo "1. Setup homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
ln -fs ~/.dotfiles/Brewfile
brew bundle

echo "2. Setup node via nvm"
chmod 755 ~/.dotfiles/node/install.sh
~/.dotfiles/node/install.sh

echo "3. Setup Oh My Zsh"
chmod 755 ~/.dotfiles/zsh/install.sh
~/.dotfiles/zsh/install.sh

echo "4. Setup Powerline fonts"
chmod 755 ~/.dotfiles/fonts/install.sh
~/.dotfiles/fonts/install.sh