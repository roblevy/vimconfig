-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"
-- vim.opt.cindent = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.g["asterisk#keeppos"] = 1 -- Cursor jumps to same place within word-
vim.o.laststatus = 2 -- always show statusline
vim.opt.textwidth = 0
vim.opt.formatoptions:remove("t") -- prevent normal text from wrapping
vim.opt.splitbelow = false
vim.o.splitkeep = "cursor"
vim.opt.relativenumber = false

-- augment AI
vim.g.augment_workspace_folders = { "/Users/rob.levy/dev/atlas-api/" }

-- Reduce the need to type key combinations quickly:
vim.o.timeoutlen = 1000
