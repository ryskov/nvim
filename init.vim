" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer', { 'branch': 'main' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'ahmedkhalf/project.nvim'
    Plug 'mfussenegger/nvim-jdtls'
    Plug 'ggandor/leap.nvim'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'Mofiqul/vscode.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'dstein64/vim-startuptime'
    Plug 'lewis6991/impatient.nvim'
call plug#end()

lua require('impatient')

" basic settings
syntax on
set completeopt=menu,menuone,preview
set number
set relativenumber
set ignorecase      " ignore case
set smartcase     " but don't ignore it, when search string contains uppercase letters
set nocompatible
set incsearch        " do incremental searching
set visualbell
set expandtab
set tabstop=4
set ruler
set smartindent
set shiftwidth=4
set hlsearch
set virtualedit=all
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent
set mouse=a  " mouse support
set splitbelow
set splitright

