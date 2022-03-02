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

echo "5. Setup git config"
chmod 755 ~/.dotfiles/git/install.sh
~/.dotfiles/git/install.sh

echo "6. Setup ssh key"
read -e -p "Enter the filename for your key: " SSH_KEY
ssh-keygen -t rsa -f ~/.ssh/$SSH_KEY.key
pbcopy < ~/.ssh/$SSH_KEY.key.pub

echo "7. Setup npm registry"
read -e -p "Enter your organization name: " ORGANIZATION
read -e -p "Enter your Github access token: " TOKEN
echo "@$ORGANIZATION:registry=https://npm.pkg.github.com/\n//npm.pkg.github.com/:_authToken=$TOKEN" > ~/.npmrc
