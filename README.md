
セットアップ
------------

### チェックアウト

dotfilesをチェックアウトする。

```sh
$ git clone git://github.com/tkmtmkt/dotfiles.git ~/git/dotfiles

```

上記コマンドだけではサブモジュールがチェックアウトされないので、
以下のコマンドも実行する。

```sh
$ cd ~/git/dotfiles

# .gitmodule の submodule 設定を .git/config に反映する。
$ git submodule init

# .git/confg の submodule 設定に従いリポジトリ内容を取得する。
$ git submodule update

```

### シンボリックリンク作成 (Linux)

```sh
# ansibleを使用できる場合
$ cd ~/git/dotfiles
$ ansible-playbook mklink.yml -i hosts

# ansibleを使用できない場合
$ cd ~
$ for f in $(find git/dotfiles -maxdepth 1 -name _*)
do
    l=$(echo $f | sed 's/git\/dotfiles\/_/./g')
    [ -e $l ] && mv $l{,.bak}
    ln -sf $f $l
done

```


ツール
------

### Java

* [Java SE - Downloads | Oracle Technology Network | Oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Java Archive Downloads - Java SE 7](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html)
* [Java Archive Downloads - Java SE 6](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html)

```sh
$ mkdir -p ~/apps/java
$ cd ~/apps/java

# java8
$ tar zxvf jdk-8u111-linux-x64.tar.gz
$ ln -sf $(ls -1 | grep 1.8.0) 8

# java7
$ tar zxvf jdk-7u80-linux-x64.tar.gz
$ ln -sf $(ls -1 | grep 1.7.0) 7

# java6
$ sh jdk-6u45-linux-x64.bin
$ ln -sf $(ls -1 | grep 1.6.0) 6

```


### Python

* [Anaconda - Open Data Science Core](https://www.continuum.io/)

```sh
$ sh Anaconda3-4.2.0-Linux-x86_64.sh -p ~/apps/anaconda3

```


### Ruby

* [RVM: Ruby Version Manager](https://rvm.io/)

```sh
# install RVM
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ curl -sSL https://get.rvm.io | bash -s stable

# install Ruby
$ rvm list known | head -20
```


参考
----

### [Ubuntu] デフォルトエディタをvimに設定する

    sudo update-alternatives --config editor


### [Ubuntu] ホームディレクトリの日本語ディレクトリを英語にする

    LANG C xdg-user-dirs-gtk-update


<!-- vim: set ts=4 sw=4 et:-->
