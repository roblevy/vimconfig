return {
  {
    "haya14busa/vim-asterisk",
    lazy = false,
    keys = {
      { "*", "<Plug>(asterisk-z*)" },
      { "#", "<Plug>(asterisk-z#)" },
      { "g*", "<Plug>(asterisk-gz*)" },
      { "g#", "<Plug>(asterisk-gz#)" },
    },
  },
  -- {
  --   "vim-scripts/indentpython.vim",
  --   lazy = false,
  -- },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- I've disabled tagbar because it's too slow on large files and runs
  -- synchronously so it kills my whole vim
  -- {
  --   "preservim/tagbar",
  --   keys = {
  --     { "<A-o>", "<cmd>TagbarToggle<cr>", desc = "Toggle Tagbar" },
  --   },
  --   init = function()
  --     -- Set Tagbar options before the plugin loads
  --     vim.g.tagbar_autoclose = 1
  --     vim.g.tagbar_show_data_type = 0
  --     vim.g.tagbar_show_visibility = 0
  --     vim.g.tagbar_show_suffix = 0
  --     vim.g.tagbar_silent = 1
  --   end,
  -- },
}
