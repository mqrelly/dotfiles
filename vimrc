"--------------------------------------------------
"---------- Activate pathogen from submodule ------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


set nocompatible

"---------- Backup-, swapfiles --------------------
set noswapfile
set backup
set backupdir=/tmp

"------------- Filetype and syntax --------------------
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
endif

colorscheme solarized

"---------- Searching -----------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <leader>ns :set nohlsearch<CR>

"---------- Indenting -----------------------------
set autoindent
set smartindent
set cindent

"---------- Tab stops, and expanding --------------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"------- Remap arrow keys to navigate buffers ----
noremap <Left> :bprevious!<CR>
noremap <Right> :bnext!<CR>
noremap <Up> <Nop>
noremap <Down> <Nop>


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
