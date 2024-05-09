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
alias ggdev='git checkout dev'
alias ggmend='git commit --amend --no-edit'
alias ggpatch='ga . && ggmend && ggpush -f'
alias ggcp='git cherry-pick'

# Github CLI
# ----
alias pr:v='gh pr view'
alias pr:c='gh pr create'

#Others
#----
source $HOME/.zsh/config/npm.zsh
