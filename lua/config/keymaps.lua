-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<a-a>", "ggVG", { desc = "select [a]ll" })
map("n", "<a-s>", "<cmd>w<cr>", { desc = "[s]ave" })
map("n", "<a-q>", "<cmd>q<cr>", { desc = "[q]uit, maintaining window" })
map("n", "<a-w>", function(n)
  Snacks.bufdelete(n)
end, { desc = "[q]uit" })
map("n", "<leader>dt", "<cmd>diffthis<cr>", { desc = "[d]iff [t]his" })
map("n", "<leader>dg", "<cmd>diffget<cr>", { desc = "[d]iff [g]et" })
map("n", "<leader>dp", "<cmd>diffput<cr>", { desc = "[d]iff [p]ut" })
map("n", "<leader>bb", "Obreakpoint()<ESC>", { desc = "Insert breakpoint" })
map("n", "<a-d>", function()
  vim.diagnostic.open_float()
end, { desc = "Show diagnostic" })
map("n", "<BS>", "<cmd>nohl<cr>")

map("n", "y%", '<cmd>let @+=expand("%:p")<cr>', { desc = "Yank the current filepath" })

-- Some quickfix stuff
map("n", "<leader>qj", "<cmd>cnext<cr>", { desc = "[q]uickfix next" })
map("n", "<leader>qk", "<cmd>cprev<cr>", { desc = "[q]uickfix previous" })
map("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "[t]ab previous" })
map("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "[t]ab previous" })
map("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "[t]ab next" })
map("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "[t]ab next" })
