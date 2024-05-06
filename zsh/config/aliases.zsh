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

# Git
# ----
alias ggac='git add . && git commit'
alias ggac:amend='git add . && git commit --amend'
alias ggdev='git checkout dev'
alias ggmo='git merge origin/main'
alias ggmend='git commit --amend --no-edit'
alias ggpatch='ga . && ggmend && ggpush -f'
alias ggcp='git cherry-pick'

# Github CLI
# ----
alias pr='gh pr view'
alias prnew='gh pr create'

#Others
#----
source $HOME/.zsh/config/npm.zsh
