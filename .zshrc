## This file encoding:utf8
## This file line feed code:LF

## 文字コード
#export LANG=ja_JP.UTF-8
export LANG=ja_JP.eucJP 

## 色を使う
setopt prompt_subst

## ビープを鳴らさない
setopt nobeep

#ファイル名などを補完しすぎたのをC-wで戻れるようにする。( http://d.hatena.ne.jp/walf443/20071119/1195487813 )
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# Path Setting
path=(
$HOME/local/bin $HOME/local/X11R6/bin \
/usr/local/RealPlayer8 \
/bin /usr/local/bin /usr/bin \
/usr/local/X11R6/bin /usr/X11R6/bin \
/usr/local/bin/games /usr/games \
/dev
)

## 補完機能
autoload -U compinit
compinit
## 補完候補を一覧表示
setopt auto_list
## 補完候補を詰めて表示
setopt list_packed

## プロンプト
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

## 履歴の保存先
HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
HISTSIZE=100000
## 保存する履歴の数
SAVEHIST=100000
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## cd したあとにlsが実行される
function chpwd() { ls -la }

## via http://github.com/ryanb/dotfiles/blob/master/zsh/aliases
alias %=' '
alias v="vim"

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# http://blog.s21g.com/articles/219 
_generate () {
  if [ ! -f .generators ]; then
    ./script/generate --help | grep '^  [^ ]*: ' | sed 's/[^:]*:/compadd/' | sed 's/\,//g' > .generators
  fi
  `cat .generators`
}

compdef _generate generate
compdef _generate destroy

# svn
export SVN_EDITOR="vim"

# screen
alias s='screen'

