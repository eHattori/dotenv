call plug#begin('~/.local/share/nvim/plugged')

" Visual 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-webdevicons'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'

" File manager 
Plug 'preservim/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'


" Utils 
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'chriskempson/base16-vim'
Plug 'APZelos/blamer.nvim'
Plug 'mhinz/vim-signify'
Plug 'RRethy/vim-illuminate'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'

 " Language server
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'

 " For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'onsails/lspkind-nvim'

 " Elixir
Plug 'elixir-editors/vim-elixir'

 call plug#end()
