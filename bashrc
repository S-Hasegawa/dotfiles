### .bashrc for MacOS X ###
# 本設定ファイルは.bash_profileから呼び出されることを前提とする

## プロンプト、及びエイリアスの設定 {{{
# ubuntuのデフォルトの.bashrcからいくらかインポート

# 対話モードで起動しなかった場合は
[ -z "$PS1" ] && return

# プロンプトの表示を変更
## \t: 時間, \u: ログインユーザ, \w: マシン名, __git_ps1: ブランチ名, \n: 改行
## ブランチ名は後続のgit補完を有効化する必要がある
export PS1='\[\033[32m\][\t] \[\033[33m\]\u@local\[\033[00m\]:\[\033[34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\n\$ '

# lsをカラー化 オプションはgnuのlsと違うので注意
alias ls='ls -G'
# 他の省略形も定義
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# grepの結果をカラー化
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# サーバのショートカットなど、公開しちゃいけないものは別ファイルに書いて読み込む
if [ -f ~/dotfiles/secret/secret_rc ]; then
    source ~/dotfiles/secret/secret_rc
fi
## }}}

export EDITOR=vim

## JAVA_HOMEを設定
# export JAVA_HOME=`/usr/libexec/java_home`

## gitの補完を有効化
# homebrewでgitをインストールするとついてくるものを利用する
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
# git diff の見た目をmore betterに(git 2.9移行有効)
# git configにも投入する必要あり
# see also: http://qiita.com/takyam/items/d6afacc7934de9b0e85e
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight


## virtualenv環境のpython3有効化
# いろいろ試す用のpythonは ~/venv に突っ込めばよい
export VIRTUAL_ENV_DISABLE_PROMPT=1
alias py2='source ~/venv/py2/bin/activate'
alias py3='source ~/venv/py3/bin/activate'

## rbenvを有効化
# このrbenvはhomebrewで入れたので実行ファイルは /usr/local/bin にある
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## nodebrewを有効化
export PATH=$HOME/.nodebrew/current/bin:$PATH

## GOPATHをセット
# homeにgo/を切って使うことにする
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# 便利ツール direnv を有効化
if which direnv > /dev/null; then eval "$(direnv hook bash)"; fi

# headlessをコマンドラインから使うためのalias
alias google-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# google cloud sdkの初期化
source /Users/s-hasegawa/work/google-cloud-sdk/completion.bash.inc
source /Users/s-hasegawa/work/google-cloud-sdk/path.bash.inc

## pipenv設定
# virtualenv（.venvディレクトリ）をプロジェクト内に作る
#デフォルトはユーザのhomeディレクトリ
export PIPENV_VENV_IN_PROJECT=true

# opensslの利用を伴うコンパイルは次の環境変数が無いとコケるかも（例: pythonのmysqlclient）
# ref: https://medium.com/@shandou/pipenv-install-mysqlclient-on-macosx-7c253b0112f2
# export LDFLAGS="-L/usr/local/opt/openssl/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl/include"
