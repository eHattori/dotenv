vim.cmd([[
    let g:airline_powerline_fonts = 1    
    let g:airline#extensions#hunks#enabled=0
    let g:airline#extensions#branch#enabled=1
    let g:airline_skip_empty_sections = 1
    let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)[0:40]}'
    let g:airline#extensions#tabline#enabled = 1
]])