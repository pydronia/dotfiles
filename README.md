# dotfiles
My collection of configuration files. Currently contains configurations for:
- alacritty
- git
- zsh
- nvim
- tmux
- mise
Also includes a `Brewfile`, and a setup script to simplify new installations

## Setup
1. Install [Homebrew](https://brew.sh/)
2. Install git
3. Clone this repo:
```
git clone --recurse-submodules git@github.com:Pydronia/dotfiles.git "${HOME}/.config"
```
4. Run `setup.sh`
5. Install and patch font with `font_setup.sh`
6. Check that homebrew zsh is set correctly (chsh)
7. Make sure python, node are installed through mise
8. Install required LSPs
    - lua-language-server
	- pyright
	- ruff

