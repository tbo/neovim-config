set nocompatible
call plug#begin('~/.nvim/plugged')

" Defaults defined by tpope

Plug 'tpope/vim-sensible'

" General Purpose

Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/Solarized'
Plug 'vim-scripts/ctrlp.vim'
Plug 'lokikl/vim-ctrlp-ag'
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'pbogut/fzf-mru.vim'
Plug 'vim-scripts/fugitive.vim'
" Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'ap/vim-css-color'

" User interface

Plug 'bling/vim-airline'
Plug 'spolu/dwm.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'jszakmeister/vim-togglecursor'

" Syntax & completion

Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'

" Helpers

Plug 'machakann/vim-swap'
Plug 'osyo-manga/vim-over'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'PeterRincker/vim-argumentative'

" Javascript & Typescript

" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'maksimr/vim-jsbeautify'
" Plug 'marijnh/tern_for_vim'
" Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Unused?

" Plug 'ervandew/supertab'
" Plug 'Valloric/YouCompleteMe'
" Plug 'Chun-Yang/vim-action-ag'
" Plug 'einars/js-beautify'
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
set inccommand=split
" set mouse=nicr
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
nmap t :CtrlPag<CR>
map f :CtrlPBuffer<CR>
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
autocmd BufWritePost * Neomake

let g:deoplete#enable_at_startup = 1
" let g:neomake_typescript_jsx_enabled_makers = ['tslint']
" let g:neomake_jsx_enabled_makers = ['eslint']

let g:jsx_ext_required = 0

" TODO: Choose proper gitgutter symbols
" let g:gitgutter_sign_added = '✎'
set fillchars+=vert:│
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:SuperTabContextDefaultCompletionType = '<C-n>'
"
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ctrlp_max_height = 20
" Plugin configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" nmap ; <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" Use powerline fonts for airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0

set wildignore+=*/target/*,*/node_modules/*,*/bower_components/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.project', 'yiic.php']

let g:ycm_confirm_extra_conf = 0

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
set pastetoggle=<F2>

" Puts new split windows to the bottom of the current.
set splitbelow

" Puts vertical windows to right, instead of left.
set splitright

" Close youcompleteme preview
autocmd CompleteDone * pclose

" solarized options
" set t_Co=256                      " force vim to use 256 colors
" let g:solarized_visibility = 'high'
" let g:solarized_contrast = 'high'
let g:solarized_termcolors=16 " use solarized 256 fallback
set background=dark
colorscheme solarized
nnoremap c :ls<cr>:b
"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
