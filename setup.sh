#!/bin/bash

cd ${HOME}

# Install from Brewfile
echo "Installing brew packages..."
brew bundle install --file ~/.config/brewfile/Brewfile-core

# Place .zshenv to change zdotdir
echo "Setting up zsh..."
ln -s .config/zsh/startup/.zshenv ${HOME}/.zshenv

# Set Prezto upstream
cd .config/zsh/.zprezto
git remote add upstream git@github.com:sorin-ionescu/prezto.git

# Make tmux scripts executable
chmod +x ~/.config/tmux/scripts/*
