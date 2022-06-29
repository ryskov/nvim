require("lsp")
require("treesitter")
require("nvim-tree").setup({ view = { adaptive_size = true }, respect_buf_cwd = true, update_cwd = true,
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
vim.g.vscode_transparent = 1
vim.g.vscode_disable_nvimtree_bg = true
vim.cmd([[colorscheme vscode]])