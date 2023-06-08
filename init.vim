set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set clipboard=unnamed

lua require('plugins')

if exists('g:vscode')
  echo "in vscode"
else
  echo "ordinary neovim"
endif

call plug#begin()

" easymotion
if exists('g:vscode')
  " use VSCode easymotion when in VSCode mode
  Plug 'asvetliakov/vim-easymotion', { 'as': 'vsc-easymotion' }
else
  " use normal easymotion when in VIM mode
  Plug 'easymotion/vim-easymotion'
endif

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

" for neovim
Plug 'numToStr/Comment.nvim'

call plug#end()

lua require('Comment').setup()

let mapleader = ","

" esc alternatives
" CTRL-J CTRL-J
inoremap jj <Esc>

" hit esc twice to unhighlight
noremap <Esc><Esc> :nohlsearch<CR>

" cursor line
set cursorline
"gui
highlight CursorLine guibg=lightblue
"terminal
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" highlight the 80th, 100th, 120th columns
:set colorcolumn=80,100,120

" Update tmux title
au BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%"))

" status line
set showcmd
set laststatus=2
" FileName [FileType][FileEncoding:FileFormat][ReadOnly][Modified]   Col:Lin/Total
set statusline=%t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L

" nv
let g:nv_search_paths = ['~/MEGAsync/apps/nvalt']
let g:nv_main_directory = '~/MEGAsync/apps/nvalt'
let g:nv_default_extension = '.txt'
let g:nv_preview_direction = 'down'
let g:nv_create_note_window = 'e'

" fzf
nnoremap <silent> <Leader><C-p> :Files<CR>
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>

