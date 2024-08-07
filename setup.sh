#!/bin/bash

cd ${HOME}

# Install from Brewfile
echo "Installing brew packages..."
brew bundle install --file ~/.config/Brewfile

# Place .zshenv to change zdotdir
echo "Setting up zsh..."
ln -s .config/zsh/startup/.zshenv ${HOME}/.zshenv

# Set Prezto upstream
cd .config/zsh/.zprezto
git remote add upstream git@github.com:sorin-ionescu/prezto.git

# Install Input-Mono font
# https://input.djr.com/build/?fontSelection=whole&a=ss&g=ss&i=serifs_round&l=serifs_round&zero=slash&asterisk=0&braces=0&line-height=1.2&accept=I+do
echo "Installing Input font..."
curl -o ./input.zip 'https://input.djr.com/build/?fontSelection=whole&a=ss&g=ss&i=serifs_round&l=serifs_round&zero=slash&asterisk=0&braces=0&line-height=1.2&accept=I+do'
unzip ./input.zip -d input
cp input/Input_Fonts/InputMono/InputMono/* ~/Library/Fonts
rm -rf input.zip ./input

