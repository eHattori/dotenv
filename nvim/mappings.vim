
" -------------- COC MAPPING CONFIG ---------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> <F8> <Plug>(coc-references)<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <C-.>  <Plug>(coc-fix-current)
nmap <F2> <Plug>(coc-rename)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>Cocdiagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" ----------------- END ---------------------------

" ----------------- MOVE LINE UP/DOWN AND DUPPLICATE -------------
nnoremap <silent> <A-Down> :m .+1<CR>==
inoremap <silent> <A-Up> <Esc>:m .-2<CR>==gi
inoremap <silent> <A-Down> <Esc>:m .+1<CR>==gi
vnoremap <silent> <A-Up> :m '<-2<CR>gv=gv
vnoremap <silent> <A-Down> :m '>+1<CR>gv=gv

nnoremap <silent> <c-A-S-Down> yyp<Up><CR>
nnoremap <silent> <c-A-S-Up> yyp<CR>
" ----------------- END ----------------------------

" ----------------- UTILS --------------------------
noremap <C-_> :Commentary<CR>                          " comment
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>             " copy selection

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

" ----------------- END ----------------------------

" ----------------- NERDTree CONFIG ----------------
nnoremap <C-b> :NERDTreeTabsToggle<CR>

" " Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

" " Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" " Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" " Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif

" autocmd BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | exe "normal! \<c-w>\<c-w>" | :blast | endif
" autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close Vim if NERDTree is the only window open

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
let g:airline_skip_empty_sections = 1
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)[0:40]}'
let g:airline_section_z = ''
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#wordcount#formatter#default#fmt = '%d w'
" ----------------- END ----------------------------

" ----------------- DEV ICONS CONFI----------------
let g:webdevicons_enable = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
" ----------------- END ----------------------------

" ----------------- FZV CONFIG ----------------
noremap <c-p> :GFiles <CR>
noremap <c-f> :NERDTreeFocus <bar> :Ag<CR>
" ----------------- END ----------------------------

" ----------------- GIT CONFIG ----------------
let g:blamer_enabled = 1
let g:blamer_delay = 500

" autocmd CursorHold * silent call CocActionAsync('highlight')


" --------------------- terminal -------------------------


" nnoremap <c-j> :vsplit term://zsh<cr>
" tnoremap <c-j> <C-\><C-n> :vsplit term://zsh<cr>


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


let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nmap <F5> <Plug>(lcn-menu)

" === Tab management
" ===
" Create a new tab with tu
noremap <c-n> :tab split<CR>
" Move around tabs with tn and ti
" map <C-'> gt
map <c-1> gt
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

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
