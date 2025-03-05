#!/bin/bash

# set default git config
cp ./.gitconfig ~

# oh-my-zsh & plugins
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'

# Install p10k theme.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# remove newly created default p10k theme.
rm -f ~/.p10k.zsh

# copy in my p10k theme settings
cp ./.p10k.zsh ~

# update theme
sed -i '/^ZSH_THEME/c\ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc

# use p10k.zsh config. 
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
