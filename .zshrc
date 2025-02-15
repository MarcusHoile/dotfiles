
# Source local env
if [[ -s "${HOME}/.dev.env" ]]; then
  source "${HOME}/.dev.env"
fi

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

newtab()
{
    osascript -e 'activate application "iTerm"' -e 'tell application "System Events" to keystroke "d" using command down'
}
export PR_TEMPLATE="$(cat ${HOME}/.my_config/dotfiles/_github/PULL_REQUEST_TEMPLATE)"


alias b="cd .."
alias be="bundle exec"
alias gb="git branch"
alias gbclean="git branch --merged | grep -v "develop" | grep -v '\*' | xargs -n 1 git branch -d"
alias gbfclean="git branch | grep -Ev '(master|develop)' | grep -v '^*' | xargs git branch -D"
alias gcod="gco develop"
alias gcom="gco master"
alias ghprc="${HOME}/.my_config/dotfiles/_github/prepare-github-template"
alias ghprv="gh pr view --web"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count 10"
alias gm="git merge"
alias gpo="git push -u origin"
alias grhh="git reset --hard head"
alias grs="git restore --staged ."
alias rs="bundle exec rails s"
alias rsp="bundle exec rspec"
alias s="git status"
alias mylo-shell-prod="ssh marcus@139.59.193.28"
alias bk="basename ${PWD} | tr '_' '-' | xargs -I{} open 'https://buildkite.com/blake-education/{}'"
alias jira="git branch | grep '^*'| cut -d ' ' -f2- | cut -d '-' -f 1,2 | xargs -I{} open 'https://blakeelearning.atlassian.net/browse/{}'"
alias oadmin="code ${HOME}/Blake/workspaces/blake-admin.code-workspace"
alias ore="code ${HOME}/Blake/workspaces/readingeggs.code-workspace"
alias zp="code ${HOME}/.my_config/dotfiles/.zshrc"
alias st='open -a SourceTree'


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.fly/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/dist/bin:$PATH"
export PATH="$HOME/.geckodriver:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export EDITOR='vim'
export XDG_CONFIG_HOME="$HOME/.config"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH=/Users/Shared/DBngin/mysql/8.0.33/bin:$PATH
