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

# Git
# ----
alias ggac='git add . && git commit'
alias ggac:amend='git add . && git commit --amend'
alias ggpurge='git branch | grep -v "main" | xargs git branch -D'
alias ggdev='git checkout dev'
alias ggmo='git merge origin/main'
alias ggmend='git commit --amend --no-edit'
alias ggpatch='ga . && ggmend && ggpush -f'
alias ggcp='git cherry-pick'

