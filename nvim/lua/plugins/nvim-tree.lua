-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,    
    width = 80,
    -- centralize_selection = true,
    -- preserve_window_proportions = false,
  },
  -- actions = {
  --     open_file = {
  --       resize_window = true,
  --     },
  -- },
  renderer = {
    highlight_opened_files = "all",
    root_folder_label = false,
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        none = "  ",
      },
    },
    icons = {
        webdev_colors = true,
        show = {
          file = true,
          folder = false,
          folder_arrow = true,
          git = true
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
          -- arrow_closed = "",
          -- arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "", -- 
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,        
    },
diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
  }  
})


vim.cmd[[
    hi NvimTreeNormal guibg=#22222B
    hi Directory guifg=#FFF ctermfg=white
    
]]

require("nvim-web-devicons").set_icon {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  }

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})
