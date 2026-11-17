" plugins
source $HOME/dotfiles/vim/plugins.vim

colorscheme gruvbox
syntax on

set hidden
set cursorline
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4

set history=5000
set clipboard=unnamedplus
set number relativenumber
set encoding=utf-8
set mouse=a
set visualbell
set ruler
set wildmenu
set wildmode=longest,list,full
set autoindent
set wrap
set laststatus=2
set background=dark

au BufRead,BufNewFile *.rain set filetype=rain
au BufRead,BufNewFile *.svelte set filetype=html
au BufRead,BufNewFile *.svx set filetype=markdown



