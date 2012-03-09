set nobackup
set smarttab
set hidden
set title
inoremap # X<c-h>#
set sm
set ignorecase
set smartcase
set incsearch
set nocompatible
set autoindent
set smartindent
syntax on
filetype plugin indent on

" default indentation: 4 spaces
set ts=4 sts=4 sw=4 expandtab

if has("autocmd")
  " Enable file type detection
  filetype on

  " Languages
  au FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  au FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  au FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
  au FileType php setlocal ts=4 sts=4 sw=4 expandtab

  " HTML-like
  au FileType html setlocal ts=2 sts=2 sw=2 expandtab
  au FileType eco setlocal ts=2 sts=2 sw=2 expandtab
  
  " CSS-like
  au FileType css setlocal ts=2 sts=2 sw=2 expandtab

  " JavaScript-like
  au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  au FileType coffee setlocal ts=2 sts=2 sw=2 expandtab

  " etc
  au FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
  au FileType java setlocal ts=8 sts=8 sw=8 expandtab

  " Consider .tpl file as smarty template file 
  au BufNewFile,BufRead *.tpl set filetype=smarty 

  " Consider .eco file as erb template file 
  " au BufNewFile,BufRead *.eco set filetype=eruby 

  " automatically reload .vimrc after saving .vimrc
  au BufWritePost .vimrc source $MYVIMRC
endif

set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

let mapleader = ","

"show invisibles
nmap <leader>l :set list!<CR>

"moving between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Only enable this if you have pathogen
call pathogen#infect("~/src/vim/bundle")

"Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Invisible character colors
highlight NonText guifg=#4afa59
highlight SpecialKey guifg=#4afa59

" show invisible chars
set list
