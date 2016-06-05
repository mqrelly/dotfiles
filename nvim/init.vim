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
function! StripTrailingWhitespaces()
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
  set omnifunc=syntaxcomplete#Complete
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
  set guioptions-=m " Remove menu
  set guioptions-=e " Use char-based tab pages
  set guioptions+=c " Use console dialogs, when possible
  set guioptions+=a " Copy selection to clipboard
  set lines=30
  set columns=120

  if has("win32")
    set guifont=Lucida_Console:h10,Ubuntu_Mono:h10,Inconsolata:h11,Courier_New:h9
  else
    set guifont=UbuntuMono,Inconsolata,DejaVuSansMono
  endif
endif

set background=light
colorscheme solarized

"---------- Status bar ----------------------------
set laststatus=2  " always visible
set statusline=%f\ %y%m%=%l/%L\ (%p%%)\ %v

"---------- Searching -----------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <leader>hs :setlocal !hlsearch<CR>

"---------- Indenting -----------------------------
set autoindent
set smartindent
set nocindent " no C-indent for default

vnoremap > >gv
vnoremap < <gv
vnoremap = =gv

"---------- Tab stops, and expanding --------------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"---------- Default BACKSPACE behavior ------------
set backspace=indent,eol,start

"---------- Map Leader to Space -------------------
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"------- Remap arrow keys to navigate buffers -----
noremap <Left> :bprevious!<CR>
inoremap <Left> <Nop>
noremap <Right> :bnext!<CR>
inoremap <Right> <Nop>
noremap <Up> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
inoremap <Down> <Nop>

noremap <C-Tab> gt
noremap <C-S-Tab> gT

set hidden " Allow switching from changed buffer to another.

"-------- Window switching and ordering -----------
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"---------- Cool invisible character toggle -------
nmap <leader>l :set list!<CR>
set listchars=eol:$

"---------- Insert Date and Time ------------------
nmap <F3> a<C-R>=strftime("%Y.%m.%d %H:%M")<CR><Esc>
nmap <C-F3> a<C-R>=strftime("%Y.%m.%d")<CR><Esc>
nmap <S-F3> a<C-R>=strftime("%H:%M")<CR><Esc>
imap <F3> <C-R>=strftime("%Y.%m.%d %H:%M")<CR><Esc>a
imap <C-F3> <C-R>=strftime("%Y.%m.%d")<CR><Esc>a
imap <S-F3> <C-R>=strftime("%H:%M")<CR><Esc>a


"========== Configure plugins =====================

"---------- Matchit -------------------------------
runtime matchit.vim

"---------- NerdTree ------------------------------
map <F2> <Esc>:NERDTreeToggle<CR>
imap <F2> <Esc>:NERDTreeToggle<CR>

"---------- TabBar --------------------------------
nmap <F8> :TagbarToggle<CR>
imap <F8> <Esc>:TagbarToggle<CR>


"========== Language specific options =============

let g:clojure_fuzzy_indent = 1
let g:clojure_align_multiline_strings = 1
