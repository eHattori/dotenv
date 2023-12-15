require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    matchup = {
      enable = true  
    },
    autotag = {
     enable = true,
    },
    rainbow = {
      enable = true,
      -- list of languages you want to disable the plugin for
      -- disable = { 'tsx', 'jsx', 'cpp' },
      -- Which query to use for finding delimiters
      query = 'rainbow-parens',
      -- Highlight the entire buffer all at once
      strategy = require('ts-rainbow').strategy.global,
            hlgroups = {
               -- 'TSRainbowRed',
               'TSRainbowYellow',
               'TSRainbowCyan',
               'TSRainbowViolet',
               'TSRainbowBlue',
               -- 'TSRainbowOrange',
               'TSRainbowGreen'
            },
    }
  }
