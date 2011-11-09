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
if has("win32")
  set backupdir=$HOME\Backups,.
else
  set backupdir=/tmp,.
end

"------------- Filetype and syntax ----------------
set fileformats=unix,dos
filetype on
syntax on

if has("autocmd")
  filetype indent plugin on
end

"------------- File encodings ---------------------
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8

"---------- Basic outlook -------------------------
set number
set wildmenu

if has("gui_running")
  set guioptions-=T " Remove toolbar
  set guioptions+=a " Copy selection to clipboard
  set lines=30
  set columns=120
  set background=light

  if has("win32")
    set guifont=Lucida\ Console,Courier\ New
  endif
else
  set background=dark
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

"-------- Window switching and ordering ----------
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"---------- Cool invisible character toggle ------
nmap <leader>l :set list!<CR>
set listchars=eol:$

"---------- Autosource .vimrc --------------------
if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC
endif


"========== Configure plugins =====================

"---------- NerdTree ------------------------------
map <F2> <Esc>:NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>
