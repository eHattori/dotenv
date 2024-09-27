require'nvim-treesitter.configs'.setup {
  auto_install = true,
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
    "tsx",
    "query",
    "yaml",
    },
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    use_languagetree = true,
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    matchup = {
      enable = true  
    },
  autotag = {
    enable = true,
    filetypes = {
      'html',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'tsx',
      'jsx',
      'css',
      'lua',
      'xml',
      'markdown',
      'python'
      }
    },
    indent = {
      enable = true,
    },
  }

require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

require('pretty-fold').setup()

local rainbow = require 'rainbow-delimiters'
-- https://github.com/HiPhish/rainbow-delimiters.nvim/issues/51
require('rainbow-delimiters.setup').setup {
  strategy = {
    -- Default Strategy
    [''] = rainbow.strategy['global'],
    html = rainbow.strategy['local'],  
  },
  query = {
    -- Default Query - Reasonable set of parenthesis and similar
    -- delimiters in most languages
    [''] = 'rainbow-delimiters',
    -- Matches `\begin` and `\end` instructions
    latex = 'rainbow-blocks',
    -- Matches keywords like `function` and `end` as well as
    -- parenthesis
    lua = 'rainbow-blocks',
    -- Includes React support
    javascript = 'rainbow-parens',
    tsx = 'rainbow-parens',
    -- javascript = 'rainbow-delimiters-react',
    --[[
                -- Only parenthesis without React tags
                javascript = 'rainbow-parens',
                -- Only typescript highlighting without React tags
                tsx = 'rainbow-parens',
                --]]
    -- Matches keywords like `begin` and `end` as well as
    -- parenthesis
    verilog = 'rainbow-blocks',
  },
  highlight = {
    -- 'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterViolet',
    'RainbowDelimiterBlue',
    -- 'RainbowDelimiterOrange',
    -- 'RainbowDelimiterGreen',
    -- 'RainbowDelimiterCyan',
  },
  blacklist = {
    'env',
    'cpp',
  },
  --[[
            whitelist = {
                'python',
                'javascript',
            },
            log = {
                file = '~/.local/state/lvim/rainbow-delimiters.log',
                level = vim.log.levels.DEBUG,
            },
            --]]
}
