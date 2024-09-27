local cmp = require'cmp'
local compare = require('cmp.config.compare')
local lspkind = require'lspkind'
local nvim_lsp = require'lspconfig'
local luasnip = require("luasnip")


require("mason").setup()
require("mason-lspconfig").setup()
-- require "lsp_signature".setup()
-- require('pretty-fold').setup()
require("mason-null-ls").setup({
  ensure_installed = { "black" }
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
  },
})
local lspkind = require('lspkind')


local source_mapping = {
  buffer = "📼 BF",
  nvim_lsp = "🚀 LP",
  treesitter = "🪄 TS",
  cmp_tabnine = "💡 TB",
  copilot = "🙈 CP" ,
  path = "🔧 PT",
  luasnip = "✨ SN",
  rg = "➕ RG",
  calc = "➕ CL"
}

local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Copilot = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = " ",
  Variable = '  ',
  Class = "ﴯ  ",
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

require("luasnip.loaders.from_vscode").lazy_load({})
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end


local comparators = {}

comparators.score = function (entry1, entry2)
  if entry1.score and entry2.score then
    return entry1.score > entry2.score
  end
end

comparators.prioritize = function (entry1, entry2)
  if entry1.copilot and not entry2.copilot then
    return true
  elseif entry2.copilot and not entry1.copilot then
    return false
  end
end


-- return comparators
cmp.setup({
  sorting = {
    priority_weight = 2,
    comparators = {
      comparators.prioritize,
      -- require('cmp_tabnine.compare'),
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
    },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    -- ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
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
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
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
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local menu = source_mapping[entry.source.name]
      vim_item.kind = cmp_kinds[vim_item.kind]
      -- vim_item.kind = entry.source.name
      vim_item.menu = menu
      -- if entry.source.name == "cmp_tabnine" then
      --   local detail = (entry.completion_item.data or {}).detail
      --   vim_item.kind = ""
      --   if detail and detail:find('.*%%.*') then
      --     vim_item.kind = vim_item.kind .. ' ' .. detail
      --   end

      --   if (entry.completion_item.data or {}).multiline then
      --      vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
      --   end
      -- end

      local maxwidth = 80
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      return vim_item
    end  },
    sources = cmp.config.sources({
     { name = "copilot", group_index = 2, keyword_length = 0, priority = 0 },
      { name = 'nvim_lsp', max_item_count = 5 },
      -- { name = 'cmp_tabnine', max_item_count = 5 },
      { name = 'treesitter', max_item_count = 5 },
      { name = 'luasnip', max_item_count = 5 },
      { name = 'buffer', max_item_count = 2 },
      { name = 'tags', max_item_count = 1 },
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
    -- require "completion".on_attach(client)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      },
      floating_window = false
    }, bufnr)

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)


    -- Format on save
  -- if client.resolved_capabilities.document_formatting then
  --   vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting()]]
  -- end
  
  -- Document highlight
  -- if client.resolved_capabilities.document_highlight then
  -- vim.cmd [[
  --   hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
  --   hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
  --   hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
  --   augroup lsp_document_highlight
  --     autocmd! * <buffer>
  --     autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --     autocmd! CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
  --     autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     autocmd! CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
  --   augroup END
  -- ]]
-- end


  end

  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

-- -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
  local servers = {
    'ts_ls',
    'eslint',
    'yamlls',
    'jsonls',
    'bashls',
    'cssls',
    'pyright',
    'html',
    'dockerls',
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

 nvim_lsp['pyright'].setup {
   on_attach = on_attach,
   flags = {
     debounce_text_changes = 150,
   },
   capabilities = capabilities,
   filetypes = { "python" },
  }


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)

-- vim.o.updatetime = 250

local opts = {
  focusable = false,
  close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  border = 'rounded',
  source = 'always',
  signs = true,
  prefix = ' ',
  scope = 'cursor',
}
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    vim.diagnostic.open_float(nil, opts)
  end
})

vim.keymap.set('n', '<C-.>', function()
  vim.diagnostic.open_float(nil, opts)
end, { noremap = true, silent = true })

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

highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint

]])


vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
