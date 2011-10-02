"--------------------------------------------------
"---------- Activate pathogen from submodule ------
runtime bundle/vim-pathogen/autoload/pathogen.vim


"---------- Backup-, swapfiles --------------------
set nobackup
set writebackup
set noswapfile

"--------- Filetype and syntax --------------------
filetype on
syntax on
colorscheme solarized

"---------- Basinc outlook ------------------------
set number
set wildmenu

"---------- Searching -----------------------------
set hlsearch
set incsearch

"---------- Indenting -----------------------------
set autoindent
set smartindent
set cindent

"---------- Tab stops, and expanding --------------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"---------- Cool invisible character toggle ------
"nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:$

"---------- Autosource .vimrc --------------------
if has("autocmd")
    autocmd BufWritePost .vimrc source $MYVIMRC
endif
