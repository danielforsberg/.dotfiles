export ZSH="/Users/daniel/.oh-my-zsh"

ZSH_THEME="gitster"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"

vrd() {
  vault read /sec/web/passwords/$1/cmoremob
}

v2fa() {
  vault read /totp/web/code/mob-cmoremob-$1
}

vrl() {
  vault list /sec/web/passwords
}

ryab() {
  launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"
}

toggleScrollDirection() {
  osascript ~/.scpt/toggleScrollDirection.scpt
}

f() {
	local a="$1"
	[[ -z $a ]] && a="1"
  tree -Ca -L $a
}

# export to sub-processes (make it inherited by child processes)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
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
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
