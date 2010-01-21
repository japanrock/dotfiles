## This file encoding:utf8
## This file line feed code:LF

## encoding
#export LANG=ja_JP.UTF-8
export LANG=ja_JP.eucJP 

## use color
setopt prompt_subst

## no beep
setopt nobeep

# see http://d.hatena.ne.jp/walf443/20071119/1195487813
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# Path Setting
path=(
$HOME/local/bin $HOME/local/X11R6/bin \
/usr/local/RealPlayer8 \
/bin /usr/local/bin /usr/bin \
/usr/local/X11R6/bin /usr/X11R6/bin \
/usr/local/bin/games /usr/games \
/dev \
/sbin
)

autoload -U compinit
compinit
setopt auto_list
setopt list_packed

## prompt
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

## history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups

setopt auto_pushd
setopt pushd_ignore_dups

## ls next to cd
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
alias -g st='status'
alias svn_addall="svn status | grep '^?' | awk '{print \$2}' | xargs svn add"

# screen
alias sc='screen'

# git
alias g='git'
alias s='git status'
alias gn='git --no-pager'
alias -g ci='commit'
alias -g co='chekcout'

# for Mac
# export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
# export MANPATH=/opt/local/man:$MANPATH
# export PATH=/Users/japanrock/bin/ruby/186p383/bin:$PATH
# export PATH=/Developer/usr/bin:/Users/japanrock/bin/ruby/186p383/bin:/opt/local/bin:/opt/local/sbin/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:$PATH
