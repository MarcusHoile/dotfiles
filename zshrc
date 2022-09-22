#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source $HOME/.asdf/asdf.sh

autoload -Uz bashcompinit

bashcompinit

source $HOME/.asdf/completions/asdf.bash

# bk8s shell setup
export PATH=$PATH:/Users/marcus/Blake/bk8s/bin/
source $HOME/Blake/bk8s/completions/bk.bash
eval "$($HOME/Blake/bs/bin/bs init -)"
eval "$($HOME/Blake/bx/bin/bx init -)"
eval "$($HOME/Blake/bd/bin/bd init -)"

export GOPATH=$HOME/go
PATH=$PATH:${GOPATH//://bin:}/bin

source "${HOME}/.my_config/dotfiles/.zshrc"

alias bk="open https://buildkite.com/blake-education/$(basename ${PWD} | tr '_' '-')"
alias oadmin="code ${HOME}/Blake/workspaces/blake-admin.code-workspace"
alias ore="code ${HOME}/Blake/workspaces/readingeggs.code-workspace"
alias zp="code ${HOME}/.my_config/dotfiles/.zshrc"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/marcushoile/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
eval "$($HOME/Blake/bs/bin/bs init -)"
eval "$($HOME/Blake/bd/bin/bd init -)"
export PATH=$PATH:$HOME/Blake/bk8s/bin
source $HOME/Blake/bk8s/completions/bk.bash
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
