set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'nacitar/a.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'fannheyward/rainbow_parentheses.vim'
Plugin 'vim-scripts/loremipsum'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'mhinz/vim-startify'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
Plugin 'Keithbsmiley/swift.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>ee :e ~/.vimrc<cr>
map <silent> <leader>n :nohlsearch<cr>
inoremap <C-g> <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

nmap ? /\<\><Left><Left>

set guifont=Monaco:h15
set guifontwide=Monaco:h15
colorscheme slate
set background=dark
set ttyfast

" Chinese encodingcoding
set encoding=utf-8
set fileencodings=utf-8,gbk,chinese,cp936,gb18030,utf-16le,utf-16,big5,euc-jp,euc-kr,latin-1
set fileencoding=utf-8

set number
setlocal noswapfile
set smartindent       "set smart indent
set expandtab
set tabstop=4
set shiftwidth=4
set nofoldenable
set foldmethod=indent
set showmatch
set matchtime=2
set matchpairs+=<:>
set hlsearch
set ignorecase smartcase
set completeopt=longest,menu
let do_syntax_sel_menu=1
set updatetime=200

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" some autocmd
autocmd FileType html,javascript,css,json setlocal shiftwidth=2 tabstop=2

:command W w
:command Q q
:command Qa qa
:command Wa wa
:command Wqa wqa
:command WQa wqa

"" Recommended key-mappings. For no inserting <CR> key.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-n>\<C-y>" : "\<CR>"
endfunction

cs add cscope.out

" Plugin config.
" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](bower_components|node_modules|vendor|target|dist|_site|nginx_runtime|build|logs|data)|(\.(swp|ico|git|svn))$'

set wildignore+=*.pyc,*.sqlite,*.sqlite3
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/nginx_runtime/*,*/build/*,*/logs/*

" CtrlSF
:com! -n=* F CtrlSF <args>
:com! -n=0 FOpen CtrlSFOpen
"let g:ctrlsf_auto_close = 0

" Tasklist
let g:tlTokenList = ['TODO' , 'WTF', 'FIX']

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadSquare " []
au Syntax * RainbowParenthesesLoadBraces " {}
"au Syntax * RainbowParenthesesLoadChevrons " <>

" Startify
let g:startify_custom_header = [
    \'  YYYYYY       YYYYYYYY EEEEEEEEEEEEEEEEEEEEE    SSSSSSSSSSSSSSS',
    \'  Y:::::Y       Y:::::Y E::::::::::::::::::::E  SS:::::::::::::::S',
    \'  Y:::::Y       Y:::::Y E::::::::::::::::::::E S:::::SSSSSS::::::S',
    \'  Y::::::Y     Y::::::Y EE::::::EEEEEEEEE::::E S:::::S     SSSSSSS',
    \'  YYY:::::Y   Y:::::YYY   E:::::E       EEEEEE S:::::S',
    \'     Y:::::Y Y:::::Y      E:::::E              S:::::S',
    \'      Y:::::Y:::::Y       E::::::EEEEEEEEEE     S::::SSSS',
    \'       Y:::::::::Y        E:::::::::::::::E      SS::::::SSSSS',
    \'        Y:::::::Y         E:::::::::::::::E        SSS::::::::SS',
    \'         Y:::::Y          E::::::EEEEEEEEEE           SSSSSS::::S',
    \'         Y:::::Y          E:::::E                          S:::::S',
    \'         Y:::::Y          E:::::E       EEEEEE             S:::::S',
    \'         Y:::::Y        EE::::::EEEEEEEE:::::E SSSSSSS     S:::::S',
    \'      YYYY:::::YYYY     E::::::::::::::::::::E S::::::SSSSSS:::::S',
    \'      Y:::::::::::Y     E::::::::::::::::::::E S:::::::::::::::SS',
    \'      YYYYYYYYYYYYY     EEEEEEEEEEEEEEEEEEEEEE  SSSSSSSSSSSSSSS',
    \'',
    \]

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" NERDTree
let NERDTreeIgnore=['\.pyc', '\.out$', 'bak$', 'node_modules', 'dist']

" YCM
nnoremap <buffer> <silent> gd :YcmCompleter GoTo<cr>
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_server_log_level = 'error'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

