require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer" },
}

local on_attach = (function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local config = {
    virtual_text = false, -- disable virtual text
    signs = {
        active = signs,   -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

local nvim_lsp = require("lspconfig")

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
nvim_lsp.denols.setup({
    on_attach = on_attach,
})
-- Prevent tsserver from attaching to deno projects
-- lspconfig.tsserver.setup({
--     root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
--     single_file_support = true,
--     on_attach = on_attach,
-- })

nvim_lsp.lua_ls.setup {
    on_attach = on_attach
}
nvim_lsp.bashls.setup {
    on_attach = on_attach
}
-- nvim_lsp.htmx.setup {
--     on_attach = on_attach
-- }
nvim_lsp.pyright.setup {
    on_attach = on_attach
}
nvim_lsp.vhdl_ls.setup {
    on_attach = on_attach
}
nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach
}
nvim_lsp.gopls.setup {
    on_attach = on_attach
}
nvim_lsp.bashls.setup {
    on_attach = on_attach
}
nvim_lsp.nil_ls.setup {
    on_attach = on_attach
}

