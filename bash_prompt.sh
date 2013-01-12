function parse_git_branch() {
  x=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
  if [[ "$x" == "" ]]; then
    echo ""
  else
    echo "$x "
  fi
}

export PROMPT_COMMAND='export OLD_STATUS=$?'
export PS1='\[\033[1;37m\][\[\033[1;31m\]\u\[\033[0;35m\]@\[\033[0;36m\]\h \[\033[1;32m\]\t\[\033[1;37m\]] \[\033[1;34m\]\W \[\033[1;31m\]`parse_git_branch`\[\033[1;32m\]`if [ $OLD_STATUS = 0 ]; then echo \:\); else echo \:\(; fi` \[\033[1;35m\]\$ \[\033[0m\]'

alias cd..='cd ..'
alias ls='ls -FG'

export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/texbin:$PATH
