# SETUP SCRIPTS

This repo is for installing most of the software and the configs I need in order to start working with a new MAC computer. Most of the software is installed using Ansible, and then the configs are separated into two bash files. The Ansible is downloaded and then executed in the first bash file.

## How to run
- Clone this repo
- `cd` to the folder where you cloned
- Run `sh setup.sh`. When script finishes, a new `oh-my-zsh` terminal will be opened
- `cd` again to the cloned repo
- Run `sh setup-post-ohmyzsh.sh` to finish installation
- You might need to run `p10k configure` to properly install the font needed to show the icons in powerlevel10k

## Quirks
- Tested this in a pre-M1 MAC. Not sure if this would work in a M1 chip and beyond
- You need `git` in order to clone the repo, but the repo itself contains steps to install git... chicken and the egg kind of situation
- The setup script had to be separated into two, since after installing `oh-my-zsh`, the previous terminal session is killed and a new one starts, so the script gets terminated
- Since `oh-my-zsh` created a brand new `.zshrc` file, the second script contains most of what needs to go to the `.zshrc` file, including replacing the `.zshrc` file with the one stored in the repo itself
- The reason why the `.zshrc.pre-oh-my-zsh` is appended into the new one is due to the python path that gets dynamically created depending on the python version installed
- All the steps to manually download and install the necessary fonts for `powerlevel10k` are in the scripts, but for some reason the icons are still missing after the script finishes running, so the user needs to run `p10k configure` to install the fonts after everything is done
