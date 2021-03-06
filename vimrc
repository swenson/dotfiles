set nocompatible

" Pathogen
"call pathogen#infect()
"call pathogen#helptags()
 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
syntax on
set anti
set autoindent
set backspace=indent,eol,start
set backupdir=./.backup,.,/tmp
set binary noeol
set directory=.,./.backup,/tmp
set expandtab
set gfn=Monaco:h13.00
set grepprg=grep\ -nH\ $*
set history=1000
set hlsearch
set ignorecase
set incsearch
set mouse=a
set mousehide
set nowrap
set number
set shiftwidth=2
set showmatch
set smarttab
set eol
set softtabstop=2
set tabstop=2
set vb
"colorscheme Wombat

let &titlestring = $USER . '@' . hostname() . ": vim " . expand("%:t")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

au BufEnter /private/tmp/crontab.* setl backupcopy=yes
