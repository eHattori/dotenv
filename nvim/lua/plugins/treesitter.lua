require'nvim-treesitter.configs'.setup {
	ensured_installed = {
		"bash",
		"comment",
		"css",
		"gitignore",
		"dockerfile",
		"html",
		"javascript",
		"jsdoc",
		"jsonc",
		"lua",
		"markdown",
		"regex",
		"scss",
		"toml",
		"typescript",
		"vim",
		"jsx",
		"tsx",
		"query",
		"yaml",
    },
    highlight = {
      enable = false,              -- false will disable the whole extension
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
    indent = {
      enable = true,
      disable = {},
    },
    rainbow = {
      enable = true,
      -- list of languages you want to disable the plugin for
      disable = {'bash'}, -- 'tsx', 'jsx', 'cpp', 'lua', 'bicep' },
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
