return {
  "ibhagwan/fzf-lua",
  opts = {
    grep = {
      multiline = 1,
    },
  },
  keys = {
    {
      "<a-f>",
      function()
        require("fzf-lua").grep_project()
      end,
      desc = "Fuzzy search the whole project",
    },
    -- Remove LazyVim's default <leader>sa mapping
    { "<leader>sa", false },
    { "<leader>sa", false, group = "+search anywhere" },
    {
      "<leader>sac",
      function()
        require("fzf-lua").grep({
          search = "^ *class ",
          prompt = "Class definitions> ",
          no_esc = true,
        })
      end,
      desc = "[s]earch [a]nywhere [c]lass",
    },
    {
      "<leader>sad",
      function()
        require("fzf-lua").grep({
          search = "^ *def ",
          prompt = "Function definitions> ",
          no_esc = true,
        })
      end,
      desc = "[s]earch [a]nywhere [d]ef",
    },
    {
      "<leader>shc",
      function()
        require("fzf-lua").grep_curbuf({
          search = "^ *class ",
          prompt = "Class definitions> ",
          no_esc = true,
        })
      end,
      desc = "[s]earch [h]ere [c]lass",
    },
    {
      "<leader>shd",
      function()
        require("fzf-lua").grep_curbuf({
          search = "^ *def ",
          prompt = "Function definitions> ",
          no_esc = true,
        })
      end,
      desc = "[s]earch [h]ere [d]ef",
    },
    {
      "<leader>shb",
      function()
        require("fzf-lua").grep_curbuf({
          search = "^ *breakpoint()",
          no_esc = true,
        })
      end,
      desc = "[s]earch [h]ere [b]reakpoint",
    },
    {
      "<leader>sab",
      function()
        require("fzf-lua").grep({
          search = "^ *breakpoint()",
          no_esc = true,
        })
      end,
      desc = "[s]earch [a]nywhere [b]reakpoint",
    },
    {
      "<leader>shtd",
      function()
        local word = vim.fn.expand("<cword>")
        require("fzf-lua").grep_curbuf({
          search = "^ *def " .. word .. "\\(",
          no_esc = true,
        })
      end,
    },
  },
}
