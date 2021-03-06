
call plug#begin()
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/editorconfig/editorconfig-vim.git'
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/mattn/emmet-vim.git'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'iCyMind/NeoSolarized'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()


set runtimepath+=$XDG_CONFIG_HOME/nvim/plugged/deoplete.nvim
set completeopt+=noinsert,noselect
set completeopt-=preview

hi Pmenu    gui=NONE    guifg=#c5c8c6 guibg=#373b41
hi PmenuSel gui=reverse guifg=#c5c8c6 guibg=#373b41

let g:deoplete#enable_at_startup = 1

filetype plugin indent on

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

set backspace=indent,eol,start

imap jk <Esc>
imap kj <Esc>

tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>

filetype plugin indent on
set number
set ruler
set cursorline

syntax enable
syntax on

set t_Co=256
set termguicolors
set background=dark
set encoding=utf-8

colorscheme NeoSolarized
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

" SEARCH
" ------
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set hlsearch                    " highlight search terms
set incsearch                   " start highlighting (partial) matches as soon as you start typing letters after '/'

autocmd BufWritePost *.py call Flake8()

let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
let g:PyFlakeDefaultComplexity=10
let g:PyFlakeAggressive = 0
let g:PyFlakeCWindow = 6 
let g:PyFlakeSigns = 1 
let g:PyFlakeMaxLineLength = 120

" AUTOCOMPLETE
" ------
" #let g:deoplete#enable_at_startup = 1
" #if !exists('g:deoplete#omni#input_patterns')
" #  let g:deoplete#omni#input_patterns = {}
" #endif
" #let g:deoplete#disable_auto_complete = 1
" #autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" #
" #" deoplete tab-complete
" #inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>


" AIRLINE
" ------
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-m>'

autocmd Filetype html setlocal ts=2 sw=2 et
autocmd Filetype ruby setlocal ts=2 sw=2 et
autocmd Filetype python setlocal ts=4 sw=4 et
autocmd Filetype javascript setlocal ts=2 sw=2 et
autocmd Filetype coffeescript setlocal ts=4 sw=4 et
autocmd Filetype jade setlocal ts=4 sw=4 et

" GOLANG
" ------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:go_auto_type_info = 1

au TermOpen * setlocal nonumber norelativenumber

:command Vspt vsp term://zsh
:command Spt sp term://zsh
