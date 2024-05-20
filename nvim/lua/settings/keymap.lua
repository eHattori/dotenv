----------------- MOVE LINE UP/DOWN AND DUPPLICATE -------------
vim.cmd([[
    let mapleader = ";"
    noremap <c-p> :Telescope find_files hidden=true<CR>
    noremap <c-f> :Telescope live_grep <CR>
    noremap <c-]> :Telescope buffers <CR>
]])

vim.keymap.set('n', '<F8>', ':Telescope lsp_references<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<F12>', ':Telescope lsp_definitions<CR>', {noremap = true, silent = true})

----------------- MOVE LINE UP/DOWN AND DUPPLICATE -------------
--vim.api.nvim_set_keymap('n', '<A-Down>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', ":m+<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Up>', ":m -2<CR>==", { noremap = true, silent = true })
--vim.api.nvim_set_keymap('v', '<A-Down>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Down>', ":m '>+1<CR><Esc>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Up>', ":m '<-2<CR><Esc>gv=gv", { noremap = true, silent = true })

vim.keymap.set('n', '<A-S-Down>', "yyp<Up>", {noremap = true, silent = true})

vim.keymap.set('n', '<A-S-Up>', "yyp<CR>", {noremap = true, silent = true})
vim.keymap.set('v', '<A-S-Down>', "YP<Up><CR>", {noremap = true, silent = true})
vim.keymap.set('v', '<A-S-Up>', "YP<Down><CR>", {noremap = true, silent = true})
vim.keymap.set('v', '<A-S-Up>', "YP<Up><CR>", {noremap = true, silent = true})
----------------- UTILS --------------------------
vim.keymap.set('n', '<C-_>', ':Commentary<CR>', {noremap = true, silent = false})
vim.keymap.set('v', '<C-_>', ':Commentary<CR>', {noremap = true, silent = false})
vim.keymap.set('v', '<C-C>', ':w !xclip -i -sel c<CR>>', {noremap = true, silent = false})

vim.keymap.set('n', '<c-z>', ':u<CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<c-z>', '<c-o>:u<CR>', {noremap = true, silent = false})

vim.keymap.set('n', '<c-y>', '<C-R><CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<c-y>', '<c-o><C-R><CR>', {noremap = true, silent = false})

vim.keymap.set('v', '<C-x>', 'c<CR>', {noremap = true, silent = false})

-- vim.keymap.set('n', '<C-i>', ':lua vim.lsp.buf.format()<CR>', {noremap = true })
-- vim.keymap.set('n', '<c-S-i>', ':lua vim.lsp.buf.format()<CR>', {noremap = true })
vim.keymap.set('n', '<C-i>', ':Prettier<CR>', {noremap = true })
vim.keymap.set('n', '<c-S-i>', ':Prettier<CR>', {noremap = true })
-- vim.keymap.set('n', '<c-Down>', ':Prettier<CR>', {noremap = true })
vim.keymap.set('n', '<c-s>', ':update!<CR>', {noremap = true, silent = false})
vim.keymap.set('v', '<c-s>', ':update!<CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<c-s>', ':update!<CR>gi', {noremap = true, silent = false})
vim.keymap.set('n', '<c-q>', ':qall!<CR>', {noremap = true, silent = false})

----------------- NERDTREE --------------------------
-- vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-b>', ':Neotree toggle last<CR>', {noremap = true, silent = true})

----------------- SHIFT ARROW SELECTION --------------------------
vim.cmd([[

    nnoremap <silent> <A-d> :let @/=expand('<cword>')<cr>cgn
    nmap <S-Up> v<Up>
    nmap <S-End> vg$<Right>
    nmap <S-Home> v<Home>
    nmap <S-Down> v<Down>
    imap <S-Left> v<Left>
    imap <S-Right> v<Right>
    nmap <S-Left> v<Left>
    nmap <S-Right> v<Right>
    vmap <S-Up> <Up>
    vmap <S-Down> <Down>
    vmap <S-Left> <Left>
    vmap <S-Right> <Right>
    imap <S-Up> <Esc>v<Up>
    imap <S-Down> <Esc>v<Down>
    imap <S-Left> <Esc>v<Left>
    imap <S-Right> <Esc>v<Right>

    noremap <C-A> gggH<C-O>G
    inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
    cnoremap <C-A> <C-C>gggH<C-O>G
    onoremap <C-A> <C-C>gggH<C-O>G
    snoremap <C-A> <C-C>gggH<C-O>G
    xnoremap <C-A> <C-C>ggVG

    noremap <C-S-Right> ve
    inoremap <C-S-Right> <Esc><Right>ve
    vnoremap <C-S-Right> e

]])
---------------- Resize splits with arrow keys -------------
vim.cmd([[
    noremap 1<up> :res +5<CR>
    noremap 1<down> :res -5<CR>
    noremap 1<left> :vertical resize-5<CR>
    noremap 1<right> :vertical resize+5<CR>
]])


---------------- Tab management -------------------------
vim.cmd([[
    noremap <C-PageUp> :bp<CR>
    noremap <C-PageDown> :bn<CR>
    noremap <C-w> :bw<CR>
 ]])
    
---------------- Terminal ------------------------------
vim.keymap.set('n', '<A-i>', ':ToggleTerm<CR>', {noremap = true })

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

---------------- Trouble -----------------
vim.cmd([[
    nnoremap <silent> <A-x> <cmd>TroubleToggle<cr>
    nnoremap <silent> <A-.> <cmd>TroubleToggle quickfix<cr>

   let g:VM_default_mappings = 0
   let g:VM_maps = {}
   let g:VM_maps["Add Cursor Down"]             = '<C-down>'
   let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
   let g:VM_theme = 'neon'
]])

---------------- Markdown --------------------------------
vim.keymap.set('n', '<F6>', ':MarkdownPreviewToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<c-k>', 'lua vim.lsp.buf.signature_help()<CR>', {noremap = true, silent = true})

---------------- Fold --------------------------------
-- vim.keymap.set('n', 'za', ':set foldmethod=indent<CR>za', {noremap = true, silent = false})
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-----------------Command line -------------------------
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
