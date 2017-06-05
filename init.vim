set nocompatible
call plug#begin('~/.nvim/plugged')

" Defaults defined by tpope

Plug 'tpope/vim-sensible'

" General Purpose

Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/Solarized'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/fugitive.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'ap/vim-css-color'

" User interface

Plug 'bling/vim-airline'
Plug 'spolu/dwm.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'

" Syntax & completion

Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Helpers

Plug 'machakann/vim-swap'
Plug 'PeterRincker/vim-argumentative'
Plug 'maksimr/vim-jsbeautify'
Plug 'simnalamburt/vim-mundo'

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
set autochdir
" Do not wrap lines
set nowrap
" No syntax highlighting beyond 256 columns
set synmaxcol=256
" Highlight trailing whitespace
set list
" set listchars=tab:\|\ ,
hi SpecialKey ctermfg=66

syntax enable
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['~/git/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'typescript': ['~/git/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'typescript.jsx': ['~/git/javascript-typescript-langserver/lib/language-server-stdio.js'],
\ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Key bindings
let mapleader=","
nmap ; :
nmap t :Ag<CR>
map f :Buffers<CR>
" map <Space> :CtrlP<CR>
map <Space> :GFiles<CR>
" nmap t :CtrlPag<CR>
" map f :CtrlPBuffer<CR>
" let g:ctrlp_bufname_mod = ':~:.'
map s :w<CR>
nnoremap <F10> :b <C-Z>
nmap gh :call LanguageClient_textDocument_hover()<CR>
nmap gd :call LanguageClient_textDocument_definition()<CR>
nmap gn :call LanguageClient_textDocument_rename()<CR>
nmap gr :call LanguageClient_textDocument_references()<CR>
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType json noremap <buffer>  <c-f> :call JsBeautify()<cr>
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" autocmd FileType css,scss noremap <buffer> <c-f> :call CSSBeautify()<cr>
" autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
" autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
autocmd BufWritePost * Neomake

let b:deoplete_ignore_sources = ['buffer', 'neco-syntax']
let g:deoplete#enable_at_startup = 1

let g:jsx_ext_required = 0

" TODO: Choose proper gitgutter symbols
" let g:gitgutter_sign_added = '✎'
set fillchars+=vert:│

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
" autocmd CompleteDone * pclose

" solarized options
" set t_Co=256                      " force vim to use 256 colors
" let g:solarized_visibility = 'high'
" let g:solarized_contrast = 'high'
let g:solarized_termcolors=16 " use solarized 256 fallback
set background=dark
colorscheme solarized
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
highlight Comment cterm=italic
set completeopt-=preview
" command! -bang -nargs=* GitAg
"   \ call fzf#vim#ag_raw(<q-args>, {'dir': systemlist('git rev-parse --show-toplevel')[0]}, <bang>0)
" command! -bang -nargs=+ -complete=dir AgRaw call fzf#vim#ag_raw(<q-args>,
" \                     fzf#vim#with_preview('right:50%:hidden', '?'),
" \                     <bang>0)
