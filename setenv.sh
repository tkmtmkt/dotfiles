#!/bin/bash
echo -e "\n. ~/.dotfiles/_bash_profile" >> ~/.bash_profile
echo -e "\n. ~/.dotfiles/_bashrc" >> ~/.bashrc

while read NAME
do
  SOURCE=".dotfiles/_${NAME}"
  TARGET="${HOME}/.${NAME}"
  [[ -L $TARGET ]] && rm $TARGET
  [[ ! -e $TARGET ]] && ln -sf $SOURCE $TARGET
done <<EOS
bash_aliases
gitconfig
gitexclude
tmux.conf
vimrc
vim
EOS

# vim: set ft=sh ts=2 sw=2 et:
