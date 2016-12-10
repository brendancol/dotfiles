
call plug#begin()
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/editorconfig/editorconfig-vim.git'
Plug 'https://github.com/nvie/vim-flake8.git'
Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
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

set termguicolors
set background=dark
colorscheme solarized

set encoding=utf-8

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
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" AIRLINE
" ------
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

