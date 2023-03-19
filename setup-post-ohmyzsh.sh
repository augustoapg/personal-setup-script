 #!/usr/bin/env bash

# after installing oh-my-zsh the script stops running, and oh-my-zsh overwrites the .zshrc file
# so we need a second setup script to do anything .zshrc related

echo "Replace .zshrc file"
cp ./config-files/.zshrc ~/.zshrc

echo "Copy configs from previous .zshrc to new one"
cat ~/.zshrc.pre-oh-my-zsh >> ~/.zshrc

echo "Installing zsh-syntax highlighting"  
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR:-$HOME}/zsh-syntax-highlighting
echo "source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "Installing zsh-autocompletion"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# adds plugin into .zshrc by replacing the "plugins" line with "plugins" plus a new line with the plugin
sed -i "" 's/\(^plugins=($\)/plugins=(\n   zsh-autosuggestions/' ~/.zshrc

echo "Installing powerlevel10k"
git -C "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" pull || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp ./config-files/.p10k.zsh ~/.p10k.zsh
