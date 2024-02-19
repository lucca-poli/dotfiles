require('dapui').setup()

local dap = require "dap"
dap.configurations.lua = {
    {
        type = 'nlua',
        request = 'attach',
        name = "Attach to running Neovim instance",
    }
}

dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

vim.api.nvim_set_keymap('n', '<leader>db', [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dc', [[:lua require"dap".continue()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dl', [[:lua require"dap".step_over()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dj', [[:lua require"dap".step_into()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dk', [[:lua require"dap".step_out()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dh', [[:lua require"dap".step_back()<CR>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dt', [[:lua require"dapui".toggle()<CR>]], { noremap = true })
