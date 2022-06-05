set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Ignore files
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

set exrc
set guicursor=

" display relative number to current line and current line number
set relativenumber
set number

set nohlsearch
set hidden
set noerrorbells
set nowrap

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set scrolloff=8
set signcolumn=yes
set colorcolumn=120

" Plugins
call plug#begin('~/.vim/plugged')

" required for telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'

" Styling
Plug 'gruvbox-community/gruvbox'

Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Folder tree
Plug 'preservim/nerdtree'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "

" Telescope
nnoremap <leader>pf :lua require('telescope.builtin').find_files({ default_text = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ps :lua require('telescope.builtin').live_grep({ default_text = vim.fn.input("Grep For > ")})<CR>

" NERDTree
nmap <Leader>pt :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>
