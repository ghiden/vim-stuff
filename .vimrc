call plug#begin('~/.vim/plugged')

Plug 'kchmck/vim-coffee-script'
Plug 'skwp/vim-rspec'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'Shougo/unite.vim'
Plug 'derekwyatt/vim-scala'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'triglav/vim-visual-increment'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'mxw/vim-jsx'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'othree/yajs.vim'
Plug 'elzr/vim-json'
Plug 'ekalinin/Dockerfile.vim'
Plug 'rking/ag.vim'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-vinegar'
Plug 'cespare/vim-toml'

Plug '~/vim-stuff/plugin/bclose'

call plug#end()

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
"set list
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
  "autocmd!

  " enable file type detection
  filetype on

  " languages
  au FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  au FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  au FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
  au FileType python setlocal ts=4 sts=4 sw=4 expandtab
  au FileType php setlocal ts=4 sts=4 sw=4 expandtab

   " HTML-like
  au FileType xhtml setlocal ts=2 sts=2 sw=2 expandtab
  au FileType html setlocal ts=2 sts=2 sw=2 expandtab
  au FileType eco setlocal ts=2 sts=2 sw=2 expandtab
  
  " CSS-like
  au FileType css setlocal ts=2 sts=2 sw=2 expandtab

  " JavaScript-like
  au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  au FileType coffee setlocal ts=2 sts=2 sw=2 expandtab
  au FileType json setlocal ts=2 sts=2 sw=2 expandtab
  " take es6 as js file
  au BufNewFile,BufRead *.es6 set filetype=javascript
  " take ejs file as html
  au BufNewFile,BufRead *.ejs set filetype=html

  " etc
  au FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
  au FileType java setlocal ts=8 sts=8 sw=8 expandtab

  " Consider .tpl file as smarty template file 
  au BufNewFile,BufRead *.tpl set filetype=smarty 

  " Consider .eco file as erb template file 
  " au BufNewFile,BufRead *.eco set filetype=eruby

  " Markdown: enable word wrap
  au BufNewFile,BufRead *.md set wrap linebreak

  " automatically reload .vimrc after saving .vimrc
  au BufWritePost .vimrc source $MYVIMRC
endif

let mapleader = ","

" paste mode toggle
set pastetoggle=<F2>

" Custom command
command! -nargs=* Wrap set wrap linebreak nolist

" zencoding config
let g:user_zen_settings = {'indentation':'  '}

" unite
let g:unite_enable_start_insert=0
" List buffers
noremap <C-U><C-B> :Unite buffer<CR>
" List files
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" List recently used files
noremap <C-U><C-R> :Unite file_mru<CR>
" List registers
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" List file and buffer
noremap <C-U><C-U> :Unite buffer file<CR>
" List all
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" exit from Unite 
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Experimenting Ctrl-J twice for ESC
inoremap <C-j><C-j> <Esc>
noremap <C-j><C-j> :nohlsearch<CR> 

set runtimepath^=~/vim-stuff/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'find %s -name "*\.swp" -prune -o -name "node_modules" -prune -o -name "\.git" -prune -o -name "\.tmp" -prune -o -name "\.sass-cache" -prune -o -type f'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" preview in marked
nnoremap <C-m>md :silent !open -a Marked.app '%:p'<CR> 

" ctags
set tags+=.tags

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" rainbow paren
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 15
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Unite Grep
nnoremap <silent> ,gt :<C-u>Unite grep: -buffer-name=search-buffer<CR>
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r :<C-u>UniteResume search-buffer<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 1000
  let g:unite_source_grep_encoding = 'utf-8'
endif

" highlight the 80th, 100th, 120th columns
:set colorcolumn=80,100,120

" treat ambiguous double char width properly
:set ambiwidth=double

" Omni completion
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

" Go
au FileType go nmap <Leader>ds <Plug>(go-def-split)
