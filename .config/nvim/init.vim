if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:polyglot_disabled = ['sensible']
let g:python_highlight_all = 1
let g:cpp_experimental_strict_conformance = 1

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot' " Поддержка множества языков
Plug 'vim-airline/vim-airline' " Красивая строка состояния
Plug 'scrooloose/nerdtree' " Древо проекта
Plug 'Xuyuanp/nerdtree-git-plugin' " Поддержка Git в дереве проекта
Plug 'tpope/vim-fugitive' " Интерфейс Git в Vim
Plug 'preservim/nerdcommenter' " Комментирование кода
Plug 'majutsushi/tagbar' " Отображение тегов
Plug 'dense-analysis/ale' " Линтер
Plug 'itchyny/lightline.vim' " Улучшенная строка состояния
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
Plug 'vim-airline/vim-airline'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

" Aesthetics - Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zaki/zazen'
Plug 'yuttie/hydrangea-vim'

" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

call plug#end()

" Общие настройки
syntax enable
set nu
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set textwidth=0
set hidden
set number
set title

" Настройки для Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 'component_expand': {
      \   'filename': 'expand("%:t")',
      \ },
\ }

" Настройки для NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree

" Настройки для Tagbar
map <F8> :TagbarToggle<CR>

" Настройки для ALE
let g:ale_linters = {
      \ 'cpp': ['clang'],
      \ 'python': ['flake8'],
      \ }
let g:ale_cpp_clang_options = '-std=c++20'
let g:ale_python_flake8_options = '--ignore=E501'

" Настройки для комментирования кода
map <leader>c :NERDCommenterToggle<CR>

" Остальные настройки
set laststatus=2
set cursorline
set autochdir
set background=dark
colorscheme catppuccin

let g:codestats_api_key = 'SFMyNTY.ZG14NWJ3PT0jI01UWXlPVEU9.XF8IPBmQOgIt5yaZL3XcBUohOeuolQm_nHlqyhV0E9k'

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
