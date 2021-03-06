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

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

newtab()
{
    osascript -e 'activate application "iTerm"' -e 'tell application "System Events" to keystroke "d" using command down'
}


alias b="cd .."
alias gcod="gco develop"
alias gpo="git push -u origin"
alias gcom="gco master"
alias gm="git merge"
alias grhh="git reset --hard head"
alias s="git status"
alias rs="bundle exec rails s"
alias rsp="bundle exec rspec"
alias gb="git branch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gbclean="git branch --merged | grep -v "develop" | grep -v '\*' | xargs -n 1 git branch -d"
alias gbfclean="git branch | grep -Ev '(master|develop)' | grep -v '^*' | xargs git branch -D"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/dist/bin:$PATH"
export PATH="$HOME/.geckodriver:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export EDITOR='vim'
