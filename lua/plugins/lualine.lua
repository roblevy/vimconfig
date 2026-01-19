return {
  "nvim-lualine/lualine.nvim",
  opts = {
    globalstatus = false,
    inactive_sections = {
      lualine_a = { "diff" },
      lualine_b = {},
      lualine_c = { { "filename", show_filename_only = false } },
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
          color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
