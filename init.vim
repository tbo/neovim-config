set nocompatible
call plug#begin('~/.nvim/plugged')

" Defaults defined by tpope

Plug 'tpope/vim-sensible'

" General Purpose
Plug 'vim-scripts/tComment'
Plug 'vim-scripts/Solarized'
Plug 'vim-scripts/ctrlp.vim'
Plug 'vim-scripts/fugitive.vim'
Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'

" User interface

Plug 'bling/vim-airline'
Plug 'spolu/dwm.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'jszakmeister/vim-togglecursor'

" Syntax & completion

Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'

" Helpers

Plug 'vim-scripts/SearchComplete'
Plug 'osyo-manga/vim-over'
Plug 'ervandew/supertab'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Javascript & Typescript

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maksimr/vim-jsbeautify'
Plug 'marijnh/tern_for_vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Unused?

" Plug 'Chun-Yang/vim-action-ag'
" Plug 'einars/js-beautify'
" Plug 'PeterRincker/vim-argumentative'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Plug 'derekwyatt/vim-scala'

call plug#end()

" Options
set nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set cursorline
set ignorecase
set smartcase
set incsearch
set noswapfile
set nowritebackup
set laststatus=2
set hidden
set relativenumber
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
set modelines=0
set scrolloff=3
set mouse=nicr
set scrolloff=9999
" Do not wrap lines
set nowrap
" No syntax highlighting beyond 512 columns
set synmaxcol=512
syntax enable
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Key bindings
let mapleader=","
nmap ; :
map <Space> :CtrlP<CR>
map s :w<CR>
nnoremap <F10> :b <C-Z>
" inoremap jj <ESC>
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType json noremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType css,scss noremap <buffer> <c-f> :call CSSBeautify()<cr>
" autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

let g:jsx_ext_required = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabContextDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Plugin configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" nmap ; <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" Use powerline fonts for airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

" Indent line
let g:indentLine_color_term = 0
let g:indentLine_char = '︙'

set wildignore+=*/target/*,*/node_modules/*,*/bower_components/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.project', 'yiic.php']

let g:syntastic_javascript_checkers = ['eslint']
" let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" Close youcompleteme preview
autocmd CompleteDone * pclose

" solarized options
" set t_Co=256                      " force vim to use 256 colors
" let g:solarized_visibility = 'high'
" let g:solarized_contrast = 'high'
let g:solarized_termcolors=16 " use solarized 256 fallback
set background=dark
colorscheme solarized
