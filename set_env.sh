#!/bin/bash
# vim: set ft=sh ts=2 sw=2 et:
#
# 使用方法
# $ . ~/.dotfiles/set_env.sh
#

# .bash_profileに_bash_profile読み込み処理を追記する
TMP="~/.dotfiles/_bash_profile"
[[ -z $(grep -o "$TMP" ~/.bash_profile) ]] &&
  echo "[[ -s $TMP ]] && . $TMP" >> ~/.bash_profile

# .bashrcに_bashrc読み込み処理を追記する
TMP="~/.dotfiles/_bashrc"
[[ -z $(grep -o "$TMP" ~/.bashrc) ]] &&
  echo "[[ -s $TMP ]] && . $TMP" >> ~/.bashrc

# シンボリックリンクを作成する
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
