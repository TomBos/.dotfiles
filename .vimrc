" Basic settings
set nocompatible        " Disable Vi compatibility
set encoding=utf-8
syntax on               " Syntax highlighting

" UI
set number              " Show line numbers
set relativenumber      " Relative line numbers
set showmatch           " Highlight matching parentheses
set nowrap              " Disable line wrap by default
set scrolloff=5         " Keep 5 lines above/below cursor
set laststatus=2        " Always show status line

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Tabs and indent
set tabstop=4           " A tab character displays as 4 spaces wide
set shiftwidth=4        " Indent/outdent commands use 4 spaces width
set noexpandtab         " Use real tabs, not spaces
set autoindent
set smartindent

" Clipboard
if has('clipboard')
  set clipboard=unnamedplus
endif

" Undo persistence
set undofile
set undodir=~/.vim/undo
set viminfo=


" Key mappings
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

