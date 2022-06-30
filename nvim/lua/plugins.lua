-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  -- Autocomplete
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  -- use { 'hrsh7th/cmp-vsnip' }
  -- use { 'hrsh7th/vim-vsnip' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'quangnguyen30192/cmp-nvim-tags' }
  use { 'rafamadriz/friendly-snippets', config= lua_path"friendly-snippets" }
  use { 'windwp/nvim-autopairs', config = lua_path"nvim-autopairs" } 
  use { 'andymass/vim-matchup' }
  use {'ray-x/lsp_signature.nvim'}

  -- Treesitter
 use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"treesitter" }
 use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
 use { 'Yggdroot/indentLine', config = lua_path"indentLine" }
 use { 'SmiteshP/nvim-gps', config = lua_path"nvim-gps" }
 use { 'RRethy/nvim-treesitter-endwise', config = lua_path"nvim-treesitter-endwise" }

  -- Syntax
  use { 'chrisbra/csv.vim' }
  use { 'junegunn/vim-easy-align' }  
  use { 'mhartington/formatter.nvim', config = lua_path"formatter-nvim" }  

  -- Icons
  use { 'ryanoasis/vim-webdevicons', config = lua_path"web-devicons" }
  use { 'ryanoasis/vim-devicons' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- Vim Airline
  use { 'vim-airline/vim-airline', config = lua_path"vim-airline" }
  use { 'vim-airline/vim-airline-themes' }

   -- Telescope  
   use { 'nvim-lua/plenary.nvim' }
   use { 'nvim-telescope/telescope.nvim'}      
   use { 'pwntester/octo.nvim', config = lua_path"octo" }
   
   -- Explorer
   use { 'preservim/nerdtree', config = lua_path"nerdtree" }
   use { 'tiagofumo/vim-nerdtree-syntax-highlight'}      
   use { 'Xuyuanp/nerdtree-git-plugin'}      
   use { 'jistr/vim-nerdtree-tabs'}    
   
   -- Dashboard
   use { 'glepnir/dashboard-nvim', config = lua_path"dashboard-nvim" }

  -- Color
  use { 'crivotz/nvim-colorizer.lua', config = lua_path"colorizer" }
  use { 'folke/lsp-colors.nvim'}

  -- Git
  use { 'APZelos/blamer.nvim', config = lua_path"blamer" }  
  use { 'mhinz/vim-signify' }  
  

  -- Registers & clipboard
  use { 'dstein64/nvim-scrollview' }  
  use { 'fedepujol/move.nvim' }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Tim Pope docet
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-sleuth' }
  use { 'tpope/vim-bundler' }
  use { 'tpope/vim-capslock' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-dadbod' }
  use { 'tpope/vim-jdaddy' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-commentary' }
  use { 'vim-ruby/vim-ruby' }
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp', config=lua_path"cmp-tabnine"}

  -- Tmux
  use { 'christoomey/vim-tmux-navigator' }

  -- Folkes
   use { 'folke/trouble.nvim' }

  -- Colorschema
  use { 'arcticicestudio/nord-vim' }
  use { 'rafi/awesome-vim-colorschemes' }
  use { 'tomasiser/vim-code-dark'}

  -- Debugger
--  use { 'mfussenegger/nvim-dap', config = lua_path"nvim-dap" }
--  use { 'rcarriga/nvim-dap-ui', config = lua_path"nvim-dap-ui" }
--  use { 'theHamsta/nvim-dap-virtual-text', config = lua_path"nvim-dap-virtual-text" }

  -- General Plugins
  use { 'rcarriga/nvim-notify', config = lua_path"nvim-notify" }
  use { 'jeffkreeftmeijer/vim-numbertoggle' }
  use { 'lambdalisue/suda.vim' }
 use { 'numtostr/FTerm.nvim', config = lua_path"fterm" }
 use { 'wfxr/minimap.vim', config = lua_path"minimap" }
 use { 'anuvyklack/pretty-fold.nvim' }
end)
