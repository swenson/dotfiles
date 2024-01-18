# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git git-extras git-remote-branch macos virtualenv ruby rails python sudo sublime scala screen rsync pip mvn golang brew)
plugins=(git git-extras macos virtualenv ruby rails python sudo sublime scala screen rsync pip mvn golang brew)

source $ZSH/oh-my-zsh.sh

# User configuration

#autoload -U prompt_wunjo_setup; prompt_wunjo_setup

# export LAST_SUCCESS="%(0?."😀"."😂")"
export LAST_SUCCESS="%(0?.":\)".":\(")"

autoload -Uz vcs_info
function precmd() {
  vcs_info;
  export VCS_STATE="${vcs_info_msg_0_}";
  reset_prompt
}

function reset_prompt() {
  #export PROMPT="%{$fg[white]%}[%B%{$fg[red]%}$name%{$fg[magenta]%}@%b%{$fg[cyan]%}%m%B %{$fg[green]%}%*%b%{$fg[white]%}] %B%{$fg[blue]%}%C%{$fg[green]%} $LAST_SUCCESS %{$fg[magenta]%}%(!.#.$) %b%{$fg[white]%}"
  export PROMPT="%{$fg[white]%}[%B%{$fg[red]%}swenson%{$fg[magenta]%}@%b%{$fg[cyan]%}hashicorp%B %{$fg[green]%}%*%b%{$fg[white]%}] %B%{$fg[blue]%}%C%{$fg[green]%} $LAST_SUCCESS %{$fg[magenta]%}%(!.#.$) %b%{$fg[white]%}"
  export RPROMPT="%{$fg[red]%}$VCS_STATE%{$fg[white]%}"
}

reset_prompt

function hop() {
  ssh -t $1 ssh -t $2
  #`ipython --no-color-info --quiet --no-pprint --colors=NoColor -c "hop('$1', '$2', '$3')"`
}

export name="$USER"
case $USER in
  swenson)
    export name="cupcake"
    ;;
  root)
    export name="admiral-cupcake"
    ;;
esac


case `uname` in
  Linux)
  alias ls='ls -F --color'
  ;;
  Darwin)
  # default of 'x11' causes all plots to fail on macOS by default, but 'qt' works
  export GNUTERM=qt
  export LSCOLORS=Exfxcxdxbxegedabagacad
  alias ls='ls -FG'
  #if [[ -e '/Applications/Sublime Text.app' ]]; then
  #  alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl';
  #elif [[ -e '/Applications/Sublime Text 2.app' ]]; then
  #  alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl';
  #fi
  #
  alias lock="osascript -e 'tell application \"Finder\" to sleep'"

  ;;
esac

alias cd..='cd ..'

export ANDROID_HOME="$HOME/android/sdk"

export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
# Use good Ruby
export PATH="/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH"

# Local stuff
export PATH="$HOME/bin:$PATH"
if [ -e $HOME/.local/bin ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# rbenv
if [[ -e `which rbenv` ]]; then
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

function breakvpn() {
    gw=`netstat -arn | grep -e '^default' | awk '{print $2}'`
    sudo route delete $1
    sudo route add $1 $gw
}

if [[ -e `which sshagent` ]]; then
  # sshagent
fi

export GNUTERM=x11

if [[ -e $HOME/nacl_sdk ]]; then
  export NACL_SDK_ROOT=$HOME/nacl_sdk
fi

if [[ -e $HOME/gopath ]]; then
  export GOPATH=$HOME/gopath
  export PATH="$PATH:$GOPATH/bin"
fi

if [[ -e /usr/local/go ]]; then
  export GOROOT=/usr/local/go
  export PATH="$PATH:/usr/local/go/bin"
fi

if [[ -e $HOME/projects/go ]]; then
  export GOPATH=$HOME/projects/go
  export PATH="$PATH:$GOPATH/bin"
fi

if [[ -e /usr/local/opt/go/libexec/bin ]]; then
  export PATH="$PATH:/usr/local/opt/go/libexec/bin"
fi

if [[ -e $HOME/QSTK ]]; then
  source $HOME/QSTK/local.sh
fi

if [[ -e $HOME/sage-src ]]; then
  #SAGE_VERSION=`python -c 'import glob; import os; print(".".join(map(str, sorted([tuple(int(x) for x in (d.split("-")[-1]).split(".")) for d in glob.glob('`
  #export SAGE_ROOT=$HOME/sage-src/sage-$SAGE_VERSION
  #export PATH="$SAGE_ROOT:$PATH"
fi

if [[ -e $HOME/rebar ]]; then
  export PATH="$PATH:$HOME/rebar"
fi

if [ -x /usr/local/scripts/ssx-agents ] ;  then
  eval `/usr/local/scripts/ssx-agents $SHELL`
fi

if [[ -e /usr/bin/vagrant ]]; then
  alias vagrant=/usr/bin/vagrant
fi

#export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


if (which mvn >& /dev/null); then
  m=$(mvn --version 2>/dev/null | grep -e 'Java version' | cut -d '.' -f2)
  # java 8 doesn't have permgen
  #if [ "$m" -gt "7" ]; then
  #  export MAVEN_OPTS="-Xmx1024m"
  #else
  #  export MAVEN_OPTS="-Xmx1024m" # -XX:MaxPermSize=256M"
  #fi
fi


# Fix Java to not drive me crazy
export _JAVA_OPTIONS="-Djava.awt.headless=true"

# Set JAVA_HOME on Linux
if [[ -e /usr/lib/jvm/java-7-openjdk-amd64 ]]; then
  export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# brew sbin
export PATH="/usr/local/sbin:$PATH"

# todo.txt
if [[ -e $HOME/Dropbox/todo/todo.sh ]]; then
  alias t="$HOME/Dropbox/todo/todo.sh -t"
  case `hostname` in
    swensonator*)
      #$HOME/Dropbox/todo/todo.sh ls simple
      ;;
    *)
      #$HOME/Dropbox/todo/todo.sh ls -simple
      ;;
  esac
fi

# time.txt
if [[ -e $HOME/Dropbox/time.txt-cli/clock.py ]]; then
  alias clock="$HOME/Dropbox/time.txt-cli/clock.py"
fi

# cuda
if [[ -e /Developer/NVIDIA/CUDA-5.5 ]]; then
  export PATH="/Developer/NVIDIA/CUDA-5.5/bin:$PATH"
  export DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-5.5/lib:$DYLD_LIBRARY_PATH"
fi

alias git-delete-merged-branches='git branch --merged | grep -ve "*" | xargs -n 1 git branch -d'
alias git-delete-merged-remote-branches='git branch -r --merged | grep -ve master | grep -ve prod | sed "s/origin\///" | xargs -n 1 git push --delete origin'

# always homebrew / local/bin first
export PATH="/usr/local/bin:$PATH"

alias scala-ctags='ctags -R . --exclude=target --exclude=vendorv'

# kill me
export DYLD_LIBRARY_PATH=/usr/local/Cellar/curl/7.34.0/lib:$DYLD_LIBRARY_PATH

sshagent () {
    . "${HOME}"/bin/sshagent
}

sshagent

# smart moving
autoload -U zmv
alias mmv='noglob zmv -W'

# Fix broken Python at least
export PATH="/usr/local/bin:$PATH"

for file in $(find $HOME -maxdepth 1 -name '.zshrc.*'); do
  source $file
done

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

function nvm_load() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

}


# source /Users/swenson/.rvm/scripts/rvm

# fix git tab completion
#unalias git

#[[ -s "/Users/swenson/.gvm/scripts/gvm" ]] && source "/Users/swenson/.gvm/scripts/gvm"

#case `uname` in
#  Darwin)
#    source $(brew --prefix nvm)/nvm.sh
#    export NVM_DIR=~/.nvm
#    ;;
#esac

#[[ -s "/Users/swenson/.gvm/scripts/gvm" ]] && source "/Users/swenson/.gvm/scripts/gvm"

if [[ -e /usr/local/opt/pyenv/bin ]]; then
  export PATH="/usr/local/opt/pyenv/bin:$PATH"
fi

if [[ -e $HOME/.pyenv ]]; then
  export PATH="/home/swenson/.pyenv/bin:$PATH"
fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

alias agq='ag -Q'
function ffind() {
  find . -name "$1"
}


case `hostname` in
  swensonator*) # simple
    export JAVA_HOME=$(/usr/libexec/java_home)
    ;;
esac

if [ -e /Developer/NVIDIA ]; then
  export PATH=/Developer/NVIDIA/CUDA-6.5/bin:$PATH
  export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH
fi

alias curlj="curl -H 'Content-Type: application/json'"

alias gdiff='git diff -w'

alias port='nc -vzw5'


if (which htop >& /dev/null); then alias top="$(which htop)"; fi

# docker-machine
if [[ -e $(which docker-machine) ]]; then
  docker-machine start default > /dev/null;
  eval $(docker-machine env default);
fi

function peek() {
  tmux split-window -p 33 "$EDITOR" "$@" || exit;
}

if [[ -e /usr/local/opt/openjdk/bin ]]; then
  export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi

if [ -e $HOME/.zsh_local ]; then
  source ~/.zsh_local
fi
