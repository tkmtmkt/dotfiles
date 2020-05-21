#!/bin/bash
# vim: set ft=sh ts=2 sw=2 et:
#
# 使用方法
# $ . /opt/dotfiles/set_env.sh
#
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

# .bashrcに_bashrc読み込み処理を追記する
while read NAME
do
  TMP="${SCRIPT_DIR}/_${NAME}"
  [[ -z $(grep -o "${TMP}" ~/.${NAME} 2> /dev/null) ]] &&
    echo "[[ -s ${TMP} ]] && . ${TMP}" >> ~/.${NAME}
done <<EOS
profile
bash_profile
bashrc
EOS

# シンボリックリンクを作成する
while read NAME
do
  SOURCE="${SCRIPT_DIR}/_${NAME}"
  TARGET="${HOME}/.${NAME}"
  [[ -L ${TARGET} ]] && rm ${TARGET}
  [[ ! -e ${TARGET} ]] && ln -sf $SOURCE ${TARGET}
done <<EOS
bash_aliases
gitconfig
gitexclude
tigrc
tmux.conf
vim
config
EOS
