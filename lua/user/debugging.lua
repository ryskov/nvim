local dap = require("dap")
-- Terminal
dap.defaults.fallback.terminal_win_cmd = '15split new'
dap.defaults.fallback.force_external_terminal = true

-- Signs
vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticWarn' })
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticError' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticWarn' })

-- Widgets
local widgets = require 'dap.ui.widgets'
local scope_widget = widgets.sidebar(widgets.scopes, nil, "90vsplit new")

-- Util and event listeners
local get_dap_term_buf = function()
    local active_bufs = vim.tbl_filter(function(buf) return vim.api.nvim_buf_is_valid(buf) and
            vim.api.nvim_buf_get_option(buf, 'buflisted')
    end, vim.api.nvim_list_bufs())
    for _, buf in ipairs(active_bufs) do
        if vim.api.nvim_buf_get_option(buf, 'buftype') == "terminal" and
            vim.api.nvim_buf_get_name(buf):find('[dap-terminal]') then
            return buf
        end
    end
    return nil
end

dap.listeners.after['event_initialized']['me'] = function(_, _)
    local dap_term_buf = get_dap_term_buf()
    if dap_term_buf ~= nil then
        vim.api.nvim_buf_call(dap_term_buf, function() vim.cmd("norm G") end)
    end
end

dap.listeners.before['event_stopped']['me'] = function(_, _)
    scope_widget.open()
end
dap.listeners.before['event_terminated']['me'] = function(_, _)
    scope_widget.close()
end
