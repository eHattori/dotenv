set nocompatible
let s:config_path = $HOME.'/.config/nvim/'

let s:config_files = [
			\'functions.vim',
			\'plugins.vim',
			\'mappings.vim'
			\]

for file in s:config_files
	if filereadable(s:config_path.file)
		exec "so ".s:config_path.file
	endif
endfor

" ---------- COMMON FLAGS -----------
set hidden                                                    " TextEdit might fail if hidden is not set.
set number
set incsearch
set hlsearch
set nowrap
set colorcolumn=120
set clipboard=unnamedplus
set autochdir
set cursorline
set ruler
set ttyfast
set laststatus=2
" set list listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:← " show hidden characters
set maxmempattern=100000                                      " max mem to use
" set shortmess=aoOTIcF                                         " status messages
" set showbreak=↳\ \                                            " show when lines wrap

set title                                                     " tab title as file name
set noshowmode                                                " dont show current mode below statusline
set noshowcmd                                                 " to get rid of display of last command
set cmdheight=2                                               " give more space for displaying messages
set conceallevel=2                                            " set this so we wont break indentation plugin
set splitright                                                " open vertical split to the right
set splitbelow                                                " open horizontal split to the bottom
set tw=90                                                     " auto wrap lines that are longer than that
set emoji                                                     " enable emojis
set history=1000                                              " history limit
set undofile                                                  " enable persistent undo
set undodir=/tmp                                              " undo temp file directory
set foldlevel=99                                               " open all folds by default
set foldmethod=syntax                                         " config fold to syntax
set inccommand=nosplit                                        " visual feedback while substituting
set showtabline=2                                             " always show tabline
set grepprg=rg\ --vimgrep                                     " use rg as default grepper
set smartcase                                                 " if searching text contains uppercase case will not be ignored
" set encoding=utf-8                                            " set internal encoding of vim
set encoding=UTF-8
" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" required by coc
set nobackup                                                  " some servers have issues with backup files
set nowritebackup
set cmdheight=1
set updatetime=100                                            " delays and poor user experience.
set shortmess+=c                                              " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                                            " always show the signcolumn
" ------------ END COMMON FLAGS -----------

syntax enable
syntax on
colorscheme dracula
" colorscheme_bg = "dark"
set t_Co=256
set shell=/bin/zsh
set termguicolors
set background=dark

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set cursorline
" hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" highlight CursorLine guibg=#333333 ctermbg=234

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
