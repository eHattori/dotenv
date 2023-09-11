-- vim.cmd([[    

--     " Start NERDTree when Vim starts with a directory argument.
--     autocmd StdinReadPre * let s:std_in=1
--     autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
--           \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
    
    
--     " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
--     autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
--           \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


--     autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
          
--     let g:nerdtree_tabs_open_on_gui_startup=2
--     let g:nerdtree_tabs_open_on_console_startup=2
--     let g:nerdtree_tabs_autofind=1
    
    
--     let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
--     let NERDTreeWinSize=35
--     let g:NERDTreeHighlightCursorline = 1
--     let NERDTreeChDirMode=2
--     let NERDTreeCascadeOpenSingleChildDir=1
--     let g:nerdtree_sync_cursorline = 1
--     let NERDTreeShowHidden=1
--     let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$']
--     let NERDTreeMinimalUI=1
--     let g:NERDTreeWinPos = "left"
--     let g:webdevicons_enable_nerdtree = 1
--     hi Directory guifg=#FFF ctermfg=white
--     hi File guifg=#FFF ctermfg=white
-- ]])

