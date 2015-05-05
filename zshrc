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
plugins=(git git-extras git-remote-branch osx virtualenv ruby rails python sudo sublime scala screen rsync pip mvn golang brew)

source $ZSH/oh-my-zsh.sh

# User configuration

#autoload -U prompt_wunjo_setup; prompt_wunjo_setup

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

function hop() {
  ssh -t $1 ssh -t $2
  #`ipython --no-color-info --quiet --no-pprint --colors=NoColor -c "hop('$1', '$2', '$3')"`
}


case `uname` in
  Linux)
  alias ls='ls -F --color'
  ;;
  Darwin)
  export LSCOLORS=Exfxcxdxbxegedabagacad
  alias ls='ls -FG'
  # boot2docker
  export DOCKER_HOST="tcp://192.168.59.103:2375"
  #if [[ -e '/Applications/Sublime Text.app' ]]; then
  #  alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl';
  #elif [[ -e '/Applications/Sublime Text 2.app' ]]; then
  #  alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl';
  #fi

  ;;
esac

alias cd..='cd ..'

export ANDROID_HOME="$HOME/android/sdk"

export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
# Use good Ruby
export PATH="/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH"

# Local stuff
export PATH="$HOME/bin:$PATH"

export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# rbenv
#if [[ -e `which rbenv` ]]; then
#  eval "$(rbenv init -)"
#fi

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

if [[ -e $HOME/gopath ]]; then
  export GOPATH=$HOME/gopath
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

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256M"


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

# MacTex
if [[ -e /usr/local/texlive/2014/bin/x86_64-darwin ]]; then
  export PATH="$PATH:/usr/local/texlive/2014/bin/x86_64-darwin"
fi

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

[ -s "/Users/swenson/.nvm/nvm.sh" ] && . "/Users/swenson/.nvm/nvm.sh" # This loads nvm

# source /Users/swenson/.rvm/scripts/rvm

# fix git tab completion
#unalias git

source $(brew --prefix nvm)/nvm.sh
export NVM_DIR=~/.nvm

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=/usr/local/opt/pyenv
#[[ -s "/Users/swenson/.gvm/scripts/gvm" ]] && source "/Users/swenson/.gvm/scripts/gvm"

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

if [ -e $HOME/.zsh_local ]; then
  source ~/.zsh_local
fi
