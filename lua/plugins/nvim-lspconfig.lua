return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = { virtual_text = false },
    servers = {
      pyright = {
        keys = { { "[[", false }, { "]]", false } },
        settings = {
          python = {
            analysis = {
              diagnosticMode = "workspace",
            },
          },
        },
        -- This works around what looks like a known bug in lspconfig
        -- which is targetted for fix on 25th December (!) 2025
        -- https://github.com/neovim/neovim/issues/32074
        on_attach = function(client, bufnr)
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          -- prevent attaching to fugitive:// or diff:// buffers
          if bufname:match("^fugitive://") or bufname:match("^diff://") then
            client.stop()
            return
          end
        end,
      },
      ruff = {
        on_attach = function(client, bufnr)
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          if bufname:match("^fugitive://") or bufname:match("^diff://") then
            client.stop()
            return
          end
        end,
        keys = {
          {
            "<leader>si",
            "<cmd>!ruff check --select F401 --select I --fix %<cr>",
            desc = "[s]ort [i]mports",
            silent = true,
          },
        },
      },
    },
  },
}
