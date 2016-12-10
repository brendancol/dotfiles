
execute pathogen#infect()

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins

set backspace=indent,eol,start

filetype plugin indent on
syntax on
syntax enable
set background=dark
colorscheme solarized
set number
set term=screen-256color

" Turn off arrow keys
" ------
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

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

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:rainbow_active = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NERDTREE STUFF
" " ------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" EMMET JAZZ
" " ------
let g:user_emmet_install_global = 0
autocmd FileType html,css,j2 EmmetInstall
let g:user_emmet_leader_key='<C-C>'

" COFFEESCRIPT DRIPS
" " ------
autocmd BufWritePost *.coffee silent make!

