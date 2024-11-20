export LC_CTYPE=UTF-8
export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="amuse"
 
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-fzf-history-search)

# Force prompt to be at bottom
print ${(pl:$LINES::\n:):-}

source $ZSH/oh-my-zsh.sh

toggleScrollDirection() {
  osascript ~/.dotfiles/osx/toggleScrollDirection.scpt
}

function kube-enable-debug-logging {
  kubectl annotate pods -n $1 $2 "logdestination.k8s-infra.tvm/elastic"="level=debug"
}

function kube-enable-access-logging {
  kubectl annotate pods -n $1 $2 "logdestination.k8s-infra.tvm/elastic"="level=debug&file=access.log"
}

function kube-disable-debug-logging {
  kubectl annotate pods -n $1 $2 "logdestination.k8s-infra.tvm/elastic"-
}

function kube-shell {
  kubectl exec -it -n $1 -c $2 "$(kubectl get pod -n $1 -l app=$2 -o jsonpath='{.items[0].metadata.name}')" -- /bin/bash
}

f() {
  local a="$1"
  [[ -z $a ]] && a="1"
  tree -Ca -L $a
}

gitcompare() {
  git fetch && git log --pretty=format:"%an###%s" --no-decorate origin/$1..origin/$2 | awk -F '###' '{ if ($1 == "dependabot[bot]") dep="- Dependency maint"; else print "- "$2 } END{print dep}' | pbcopy
}

alias pn=pnpm
alias git='LANG=en_GB git'
alias brew86="arch -x86_64 /usr/local/bin/brew"
alias wine86="arch -x86_64 wine"


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

# pnpm
export PNPM_HOME="/Users/dforsberg/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
