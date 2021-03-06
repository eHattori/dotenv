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
vim.opt.cmdheight = 2
vim.opt.conceallevel = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.tw = 90
vim.opt.emoji = true
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.undodir = "/tmp"
-- vim.opt.foldlevel = 1
-- vim.opt.foldmethod = 'indent'
-- vim.opt.foldmethod = 'syntax'
vim.opt.inccommand = 'nosplit'
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
vim.opt.cursorline = true

vim.cmd('syntax enable')
vim.cmd('syntax on')
vim.cmd('set t_Co=256')
vim.cmd('colorscheme codedark')
vim.cmd('set background=light')
vim.cmd([[
    set foldmethod=indent   
    set nofoldenable
    set foldlevel=0
    nnoremap <Space> zA
]])

