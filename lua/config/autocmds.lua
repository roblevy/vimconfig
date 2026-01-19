-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    -- Disable autoformatting on save for YAML
    vim.b.autoformat = false
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function(args)
--     -- Force Neovim to (re)load its built-in ftplugin
--     vim.cmd("setlocal ft=python")
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "100"
  end,
})
-- Increase colorcolun (i.e. marker for line length) for SQL files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.opt_local.colorcolumn = "120"
  end,
})
