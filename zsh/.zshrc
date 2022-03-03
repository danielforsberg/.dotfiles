export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="amuse"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

toggleScrollDirection() {
  osascript ~/.dotfiles/osx/toggleScrollDirection.scpt
}

f() {
  local a="$1"
  [[ -z $a ]] && a="1"
  tree -Ca -L $a
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 


autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH
