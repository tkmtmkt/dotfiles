# セットアップ

## チェックアウト

    git clone git://github.com/tkmtmkt/dotfiles.git

    cd dotfiles

    git submodule init
    git submodule update

## Linux

    for f in $(ls _*)
    do
      f1="$PWD/$f"
      f2="~/$(echo $f | sed 's/^_/\./')"
    
      echo "$f1 => $f2"
      [ -f $f2 ] && mv $f2 $f2.org
      ln -s $f1 $f2
    done
    ln -s vimfiles ~/.vim

## Windows

    cmd /c mklink -d vimfiles $HOME/vimfiles
    cmd /c mklink _vimrc $HOME/_vimrc

