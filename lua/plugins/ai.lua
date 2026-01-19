return {
  "augmentcode/augment.vim",
  enabled = true,
  keys = function()
    -- Define the toggle function once
    local function toggle_augment_completions()
      local current = vim.g.augment_disable_completions
      vim.g.augment_disable_completions = not current
      if vim.g.augment_disable_completions then
        print("Augment completions disabled")
      else
        print("Augment completions enabled")
      end
    end

    return {
      {
        "<leader>aa",
        toggle_augment_completions,
        desc = "Toggle Augment completions",
        mode = "n",
      },
      {
        "<C-#>",
        function()
          -- exit insert mode first, toggle, then re-enter insert mode
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), "n", false)
          toggle_augment_completions()
        end,
        desc = "Toggle Augment completions (insert mode)",
        mode = "i",
      },
    }
  end,
}
