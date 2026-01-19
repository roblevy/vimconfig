return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = { "pgformatter" },
      pgsql = { "pgformatter" },
      xml = { "xmlformatter" },
    },
    formatters = {
      pgformatter = {
        command = "pg_format",
        stdin = true,
        cwd = function()
          return vim.fn.getcwd()
        end,
      },
      sqlfluff = {
        command = "sqlfluff",
        args = { "format", "--dialect=postgres", "-" },
        stdin = true,
        cwd = function()
          return vim.fn.getcwd()
        end,
      },
    },
    default_format_opts = {
      timeout_ms = 10000,
    },
  },
}
