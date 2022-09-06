vim.api.nvim_exec([[
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd BufRead,BufNewFile *.md setlocal spell
]], true)

local cmp = require'cmp'
local lspkind = require'lspkind'
local nvim_lsp = require'lspconfig'
local luasnip = require("luasnip")

-- require "lsp_signature".setup()
require('pretty-fold').setup()

local lspkind = require('lspkind')


local source_mapping = {
  buffer = "📼 BF",
  nvim_lsp = "🚀 LP", 
  treesitter = "🪄 TS",
  cmp_tabnine = "💡 TB",
  path = "🔧 PT",
  luasnip = "✨ SN",
  rg = "➕ RG",    
  calc = "➕ CL"
}

local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = "",
  Variable = '  ',
  Class = "ﴯ",
  Interface = "",
  Module = '  ',
  Property = "ﰠ",
  Unit = '  ',
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = "",
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

require("luasnip/loaders/from_vscode").load()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ 
      behavior = cmp.ConfirmBehavior.Replace
      -- select = true
    }),
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    -- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
      --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  -- formatting = {
    -- format = function(entry, vim_item)
    --   vim_item.kind = lspkind.presets.default[vim_item.kind]
    --   local menu = source_mapping[entry.source.name]
    --   if entry.source.name == 'cmp_tabnine' then
    --     if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
    --       menu = entry.completion_item.data.detail .. ' ' .. menu
    --     end
    --     vim_item.kind = ''
    --   end
    --   vim_item.menu = menu
    --   return vim_item
    -- end  },
formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local menu = source_mapping[entry.source.name]
      vim_item.kind = cmp_kinds[vim_item.kind]
      vim_item.menu = menu
      return vim_item
    end  },  
  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 5 },
    { name = 'cmp_tabnine', max_item_count = 5 },
    { name = 'treesitter', max_item_count = 5 },
    { name = 'luasnip', max_item_count = 5 },
    { name = 'buffer', max_item_count = 2 },
    -- { name = 'path', max_item_count = 1 },
    { name = 'calc', max_item_count = 1 },
    { name = 'tags', max_item_count = 1 },
    { name = 'rg', max_item_count = 1 },
  }),
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = true,
		signs = true,
	}
)

vim.cmd([[
      " gray
      highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
      " blue
      highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
      highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
      " light blue
      highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
      highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
      highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
      " pink
      highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
      highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
      " front
      highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
      highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
      highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

]])

