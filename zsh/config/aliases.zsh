# ====================
# Alias
# ====================

# General purpose
# ----
alias zshconfig="code  ~/.zshrc"
alias p='cd ~/projects'
alias nr='npm run'
alias home='cd ~/'
alias vimconfig='cd ~/dotfiles/vim/ && vim .vimrc'
alias dotfiles='cd ~/dotfiles'
alias src='source ~/.bashrc'
alias bluefilter='hyprshade toggle blue-light-filter'

# Git
# ----
alias ggac='git add . && git commit'
alias ggdev='git checkout dev'
alias ggmend='git commit --amend --no-edit'
alias ggpatch='ga . && ggmend && ggpush -f'
alias ggcp='git cherry-pick'
alias ggclean='sh ~/dotfiles/scripts/bash/delete-local-merged-branches.sh'

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'
alias gapt='git apply --3way'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcv='git commit -v --no-verify'
alias gsc='git show --stat-count=10'

alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcb='git checkout -b'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dffx'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdw='git diff --word-diff'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'

alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'

alias gm='git merge'
alias gma='git merge --abort'
alias gms='git merge --squash'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'

alias gr='git remote'
alias gra='git remote add'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias grv='git remote -v'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'

alias gsta='git stash push'
alias gst='git status'
alias gsts='git status -s'
alias gstu='git stash --include-untracked'
alias gstd='git stash drop'
alias gstp='git stash pop'
alias gsts='git stash show --text'

alias gpl='git pull'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'

alias gsw='git switch'
alias gswc='git switch -c'
alias gswm='git switch master'
alias gswb='git switch -'

# Github CLI
# ----
alias prv='gh pr view'
alias prc='gh pr create'

#Others
#----
# source $HOME/.zsh/config/npm.zsh
