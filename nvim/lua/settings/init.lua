-- Global
vim.opt.hidden = true
vim.opt.number = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.colorcolumn = "120"
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.ttyfast = true
vim.opt.laststatus = 3

vim.opt.title = true
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.conceallevel = 2
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true
vim.opt.tw = 90
vim.opt.emoji = true
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.undodir = "/tmp"
-- vim.opt.foldlevel = 1
-- vim.opt.foldmethod = 'indent'
-- vim.opt.foldmethod = 'syntax'
-- vim.opt.inccommand = 'nosplit'
vim.opt.splitkeep = "screen"
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.encoding = 'UTF-8'

vim.opt.lazyredraw = true
vim.opt.cursorcolumn = false
vim.opt.scrolljump = 5
vim.opt.synmaxcol = 180

vim.opt.signcolumn = 'yes'
vim.opt.shortmess:append { c = true, S = true }
vim.opt.shell = '/bin/zsh'
vim.opt.termguicolors = true
vim.opt.background = 'light'

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
-- vim.opt.noexpandtab = true
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.cmd('syntax enable')
vim.cmd('syntax on')

vim.cmd([[
    highlight Cursor guifg=black guibg=white
    highlight iCursor guifg=white guibg=steelblue
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
    set clipboard+=unnamedplus
    set foldmethod=syntax
    set nofoldenable
    set nowrap
]])
vim.loader.enable()
