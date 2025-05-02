# dotfiles

A personal dotfiles configuration management repository for maintaining consistent development environments across different machines.

## What's Included

This repository contains configuration files for:

- **ZSH**: Shell configuration with Oh My Zsh
- **Vim**: Editor preferences and color schemes
- **Git**: Global gitconfig and gitignore settings
- **Keyboard**: Custom keyboard mappings
- **Brew**: Package management configurations

## Installation

Clone this repository to your home directory:

```bash
git clone https://github.com/bernardobechtold/dotfiles.git ~/dotfiles
```

Run the bootstrap script to set up symlinks:

```bash
cd ~/dotfiles
./bootstrap.sh
```

Or use npm:

```bash
npm run bootstrap
```

## Usage

### Updating

To update your dotfiles with the latest changes:

```bash
cd ~/dotfiles
git pull origin main
```

Or use npm:

```bash
npm run update
```

### Customization

Feel free to fork this repository and modify it to fit your needs. The modular structure allows you to add or remove configurations as necessary.

## Structure

```
├── .github/        # GitHub specific files
├── .vscode/        # VSCode configuration
├── brew/           # Homebrew configuration
├── git/            # Git configuration files
├── keyboard/       # Keyboard mapping settings
├── scripts/        # Utility scripts
├── vim/            # Vim configuration
├── zsh/            # ZSH configuration
└── bootstrap.sh    # Setup script
```

## License

MIT
