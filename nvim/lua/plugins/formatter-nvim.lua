local util = require "formatter.util"

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
      -- prettierd
      function()
        return {
          exe = "prettierd",
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    ruby = {
      exe = "rubocop",
      args = {
        "--fix-layout",
        "--stdin",
        util.escape_path(util.get_current_buffer_file_name()),
        "--format",
        "files",
      },
      stdin = true,
      transform = function(text)
        table.remove(text, 1)
        table.remove(text, 1)
        return text
      end,
    }
    -- other formatters ...
  }
})
