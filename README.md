dotfiles
========

セットアップ
------------

### チェックアウト

場所はどこでもよいけど、~/apps以下に置くことにした。

    cd ~/apps
    git clone git://github.com/tkmtmkt/dotfiles.git

上記コマンドだけではサブモジュールがチェックアウトされないので、
以下のコマンドも実行する。

    cd ~/apps/dotfiles

    # .gitmodule の submodule 設定を .git/config に反映する。
    git submodule init

    # .git/confg の submodule 設定に従いリポジトリ内容を取得する。
    git submodule update

### シンボリックリンク作成 (Linux)

    for f in $(ls _*)
    do
      f1="$PWD/$f"
      f2="~/$(echo $f | sed 's/^_/\./')"

      echo "$f1 => $f2"
      [ -f $f2 ] && mv $f2 $f2.org
      ln -s $f1 $f2
    done
    ln -s "$PWD/vimfiles" ~/.vim

### シンボリックリンク作成 (Windows)

Windows PowerShellコンソールにて以下実行

    cmd /c mklink -d vimfiles $HOME/vimfiles
    cmd /c mklink _vimrc $HOME/_vimrc

<!-- vim: set ts=4 sw=4 et:-->
