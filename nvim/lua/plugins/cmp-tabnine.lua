-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
-- 	max_lines = 1000;
-- 	max_num_results = 20;
-- 	sort = true;
-- 	run_on_every_keystroke = false;
-- 	snippet_placeholder = '..';
-- 	ignored_file_types = { -- default is not to ignore
-- 		-- uncomment to ignore in lua:
-- 		-- lua = true
-- 	};
-- 	show_prediction_strength = true;
-- 	suggestion_color = {gui = "#808080", cterm = 244},
--   plugins = {
--     cmp= true
--   }
-- })

-- local prefetch = vim.api.nvim_create_augroup("prefetch", {clear = true})

-- vim.api.nvim_create_autocmd('BufRead', {
--   group = prefetch,
--   pattern = '*.ts',
--   callback = function()
--     require('cmp_tabnine'):prefetch(vim.fn.expand('%:p'))
--   end
-- })

-- require('tabnine').setup({
--   disable_auto_comment=true,
--   accept_keymap="<C-2>",
--   dismiss_keymap = "<C-3>",
--   debounce_ms = 800,
--   suggestion_color = {gui = "#808080", cterm = 244},
--   exclude_filetypes = {"TelescopePrompt", "NvimTree"},
--   log_file_path = nil, -- absolute path to Tabnine log file
-- })
--

require("copilot").setup({
  event = { "InsertEnter", "LspAttach" },
  fix_pairs = true,
})
