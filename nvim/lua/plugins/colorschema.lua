-- setup must be called before loading
vim.cmd('colorscheme dracula')
-- vim.cmd('colorscheme catppuccin-mocha')
-- vim.cmd('let g:vim_monokai_tasty_italic = 1')
-- vim.cmd('colorscheme vim-monokai-tasty')
-- vim.cmd('colorscheme tokyodark')
-- vim.cmd('colorscheme everblush')
-- vim.cmd.colorscheme "codedark"

vim.cmd('set t_Co=256')
vim.cmd('set t_ut=')
vim.o.background = 'dark'

-- local c = require('vscode.colors').get_colors()
-- require('vscode').setup({
--     -- Alternatively set style in setup
--     -- style = 'light'

--     -- Enable transparent background
--     transparent = true,

--     -- Enable italic comment
--     italic_comments = true,

--     -- Underline `@markup.link.*` variants
--     underline_links = true,

--     -- Disable nvim-tree background color
--     -- disable_nvimtree_bg = true,

--     -- Override colors (see ./lua/vscode/colors.lua)
--     -- color_overrides = {
--     --     vscLineNumber = '#A6A6A6',
--     -- },

--     -- Override highlight groups (see ./lua/vscode/theme.lua)
--     group_overrides = {
--         -- this supports the same val table as vim.api.nvim_set_hl
--         -- use colors from this colorscheme by requiring vscode.colors!
--         Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--     }
-- })
-- require('vscode').load()
