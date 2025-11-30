# AGENTS.md

## Goal
Personal dotfiles configuration management repository for maintaining consistent development environments across different machines.

## File Structure
```
├── .github/        # GitHub workflows and actions
├── .vscode/        # VSCode settings and color themes
├── brew/           # Homebrew package configurations
├── git/            # Global gitconfig and gitignore settings
├── keyboard/       # Custom keyboard mappings (Karabiner)
├── scripts/        # Utility scripts (bash, JavaScript)
├── vim/            # Vim configuration and color schemes
├── zsh/            # ZSH shell configuration (modular)
├── bootstrap.sh    # Setup script for creating symlinks
└── package.json   # NPM scripts for bootstrap/update
```

## Commands
- **Bootstrap**: `npm run bootstrap` or `./bootstrap.sh` (sets up symlinks)
- **Update**: `npm run update` (git pull origin main)
- **Icon finder**: `cd scripts/find-icon-variables-usage && npm run find`

## Code Style Guidelines
- **Shell scripts**: Use ZSH syntax, emoji indicators for visual feedback, colored logging functions, comprehensive error handling
- **JavaScript**: CommonJS modules, functional programming patterns, minimal dependencies
- **Configuration**: Modular sourcing with clear section headers, consistent 2-space indentation
- **Git**: Follow existing alias conventions (gg*, g* prefixes), descriptive commit messages with emoji
- **Functions**: Use namespaced naming with colons (git:resetTo, whoknocks), always include error checking
- **Structure**: Keep configs modular, organize scripts by language/type, use symlink-based setup