set nocompatible
let s:config_path = $HOME.'/.config/nvim/'

let s:config_files = [
      \'functions.vim',
      \'plugins.vim',
      \'mappings.vim'
      \]

for file in s:config_files
  if filereadable(s:config_path.file)
    exec "so ".s:config_path.file
  endif
endfor

" ---------- COMMON FLAGS -----------
set hidden                                                    " TextEdit might fail if hidden is not set.
set number
set incsearch
set hlsearch
set nowrap
set colorcolumn=120
set clipboard=unnamedplus
set cursorline
set ruler
set ttyfast
set laststatus=2
set maxmempattern=100000                                      " max mem to use

set title                                                     " tab title as file name
set noshowmode                                                " dont show current mode below statusline
set noshowcmd                                                 " to get rid of display of last command
set cmdheight=2                                               " give more space for displaying messages
set conceallevel=2                                            " set this so we wont break indentation plugin
set splitright                                                " open vertical split to the right
set splitbelow                                                " open horizontal split to the bottom
set tw=90                                                     " auto wrap lines that are longer than that
set emoji                                                     " enable emojis
set history=1000                                              " history limit
set undofile                                                  " enable persistent undo
set undodir=/tmp                                              " undo temp file directory
set foldlevel=99                                               " open all folds by default
set foldmethod=syntax                                         " config fold to syntax
set inccommand=nosplit                                        " visual feedback while substituting
set showtabline=2                                             " always show tabline
set smartcase                                                 " if searching text contains uppercase case will not be ignored
set encoding=UTF-8

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180

" required by coc
set nobackup                                                  " some servers have issues with backup files
set nowritebackup
set cmdheight=1
set updatetime=100                                            " delays and poor user experience.
set shortmess+=c                                              " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                                            " always show the signcolumn
" ------------ END COMMON FLAGS -----------

syntax enable
syntax on
colorscheme dracula
set t_Co=256
set shell=/bin/zsh
set termguicolors
set background=dark

set tabstop=2       " The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.

set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set cursorline

let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_shortcut={
      \ 'last_session'       : '',
      \ 'find_history'       : '',
      \ 'find_file'          : '',
      \ 'new_file'           : '',
      \ 'change_colorscheme' : '',
      \ 'find_word'          : '',
      \ 'book_marks'         : '',
      \ }

let g:dashboard_custom_header = [
    \'',
    \'   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
    \'    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
    \'          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
    \'           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
    \'          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
    \'   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
    \'  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
    \' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
    \' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
    \'      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
    \'       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
   \'',
    \]



set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'
local nvim_lsp = require('lspconfig')
local lspkind = require('lspkind')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}


cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format({with_text = true, maxwidth = 150, ({
      vsnip = '[VSnip]'
    })})
      },
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'buffer' }
    })
  })

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  'tsserver',
  'eslint',
  'yamlls',
  'tsserver',
  'jsonls',
  'bashls',
  'cssls',
  'pyright',
  'solargraph',
  'html',
  'dockerls',
  'erlangls',
  'angularls',
  }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
      flags = {
          debounce_text_changes = 150,
      },
      capabilities = capabilities,
    }
end
EOF
