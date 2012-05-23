" input
set autoindent
set smartindent
set nocompatible

" command
set wildmenu
set wildmode=full:list

" show matching parens
set sm

" search
set incsearch
set ignorecase			" ignore case
set smartcase			" if start with cap, search cap
set hlsearch			" highlight result
" hit esc twice to unhighlight
noremap <Esc><Esc> :nohlsearch<CR> 

" backup: none
set nobackup

" leave unsaved buffer
set hidden

" set title
set title

" highlight cursor line
if v:version >= 700
  set cursorline
  "gui
  highlight CursorLine guibg=lightblue
  "terminal
  highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
endif

" status line
set showcmd
set laststatus=2
set statusline=[%L]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L

" file type
syntax on
filetype indent on
filetype plugin on

" default indentation: 4 spaces
set ts=4 sts=4 sw=4 expandtab
set smarttab

" show invisible chars
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Invisible character colors
highlight NonText guifg=#4afa59
highlight SpecialKey guifg=#4afa59

" file encodings
set enc=utf-8
set termencoding=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformat=unix
set fileformats=unix,mac,dos

"Only enable this if you have pathogen
call pathogen#infect("~/src/vim-stuff/bundle")

" autocmd
if has("autocmd") 
  "autocmd!

  " enable file type detection
  filetype on

  " languages
  au FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  au FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  au FileType python setlocal ts=4 sts=4 sw=4 expandtab
  au FileType php setlocal ts=4 sts=4 sw=4 expandtab

   " HTML-like
  au FileType html setlocal ts=2 sts=2 sw=2 expandtab
  au FileType eco setlocal ts=2 sts=2 sw=2 expandtab
  
  " CSS-like
  au FileType css setlocal ts=2 sts=2 sw=2 expandtab

  " JavaScript-like
  au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  au FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
  au FileType json setlocal ts=2 sts=2 sw=2 expandtab

  " etc
  au FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
  au FileType java setlocal ts=8 sts=8 sw=8 expandtab

  " Consider .tpl file as smarty template file 
  au BufNewFile,BufRead *.tpl set filetype=smarty 

  " Consider .eco file as erb template file 
  " au BufNewFile,BufRead *.eco set filetype=eruby

  " Markdown: enable word wrap
  au BufNewFile,BufRead *.md set wrap linebreak nolist

  " automatically reload .vimrc after saving .vimrc
  au BufWritePost .vimrc source $MYVIMRC
endif

let mapleader = ","

" paste mode
noremap <leader>p :set paste<CR>
noremap <leader>np :set nopaste<CR>

" command-t stuff
" add ESC to cancel file listing
let g:CommandTCancelMap=['<Esc>', '<C-c>']

" Custom command
command! -nargs=* Wrap set wrap linebreak nolist

