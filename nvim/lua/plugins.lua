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
  use { 'RRethy/vim-illuminate' }
  use { 'm-demare/hlargs.nvim' }

  -- Autocomplete
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'rafamadriz/friendly-snippets', config= lua_path"friendly-snippets" }
  use { 'windwp/nvim-autopairs', config = lua_path"nvim-autopairs" }
  use { 'windwp/nvim-ts-autotag', config = lua_path"vim-closetag"}
  use {'ray-x/lsp_signature.nvim'}
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }

  use {"jay-babu/mason-null-ls.nvim", config="mason" }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"treesitter" }
  use { 'Yggdroot/indentLine', config = lua_path"indentLine" }
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }
  use { 'HiPhish/rainbow-delimiters.nvim' }
  use { 'RRethy/nvim-treesitter-endwise', config = lua_path"nvim-treesitter-endwise" }

  -- Syntax
  use { 'chrisbra/csv.vim' }
  use { 'junegunn/vim-easy-align' }
  use { 'vim-autoformat/vim-autoformat', config = lua_path"autoformat" }
  use { 'mhartington/formatter.nvim', config = lua_path"formatter-nvim" }

  -- Icons
  use { 'ryanoasis/vim-webdevicons', config = lua_path"web-devicons" }
  use { 'ryanoasis/vim-devicons' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- Vim Airline
  use { 'vim-airline/vim-airline', config = lua_path"vim-airline" }
  use { 'vim-airline/vim-airline-themes' }

  -- Explorer
  use { "nvim-neo-tree/neo-tree.nvim",
        requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        },
        config = lua_path"neotree"
}

  -- Multicursors
  use { 'mg979/vim-visual-multi'}

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
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-sleuth' }
  use { 'tpope/vim-bundler' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-dadbod' }
  use { 'tpope/vim-jdaddy' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-commentary' }
  -- use {'codota/tabnine-nvim', run = "./dl_binaries.sh", config=lua_path"cmp-tabnine"}
  -- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp', config=lua_path"cmp-tabnine"}
  use { "zbirenbaum/copilot.lua", config=lua_path"cmp-tabnine" }
  use {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function ()
    require("copilot_cmp").setup()
  end
}

  -- Tmux
  use { 'christoomey/vim-tmux-navigator' }

  -- Colorschema
  -- use { 'Mofiqul/dracula.nvim', as = 'dracula',config=lua_path"colorschema"  }
  -- use { 'shaunsingh/nord.nvim', as = 'nord',config=lua_path"colorschema"  }
  -- use { "catppuccin/nvim", as = "catppuccin",config=lua_path"colorschema" }
  -- use { 'tomasiser/vim-code-dark',config=lua_path"colorschema"  }
  use { 'Mofiqul/vscode.nvim',config=lua_path"colorschema"  }
  use { 'folke/tokyonight.nvim',config=lua_path"colorschema"  }
  -- use { "patstockwell/vim-monokai-tasty", as = "molokai" }
  -- use { "tiagovla/tokyodark.nvim", as = "tokyodark" }
  -- use { "EdenEast/nightfox.nvim", as = "nightfox",config=lua_path"colorschema"  }
  -- use { "Shatur/neovim-ayu", as = "ayu",config=lua_path"colorschema"  }
  -- use { "Everblush/everblush.vim",config=lua_path"colorschema"  }

  -- Telescope
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim', config = lua_path"telescope"}
  use {
  'VonHeikemen/fine-cmdline.nvim',
  requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }
  use { 'ahmedkhalf/project.nvim' }

  -- General Plugins
  use { 'echasnovski/mini.bufremove'}
  use {'jose-elias-alvarez/null-ls.nvim'}
  use {'MunifTanjim/prettier.nvim', config = lua_path"prettier"}
  use { 'Bekaboo/dropbar.nvim'}
  use { 'folke/edgy.nvim', config = lua_path"edgy" }
  -- use { 'rcarriga/nvim-notify', config = lua_path"nvim-notify" }
  use {"akinsho/toggleterm.nvim", tag = '*', config = lua_path"toggleterm" }
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons', config=lua_path"bufferline"}
  use {'kevinhwang91/nvim-ufo', 
    requires = {
      'kevinhwang91/promise-async',
      'luukvbaal/statuscol.nvim'
    }, 
    config=lua_path"ufo"
  }
  use{ 'anuvyklack/pretty-fold.nvim' }
end)
