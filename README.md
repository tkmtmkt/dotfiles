
セットアップ
------------

### チェックアウト

dotfilesをチェックアウトする。

```sh
$ git clone git://github.com/tkmtmkt/dotfiles.git ~/.dotfiles

```

上記コマンドだけではサブモジュールがチェックアウトされないので、
以下のコマンドも実行する。

```sh
$ cd ~/.dotfiles

# .gitmodule の submodule 設定を .git/config に反映する。
$ git submodule init

# .git/confg の submodule 設定に従いリポジトリ内容を取得する。
$ git submodule update

```

### 環境設定

環境設定用シェルスクリプトを実行する。

```sh
# 環境設定
$ . ~/.dotfiles/setenv.sh

# 設定確認
$ py.test -v --tb=short ~/.dotfiles/test_env.py
```


ツール
------

### ssh

```
$ cat <<'EOS' > ~/.ssh/config
Host *
  StrictHostKeyChecking no
  IdentitiesOnly yes
  TCPKeepAlive yes

Host github.com
  Hostname github.com
  User git

Host bitbucket.org
  Hostname bitbucket.org
  User git
EOS

$ cat <<'EOS' > ~/.ssh/rc
echo ""$USER" has logged in from $SSH_CLIENT at `date` " | mail -s "SSH LOGIN INFO ({ホスト名})" {メールアドレス}
EOS
```

### docker

* [docker-compose](https://docs.docker.com/compose/install/#install-compose)


### vim

プラグインを最新版に更新する。

```
:call dein#update()
```

~/.cache/deinを更新する。.dotfilesを展開した環境で実行する必要あり。

```
:call dein#recache_runtimepath()
```

### pwgen

パスワード生成

```sh
$ pwgen -cnyB1 12 5
```

### Java

* [Java SE - Downloads | Oracle Technology Network | Oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [Java Archive Downloads - Java SE 11](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html)
* [Java Archive Downloads - Java SE 8](http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html)

```sh
$ mkdir -p ~/opt/java
$ cd ~/opt/java

# java11
$ tar xf jdk-11.0.1_linux-x64_bin.tar.gz
$ ln -sf $(ls -1 | grep 1.11) 11

# java8
$ tar xf jdk-8u181-linux-x64.tar.gz
$ ln -sf $(ls -1 | grep 1.8.0) 8

```


### SDKMAN

* [SDKMAN! the Software Development Kit Manager](http://sdkman.io/index.html)

```sh
# SDKMANインストール
$ curl -s "https://get.sdkman.io" | bash

# ツールインストール
$ sdk install gradle
$ sdk install sbt
$ sdk install scala
$ sdk install kotlin
$ sdk install leiningen
$ sdk install maven
$ sdk install ant
```


### Python

#### Jupyterカーネル

* [Apache Toree](https://toree.apache.org/docs/current/user/quick-start/) -
  Toree is a kernel for the Jupyter Notebook platform providing interactively access to Apache Spark.

```sh
$ jupyter toree install --spark_home=/usr/local/bin/apache-spark/
```

* [A Jupyter kernel for bash](https://github.com/takluyver/bash_kernel)

```sh
$ python -m bash_kernel.install
```


### Ruby

* [RVM: Ruby Version Manager](https://rvm.io/)

```sh
# RVMインストール
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ curl -sSL https://get.rvm.io | bash -s stable

# RVM更新
$ rvm get stable

# Rubyインストール
$ rvm list known | head -20
$ rvm install 2.4
```


### Node

* https://github.com/creationix/nvm

```sh
# NVMインストール
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# nodeインストール
$ nvm ls-remote
$ nvm install --lts
$ nvm install v7.10

# nodeバージョンデフォルト設定
$ nvm alias default v7.10

# nodeバージョン切り替え
$ nvm use default
$ nvm use --lts
$ nvm use v7.10
$ nvm ls
```


参考
----

### [Ubuntu] デフォルトエディタをvimに設定する

    sudo update-alternatives --config editor


### [Ubuntu] ホームディレクトリの日本語ディレクトリを英語にする

    LANG C xdg-user-dirs-gtk-update


### generate locale

    localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
    localedef -i ja_JP -c -f SHIFT_JIS -A /usr/share/locale/locale.alias ja_JP.SJIS


### testinfra

* [Testinfra test your infrastructure](https://testinfra.readthedocs.io/en/latest/)
* [testinfra Documentation](https://media.readthedocs.org/pdf/testinfra/stable/testinfra.pdf)

<!-- vim: set ft=markdown ts=4 sw=4 et: -->
