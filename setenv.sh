#!/bin/bash
while read NAME
do
  [[ -z $(grep -o "~/.dotfiles/_${NAME}" ~/.${NAME}) ]] &&
    cat <<EOS >> ~/.${NAME}
EOS
done <<EOS
bash_profile
bashrc
EOS

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
