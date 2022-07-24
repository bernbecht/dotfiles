#!/bin/zsh
OH_MY_ZSH_DIR=~/.oh-my-zsh
VIM=~/.vim

echo "
 _____          __     ___  __  __               
|     \ .-----.|  |_ .'  _||__||  |.-----..-----.
|  --  ||  _  ||   _||   _||  ||  ||  -__||__ --|
|_____/ |_____||____||__|  |__||__||_____||_____|
"

echo "🐻 Checking Oh My ZSH installation"

# -d operator checks if the directory exists
if [ -d "$OH_MY_ZSH_DIR" ]
then
    echo "  ✅ $OH_MY_ZSH_DIR already exists"
else
    # Install Oh My Zsh
    echo "💿 Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "🐻 Creating symbolic links..."

# ZSH
echo "  🏃‍♂️ ZSH config"
ln -sfn ~/dotfiles/zsh ~/.zsh
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
echo "  ✅ ZSH config"

# Git
echo "  🏃‍♂️ Git config"
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gitignore_global ~/.gitignore_global
echo "  ✅ Git config"

#Vim
echo "  🏃‍♂️ Vim config"
echo "      ✅ .vimrc"
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
if ! [ -d "$VIM"/colors ]
then
    echo "      📁 Creating .vim folder"
    mkdir -p $VIM
fi 
echo "      ✅ .vim folder"

if ! [ -d "$VIM"/colors ]
then
    mkdir -p ~/.vim/colors
    echo "      📁 Creating .vim/colors folder"
fi
ln -sf ~/dotfiles/vim/colors ~/.vim/colors
echo "      ✅ Vim colors"

echo "  ✅ Vim config"


source ~/.zshrc
