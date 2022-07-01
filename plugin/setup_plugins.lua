require("lsp")
require("treesitter")
require("lspconfig").sumneko_lua.setup({ settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
require("nvim-tree").setup({ view = { adaptive_size = false, width = 60 }, respect_buf_cwd = true, update_cwd = true,
    update_focused_file = { enable = true, update_cwd = true }, diagnostics = { enable = true } })
require("toggleterm").setup()
require("project_nvim").setup()
require("telescope").setup({ extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown() } } })
require("telescope").load_extension("ui-select")
require("telescope").load_extension("projects")
require("completion")
require("lualine").setup({
    options = { theme = "vscode" }
})
require("leap").set_default_keymaps()
require("nvim-dap-virtual-text").setup()
vim.g.vscode_transparent = 1
vim.g.vscode_disable_nvimtree_bg = true

vim.cmd([[colorscheme carbon]])
