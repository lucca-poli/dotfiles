vim.opt.termguicolors = true
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-d>", ":bdelete<CR>", opts)

bufferline.setup{
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        always_show_bufferline = false,
    },
}
