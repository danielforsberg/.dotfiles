# !/bin/bash

cd ~

echo "1. Setup homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# setup symlinks
ln -fs ~/.dotfiles/Brewfile
ln -fs ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -fs ~/.dotfiles/.gitconfig .gitconfig

echo "2. Install brew stuff"
brew bundle

echo "3. Install node via nvm"
chmod 755 ~/.dotfiles/node/install.sh
~/.dotfiles/node/install.sh

echo "4. Install Oh My Zsh"
chmod 755 ~/.dotfiles/zsh/install.sh
~/.dotfiles/zsh/install.sh

echo "4. Install Powerline fonts"
chmod 755 ~/.dotfiles/fonts/install.sh
~/.dotfiles/fonts/install.sh
