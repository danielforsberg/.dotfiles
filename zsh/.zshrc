export LC_CTYPE=UTF-8
export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="amuse"
 
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-fzf-history-search)

# Force prompt to be at bottom
print ${(pl:$LINES::\n:):-}
source $ZSH/oh-my-zsh.sh

f() {
  local a="$1"
  [[ -z $a ]] && a="1"
  tree -Ca -L $a
}

alias git='LANG=en_GB git'
alias brew86="arch -x86_64 /usr/local/bin/brew"
alias wine86="arch -x86_64 wine"
alias bw-pw-update="~/.dotfiles/zsh/bw_pw_update.sh"
alias bw-pw-copy="~/.dotfiles/zsh/bw_pw_copy.sh"


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
