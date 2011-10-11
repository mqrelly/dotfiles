set nocompatible

"---------- Activate pathogen from submodule ------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


"========== Custom functions ======================

"---------- Preserve cursor pos and state --------
" http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Save last search, and cursor pos.
  let _s = @/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Restore prev search and cursor pos.
  let @/ = _s
  call cursor(l,c)
endfunction

"---------- StripTrailingWhitespaces --------------
function StripTrailingWhitespaces()
  call Preserve("%s/\\s\\+$//e")
endfunction

nmap <leader>$ :call StripTrailingWhitespaces()<CR>


"========== Basic behavior and looks ==============

"---------- Backup-, swapfiles --------------------
set noswapfile
set backup
set backupdir=/tmp,.

"------------- Filetype and syntax --------------------
set fileformats=unix,dos
filetype on
syntax on

"---------- Basic outlook -------------------------
set number
set wildmenu

if has("gui_running")
  set guioptions-=T " Remove toolbar
  set guioptions+=a " Copy selection to clipboard
  set lines=30
  set columns=120
  set background=light
endif

colorscheme solarized

"---------- Searching -----------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <leader>hs :setlocal !hlsearch<CR>

"---------- Indenting -----------------------------
set autoindent
set smartindent
set cindent

vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

"---------- Tab stops, and expanding --------------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"------- Remap arrow keys to navigate buffers ----
noremap <Left> :bprevious!<CR>
inoremap <Left> <Nop>
noremap <Right> :bnext!<CR>
inoremap <Right> <Nop>
noremap <Up> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Down> <Nop>


"---------- Cool invisible character toggle ------
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:$

"---------- Autosource .vimrc --------------------
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
endif


"========== Configure plugins =====================

"---------- NerdTree ------------------------------
nmap <F2> :NERDTreeToggle<CR>
