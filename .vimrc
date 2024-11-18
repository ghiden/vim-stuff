call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'

" very simple file explorer, press "-" to start
Plug 'tpope/vim-vinegar'

" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" notational velocity alternative: start with :NV
Plug 'alok/notational-fzf-vim'

" language support
Plug 'leafgarland/typescript-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" only when you need lisp
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'guns/vim-sexp'
" Plug 'tpope/vim-sexp-mappings-for-regular-people'

call plug#end()

" do not open in vi-mode
set nocompatible

" input
set autoindent
set smartindent

" for better tab completion
set wildmenu
set wildmode=full:list

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
" FileName [FileType][FileEncoding:FileFormat][ReadOnly][Modified]   Col:Lin/Total
set statusline=%t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L

" file type
syntax on
filetype indent on
filetype plugin on

" default indentation: 2 spaces
set ts=2 sts=2 sw=2 expandtab

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

" autocmd
if has("autocmd") 
  " enable file type detection
  filetype on

  " automatically reload .vimrc after saving .vimrc when you change a lot
  " au BufWritePost .vimrc source $MYVIMRC

  " Update tmux title
  au BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%"))
endif

let mapleader = ","

" paste mode toggle
set pastetoggle=<F2>

" Custom command
" - Reload vimrc
command! -bang Reload source $MYVIMRC

" Experimenting Ctrl-J twice for ESC
inoremap jj <Esc>

" highlight the 80th, 100th, 120th columns
:set colorcolumn=80,100,120

" treat ambiguous double char width properly
:set ambiwidth=double

" nv
let g:nv_search_paths = ['~/MEGAsync/apps/nvalt']
let g:nv_main_directory = '~/MEGAsync/apps/nvalt'
let g:nv_default_extension = '.txt'
let g:nv_preview_direction = 'down'
let g:nv_create_note_window = 'e'

" fzf
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <Leader><C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" use system clipboard
if has("unnamedplus")
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

