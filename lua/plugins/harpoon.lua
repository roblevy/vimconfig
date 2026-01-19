return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    { "<leader>h", nil },
    { "<leader>H", nil },
    {
      "<leader>hc",
      function()
        local harpoon = require("harpoon")
        harpoon:list():clear()
        print("Harpoon list cleared.")
      end,
      desc = "Clear Harpoon list",
    },
    {
      "<leader>hm",
      function()
        local harpoon = require("harpoon")
        harpoon:list():add()
        print("Marked with Harpoon.")
      end,
      desc = "Harpoon location ([m]ark)",
    },
  },
  config = function()
    local fzf = require("fzf-lua")
    local harpoon = require("harpoon")

    local function harpoon_fzf()
      local entries = {}
      for _, item in ipairs(harpoon:list().items) do
        -- Add filename + row info
        local row = (item.context and item.context.row) or 5
        table.insert(entries, string.format("%s:%d", item.value, row))
      end

      fzf.fzf_exec(entries, {
        prompt = "Harpoon> ",
        previewer = "builtin", -- keep default previewer
        actions = {
          ["default"] = function(selected)
            local filename, row = selected[1]:match("^(.-):(%d+)$")
            vim.cmd(string.format("edit +%s %s", row, filename))
          end,
        },
      })
    end

    vim.keymap.set("n", "<leader>hh", harpoon_fzf, { desc = "Harpoon fzf" })
  end,
}
