#!/bin/bash

cd ${HOME}

# Install from Brewfile
echo "Installing brew packages..."
brew bundle install --file ~/.config/brewfile/Brewfile-core

# Place .zshenv to change zdotdir
echo "Setting up zsh..."
ln -s .config/zsh/.zshenv ${HOME}/.zshenv

# Make tmux scripts executable
chmod +x ~/.config/tmux/scripts/*
