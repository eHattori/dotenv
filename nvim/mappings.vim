inoremap jk <ESC>
" " GoTo code navigation.
nmap <silent> <F12> :Telescope lsp_definitions<CR>
nmap <silent> <F8> :Telescope lsp_references<CR>

" ----------------- MOVE LINE UP/DOWN AND DUPPLICATE -------------
nnoremap <silent> <A-Down> :m .+1<CR>==
nnoremap <silent> <A-Up> :m .-2<CR>==

inoremap <silent> <A-Up> <Esc>:m .-2<CR>==gi
inoremap <silent> <A-Down> <Esc>:m .+1<CR>==gi
vnoremap <silent> <A-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <A-Up> :m '<-2<CR>gv=gv

nnoremap <silent> <c-A-S-Down> yyp<Up><CR>
nnoremap <silent> <c-A-S-Up> yyp<CR>
" ----------------- END ----------------------------

" ----------------- UTILS --------------------------
noremap <C-_> :Commentary<CR>                          " comment
vnoremap <C-C> :w !xclip -i -sel c<CR>>             " copy selection

nnoremap <c-z> :u<CR>                                  " undo
inoremap <c-z> <c-o>:u<CR>

noremap <c-I> :Autoformat<CR>                          " format file or selection
noremap <c-s> :w <CR>                                  " save


noremap <C-S-Home> za<CR>                              " fold region
noremap <C-S-End> zo<CR>                               " unfold region

noremap <c-q> :q<CR>                                   " close window/instance


map <c-j> <c-w>j                                       " config moviment between tabs
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

noremap <c-K> dd<CR>                                   " delete line or sellection

" shift+arrow selection
nmap <S-Up> v<Up>
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


nnoremap <c-M> :TroubleToggle<CR>
" ----------------- END ----------------------------

" ----------------- NERDTree CONFIG ----------------
nnoremap <C-b> :NERDTreeTabsToggle<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
      \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:nerdtree_tabs_open_on_gui_startup=2
let g:nerdtree_tabs_open_on_console_startup=2
let g:nerdtree_tabs_autofind=1


let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=35
let g:NERDTreeHighlightCursorline = 1
let NERDTreeChDirMode=2
let NERDTreeCascadeOpenSingleChildDir=1
let g:nerdtree_sync_cursorline = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$']
let NERDTreeMinimalUI=1
let g:NERDTreeWinPos = "left"
let g:webdevicons_enable_nerdtree = 1


" ----------------- END ----------------------------

" ----------------- AIRLINE CONFIG ----------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_skip_empty_sections = 1
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)[0:40]}'
let g:airline#extensions#tabline#enabled = 1
" ----------------- END ----------------------------

" ----------------- DEV ICONS CONFI----------------
let g:webdevicons_enable = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
" ----------------- END ----------------------------

" ----------------- FZV CONFIG ----------------
" noremap <c-p> :GFiles <CR>
noremap <c-p> :Telescope find_files <CR>
noremap <c-f> :Telescope live_grep <CR>
" ----------------- END ----------------------------

" ----------------- GIT CONFIG ----------------
let g:blamer_enabled = 1
let g:blamer_delay = 500
" --------------------- terminal -------------------------

" Toggle terminal on/off (neovim)
nnoremap <c-j> :call TermToggle(12)<CR>
inoremap <c-j> <Esc>:call TermToggle()<CR>
tnoremap <c-j> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" vim-test
let g:test#preserve_screen = 1
let test#ruby#rspec#executable = 'bundle exec rspec -f d -c '
nmap <silent><F10> :TestFile<CR>
nmap <silent><F9> :TestLast  <CR>

let g:airline_powerline_fonts=1

" snippet_version 0 is legacy 1 is new
let g:snipMate = { 'snippet_version' : 1 }

let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ }

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'ruby': ['brakeman', 'reek', 'rubocop', 'solargraph', 'standardrb'],
      \}

let g:ale_sign_error = '>>'
let g:ale_sign_info = '--'


let g:ag_working_path_mode="r"

nmap <F5> <Plug>(lcn-menu)

" === Tab management
" ===
" Create a new tab with tu
" noremap <c-n> :tab split<CR>
" Move around tabs with tn and ti
" map <C-'> gt
" map <c-1> gt
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

" Resize splits with arrow keys
noremap '<up> :res +5<CR>
noremap '<down> :res -5<CR>
noremap '<left> :vertical resize-5<CR>
noremap '<right> :vertical resize+5<CR>

let g:indentLine_char = '│'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_fileTypeExclude = ['dashboard']
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
