#!/bin/bash

cd ${HOME}

# Place .zshenv to change zdotdir
ln -s .config/zsh/startup/.zshenv ${HOME}/.zshenv

# Set Prezto upstream
cd .config/zsh/.zprezto
git remote add upstream git@github.com:sorin-ionescu/prezto.git
