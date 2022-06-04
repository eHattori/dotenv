----------------- MOVE LINE UP/DOWN AND DUPPLICATE -------------
vim.cmd([[
    noremap <c-p> :NERDTreeClose \| :Telescope find_files <CR>
    noremap <c-f> :NERDTreeClose \| :Telescope live_grep <CR>
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

----------------- UTILS --------------------------
vim.keymap.set('n', '<C-_>', ':Commentary<CR>', {noremap = true, silent = false})
vim.keymap.set('v', '<C-C>', ':w !xclip -i -sel c<CR>>', {noremap = true, silent = false})

vim.keymap.set('n', '<c-z>', ':u<CR>', {noremap = true, silent = false})
vim.keymap.set('i', '<c-z>', '<c-o>:u<CR>', {noremap = true, silent = false})

vim.keymap.set('n', '<F3>', ':FormatWrite<CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<c-s>', ':w<CR>', {noremap = true, silent = false})
vim.keymap.set('n', '<c-q>', ':q<CR>', {noremap = true, silent = false})

----------------- NERDTREE --------------------------
vim.keymap.set('n', '<C-b>', ':NERDTreeTabsToggle<CR>', {noremap = true, silent = false})

----------------- SHIFT ARROW SELECTION --------------------------
vim.cmd([[
    nmap <S-Up> v<Up>
    nmap <S-End> vg$<Right>
    nmap <S-Down> v<Down>
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
]])

---------------- Resize splits with arrow keys -------------
vim.cmd([[
    noremap 1<up> :res +5<CR>
    noremap 1<down> :res -5<CR>
    noremap 1<left> :vertical resize-5<CR>
    noremap 1<right> :vertical resize+5<CR>
]])


---------------- Tab management
vim.cmd([[
    noremap <A-j> :bnext<CR>
    noremap <A-k> :bprev<CR>
    ]])
    
---------------- Terminal
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

