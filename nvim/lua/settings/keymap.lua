----------------- MOVE LINE UP/DOWN AND DUPPLICATE -------------
vim.cmd([[
    noremap <c-p> :NERDTreeClose \| :Telescope find_files hidden=true<CR>
    noremap <c-f> :NERDTreeClose \| :Telescope live_grep <CR>
    noremap <c-]> :NERDTreeClose \| :Telescope buffers <CR>
]])

vim.keymap.set('n', '<F12>', ':Telescope lsp_definitions<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<F8>', ':Telescope lsp_references<CR>', {noremap = true, silent = true})

----------------- MOVE LINE UP/DOWN AND DUPPLICATE -------------
vim.api.nvim_set_keymap('n', '<A-Down>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Up>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Down>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Up>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<c-A-S-Down>', "yyp<Up><CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<c-A-S-Up>', "yyp<CR>", {noremap = true, silent = true})
vim.keymap.set('v', '<c-A-S-Down>', "YP<Up><CR>", {noremap = true, silent = true})
vim.keymap.set('v', '<c-A-S-Up>', "YP<Down><CR>", {noremap = true, silent = true})
vim.keymap.set('v', '<c-A-S-Up>', "YP<Up><CR>", {noremap = true, silent = true})
----------------- UTILS --------------------------
vim.keymap.set('n', '<C-_>', ':Commentary<CR>', {noremap = true, silent = false})
vim.keymap.set('v', '<C-_>', ':Commentary<CR>', {noremap = true, silent = false})
vim.keymap.set('v', '<C-C>', ':w !xclip -i -sel c<CR>>', {noremap = true, silent = false})

vim.keymap.set('n', '<c-z>', ':u<CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<c-z>', '<c-o>:u<CR>', {noremap = true, silent = false})

vim.keymap.set('n', '<c-y>', '<C-R><CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<c-y>', '<c-o><C-R><CR>', {noremap = true, silent = false})

vim.keymap.set('v', '<C-x>', 'c<CR>', {noremap = true, silent = false})
-- vim.keymap.set('n', '<C-v>', 'p<CR>', {noremap = true, silent = false})
-- vim.keymap.set('v', '<C-v>', 'p<CR>', {noremap = true, silent = false})
-- vim.keymap.set('i', '<C-v>', 'p<CR>', {noremap = true, silent = false})

vim.keymap.set('n', '<F3>', ':Autoformat<CR>', {noremap = true })
vim.keymap.set('n', '<c-s>', ':update<CR>', {noremap = true, silent = false})
vim.keymap.set('v', '<c-s>', '<C-C>:update<CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<c-s>', '<Esc>:update<CR>gi', {noremap = true, silent = false})
vim.keymap.set('n', '<c-q>', ':q<CR>', {noremap = true, silent = false})

----------------- NERDTREE --------------------------
vim.keymap.set('n', '<C-b>', ':NERDTreeTabsToggle<CR>', {noremap = true, silent = false})

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
    noremap <A-l> :bnext<CR>
    noremap <A-k> :bprev<CR>
    noremap <A-w> :bdelete \| :bnext <CR>
 ]])
    
---------------- Terminal ------------------------------
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.cmd([[
    nnoremap <silent> <A-i> :NERDTreeClose <CR> \| <CMD>lua require("FTerm").toggle()<CR>
    noremap  V <A-i> :NERDTreeClose <CR> \| <CMD>lua require("FTerm").toggle()<CR>
    inoremap <silent> <A-i> :NERDTreeClose <CR> \| <CMD>lua require("FTerm").toggle()<CR>
]])


---------------- Trouble -----------------
vim.cmd([[
    nnoremap <silent> <A-x> :NERDTreeClose <CR> \| <cmd>TroubleToggle<cr>
    nnoremap <silent> <A-.> :NERDTreeClose <CR> \| <cmd>TroubleToggle quickfix<cr>

   let g:VM_default_mappings = 0
]])

---------------- Markdown --------------------------------
vim.keymap.set('n', '<F6>', ':MarkdownPreviewToggle<CR>', {noremap = true, silent = true})

