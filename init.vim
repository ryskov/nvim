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
"    Plug 'romgrk/barbar.nvim'
"    Plug 'dstein64/vim-startuptime'
    Plug 'lewis6991/impatient.nvim'
    Plug 'sindrets/diffview.nvim'
    Plug 'michaeldyrynda/carbon'

    " debug
    Plug 'mfussenegger/nvim-dap'
    Plug 'theHamsta/nvim-dap-virtual-text'
call plug#end()

lua require('impatient')

" basic settings
syntax on
set completeopt=menu,menuone,preview
set number
set relativenumber
set clipboard=unnamedplus
set noea
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
                                                                                                                                                                                                                        
lua << EOF
local get_ls = function () return vim.tbl_filter(function(buf)
  return vim.api.nvim_buf_is_valid(buf)
         and vim.api.nvim_buf_get_option(buf, 'buflisted')
end, vim.api.nvim_list_bufs()) end

local dap = require("dap")
dap.defaults.fallback.terminal_win_cmd = '15split new'
-- dap.defaults.fallback.focus_terminal = true
dap.defaults.fallback.force_external_terminal = true
vim.fn.sign_define('DapBreakpoint', { text='', texthl = 'DiagnosticError' })
vim.fn.sign_define('DapStopped', { text='', texthl = 'DiagnosticWarn' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl = 'DiagnosticError' })
vim.fn.sign_define('DapLogPoint', { text='', texthl = 'DiagnosticWarn' })
local widgets = require'dap.ui.widgets'                                                                                                                               
local scope_widget = widgets.sidebar(widgets.scopes, nil, "90vsplit new")

local get_dap_term_buf = function () 
    local active_bufs = vim.tbl_filter(function(buf) return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, 'buflisted') end, vim.api.nvim_list_bufs())
    for _, buf in ipairs(active_bufs) do 
        if vim.api.nvim_buf_get_option(buf, 'buftype') == "terminal" and vim.api.nvim_buf_get_name(buf):find('[dap-terminal]') then 
            return buf 
        end
    end
    return nil
end

dap.listeners.after['event_initialized']['me'] = function(session, body)
    local dap_term_buf = get_dap_term_buf()
    if dap_term_buf ~= nil then 
        vim.api.nvim_buf_call(dap_term_buf, function () vim.cmd("norm G") end)
    end
end

dap.listeners.before['event_stopped']['me'] = function(session, body)
    scope_widget.open() 
end
dap.listeners.before['event_terminated']['me'] = function(session, body)
   scope_widget.close() 
end
EOF
