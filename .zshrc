## This file encoding:utf8
## This file line feed code:LF

## encoding file load
[ -f ~/.zshrc.encoding ] && source ~/.zshrc.encoding

## use color
autoload -U colors
colors
setopt prompt_subst
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## prompt
PROMPT="%U$USER@%m%%%u "
RPROMPT="[%~]"

precmd () {
  PROMPT="%{%(?.$fg[white].$fg[red])%}%U$USER@%m%%%u%{$reset_color%} "
}

## no beep
setopt nobeep

# see http://d.hatena.ne.jp/walf443/20071119/1195487813
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# Path Setting
path=(
$HOME/local/bin $HOME/local/X11R6/bin $HOME/bin/rak/bin $HOME/bin \
/usr/local/RealPlayer8 \
/bin /usr/local/bin /usr/bin \
/usr/local/X11R6/bin /usr/X11R6/bin \
/usr/local/bin/games /usr/games \
/dev \
/sbin
)

export PATH=/usr/local/bin:$PATH
#alias sudo="sudo PATH=$PATH"

autoload -U compinit
compinit
setopt auto_list

## list_packed : see http://journal.mycom.co.jp/column/zsh/005/index.html
setopt list_packed

## cdd : see http://d.hatena.ne.jp/secondlife/20080218/1203303528
source ~/bin/cdd
function chpwd() {
  _reg_pwd_screennum
}

## auto_cd : see http://journal.mycom.co.jp/column/zsh/005/index.html
setopt auto_cd

## correct : see http://journal.mycom.co.jp/column/zsh/005/index.html
setopt correct

## history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups

setopt auto_pushd
setopt pushd_ignore_dups

## ls next to cd
function chpwd() { ls -la }

#alias globals
alias -g st='status'
alias -g G='| egrep'
alias -g L='| less -r'
alias -g H='| head'
alias -g T='| tail'
alias -g C='| pbcopy'
alias -g W='| nkf -w'
alias -g XG='| xargs grep'

## via http://github.com/ryanb/dotfiles/blob/master/zsh/aliases
alias %=' '
alias v="vim"
alias c="cd"

# ls
alias ls="ls -F --color"
alias l="ls -lAh --color"
alias ll="ls -la --color"
alias la='ls -A --color'

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
export SVN_EDITOR=vim
alias svn_addall="svn status | grep '^?' | awk '{print \$2}' | xargs svn add"
alias svndiff="svn diff --no-diff-deleted | less -R"
## svn colordiff see http://d.hatena.ne.jp/Craftworks/20090418/1240082737

# screen
alias scr='screen'

# rails
alias sc='script/console'

# git
alias g='git'
alias s='git status'
alias gn='git --no-pager'
alias -g ci='commit'
alias -g co='chekcout'

# mysql
alias my='mysql -u root'
# My mysql prompt
export MYSQL_PS1='\U[\d]> '

# gems
alias cd_gems='cd `ruby -rubygems -e "puts Gem.path" | grep "/usr/local"`'
