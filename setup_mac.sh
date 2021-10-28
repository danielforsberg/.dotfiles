echo "1. Setting Up homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "setting up symlinks"
cd ~
ln -fs  ~/.dotfiles/Brewfile
ln -fs  ~/.dotfiles/.zshrc .zshrc
ln -fs  ~/.dotfiles/.gitconfig .gitconfig

echo "2. Installing some useful things via brew"
brew bundle

echo "3. install prompt with nvm"
npm install -g typescript
npm install -g yarn