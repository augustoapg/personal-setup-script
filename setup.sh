#!/usr/bin/env bash

# echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing Python3..."
brew install python3

echo "verify python exists and get python version"
python3 -m pip -V
PY_VERSION=$(eval "python3 -c 'import sys; print(\".\".join(map(str, sys.version_info[:2])))'")

echo "Installing ansible..."
python3 -m pip install --user ansible

echo "Adding ansible to PATH"
echo "export PATH=$PATH:/Users/$USER/Library/Python/$PY_VERSION/bin" >> ~/.zshrc
source ~/.zshrc

echo "Verify ansible has been installed..."
ansible --version

echo "Run ansible script"
ansible-playbook --ask-become-pass ansible-script.yaml

echo "Update VSCode Settings"
cp ./config-files/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

echo "Installing fonts for powerlevel10k"
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o ~/Library/Fonts/MesloLGS\ NF\ Regular.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o ~/Library/Fonts/MesloLGS\ NF\ Bold.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o ~/Library/Fonts/MesloLGS\ NF\ Italic.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o ~/Library/Fonts/MesloLGS\ NF\ Bold\ Italic.ttf

echo "Update iTerm2 Preferences"
cp ~/Library/Preferences/com.googlecode.iterm2.plist ~/Documents/com.googlecode.iterm2.plist.backup
cp ./config-files/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh ; git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
