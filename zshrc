# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/swenson/.zshrc'
zstyle ':completion:*' completer _complete _ignored
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload colors; colors

# load git stuff
fpath=($fpath $HOME/.zsh/zsh-git)
setopt promptsubst
typeset -U fpath
autoload add-zsh-hook
autoload -U zgitinit
zgitinit
autoload -U prompt_wunjo_setup; prompt_wunjo_setup

export LAST_SUCCESS="%(0?."\:\)"."\:\(")"

autoload -Uz vcs_info
function precmd() {
  vcs_info;
  export VCS_STATE="${vcs_info_msg_0_}";
  reset_prompt
}

function reset_prompt() {
  export PROMPT="%{$fg[white]%}[%B%{$fg[red]%}%n%{$fg[magenta]%}@%b%{$fg[cyan]%}%m%B %{$fg[green]%}%*%b%{$fg[white]%}] %B%{$fg[blue]%}%C%{$fg[green]%} $LAST_SUCCESS %{$fg[magenta]%}%(!.#.$) %b%{$fg[white]%}"
  export RPROMPT="%{$fg[red]%}$VCS_STATE%{$fg[white]%}"
}

reset_prompt


setopt hist_ignore_all_dups
setopt hist_ignore_space


case `uname` in
  Linux)
  alias ls='ls -F --color'
  ;;
  Darwin)
  alias ls='ls -FG'
  alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
  ;;
esac

alias cd..='cd ..'
alias t='task'

export EDITOR=vim

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /usr/local/google/home/cswenson/.zsh/cache
export PATH="$PATH:$HOME/bin"
export PATH="/usr/local/bin:$PATH"
alias g=$HOME/g

export ANDROID_HOME="$HOME/android"

export PATH="$PATH:$HOME/android/tools:$HOME/android/platform-tools"
# Use good Ruby
export PATH="/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH"

# Local stuff
export PATH="$HOME/bin:$PATH"

# rbenv
if [[ -e `which rbenv` ]]; then
  eval "$(rbenv init -)"
fi

function breakvpn() {
    gw=`netstat -arn | grep -e '^default' | awk '{print $2}'`
    sudo route delete $1
    sudo route add $1 $gw
}

if [[ -e `which sshagent` ]]; then
  sshagent
fi

export GNUTERM=x11

if [[ -e $HOME/nacl_sdk ]]; then
  export NACL_SDK_ROOT=$HOME/nacl_sdk
fi

if [[ -e $HOME/go ]]; then
  export GOROOT=$HOME/go
  export PATH="$PATH:$GOROOT/bin"
fi

if [[ -e $HOME/QSTK ]]; then
  source $HOME/QSTK/local.sh
fi

if [[ -e $HOME/sage-src ]]; then
  #SAGE_VERSION=`python -c 'import glob; import os; print(".".join(map(str, sorted([tuple(int(x) for x in (d.split("-")[-1]).split(".")) for d in glob.glob('`
  #export SAGE_ROOT=$HOME/sage-src/sage-$SAGE_VERSION
  #export PATH="$SAGE_ROOT:$PATH"
fi

if [[ -e /Library/Frameworks/Python.framework/Versions/2.7 ]]; then
  export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7
  export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
fi

if [[ -e $HOME/rebar ]]; then
  export PATH="$PATH:$HOME/rebar"
fi

if [ -x /usr/local/scripts/ssx-agents ] ;  then
  eval `/usr/local/scripts/ssx-agents $SHELL`
fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export MAVEN_OPTS=-Xmx1024m
alias t=$HOME/todo.txt-cli/todo.sh
