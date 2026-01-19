return {

  "akinsho/bufferline.nvim",
  opts = {
    options = {
      numbers = "ordinal",
      diagnostics = false,
      custom_filter = function(buf_number, buf_numbers)
        if vim.fn.bufname(buf_number) ~= nil then
          return true
        end
      end,
    },
  },
  keys = {
    {
      "<a-1>",
      function()
        require("bufferline").go_to(1)
      end,
    },
    {
      "<a-2>",
      function()
        require("bufferline").go_to(2)
      end,
    },
    {
      "<a-3>",
      function()
        require("bufferline").go_to(3)
      end,
    },
    {
      "<a-4>",
      function()
        require("bufferline").go_to(4)
      end,
    },
    {
      "<a-5>",
      function()
        require("bufferline").go_to(5)
      end,
    },
    {
      "<a-6>",
      function()
        require("bufferline").go_to(6)
      end,
    },
    {
      "<a-7>",
      function()
        require("bufferline").go_to(7)
      end,
    },
    {
      "<a-8>",
      function()
        require("bufferline").go_to(8)
      end,
    },
    {
      "<a-9>",
      function()
        require("bufferline").go_to(9)
      end,
    },
    {
      "<a-0>",
      function()
        require("bufferline").go_to(10)
      end,
    },
  },
}
