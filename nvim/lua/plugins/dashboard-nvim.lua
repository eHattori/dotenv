vim.cmd([[
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
        \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
        \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
        \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
        \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
        \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
        \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        \]

    
    set completeopt=menu,menuone,noselect

    hi Visual term=reverse cterm=reverse guibg=Grey
    
]])
