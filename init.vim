set nocompatible
call plug#begin('~/.nvim/plugged')

" Defaults defined by tpope

Plug 'tpope/vim-sensible'

" General Purpose

Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/fugitive.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'ap/vim-css-color'

" User interface

Plug 'bling/vim-airline'
Plug 'spolu/dwm.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'jszakmeister/vim-togglecursor'
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
Plug 'simnalamburt/vim-mundo'
" Tag auto generation
Plug 'ludovicchabant/vim-gutentags'

" Color Themes
Plug 'mhartington/oceanic-next'
Plug 'liuchengxu/space-vim-dark'
Plug 'whatyouhide/vim-gotham'
Plug 'lsdr/monokai'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'

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
set lazyredraw
set noshowcmd
autocmd BufWinEnter &buftype!='terminal' lcd %:p:h
" Do not wrap lines
set nowrap
" No syntax highlighting beyond 256 columns
set synmaxcol=256
syntax sync minlines=256
" Highlight trailing whitespace
set list
" set listchars=tab:\|\ ,
" hi SpecialKey ctermfg=66

syntax enable
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
nmap t :Tags<CR>
map f :Buffers<CR>

" Use ESC to switch to normal mode in terminals except in fzf
autocmd FileType fzf tnoremap <buffer> <ESC> <C-g>
autocmd TermOpen term://* tnoremap <buffer> <ESC> <C-\><C-n>

nmap <D-j> <C-W>w
nmap <D-k> <C-W>W
tmap <D-j> <C-\><C-n><C-W>w
tmap <D-k> <C-\><C-n><C-W>W
nmap <D-Enter> :call DWM_Focus()<CR>
tmap <D-Enter> <C-\><C-n>:call DWM_Focus()<CR>
nmap <C-Enter> :call DWM_Focus()<CR>
tmap <C-Enter> <C-\><C-n>:call DWM_Focus()<CR>
map <Space> :GFiles<CR>
map s :w<CR>
nmap gh :call LanguageClient_textDocument_hover()<CR>
nmap gd :call LanguageClient_textDocument_definition()<CR>
nmap gn :call LanguageClient_textDocument_rename()<CR>
nmap gr :call LanguageClient_textDocument_references()<CR>
nmap <silent> <Esc> :noh<CR>

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
autocmd BufWritePost * Neomake
let g:neomake_error_sign = ''
let g:neomake_warning_sign = ''

let b:deoplete_ignore_sources = ['buffer', 'neco-syntax']
let g:deoplete#enable_at_startup = 1

" let g:jsx_ext_required = 0

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
nmap c <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" Use powerline fonts for airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : '',
            \ 'i'  : '',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ 't'  : '',
            \ '' : 'S',
            \ }

set wildignore+=*/target/*,*/node_modules/*,*/bower_components/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.project', 'yiic.php']

" Leaving and entering terminal window
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

if (has("termguicolors") || has("vimr"))
 set termguicolors
endif

highlight Comment cterm=italic
autocmd ColorScheme * hi VertSplit guibg=bg
" colorscheme OceanicNext
colorscheme gotham
let g:airline_theme='oceanicnext'
" Or if you have Neovim >= 0.1.5
let g:enable_bold_font = 1
set completeopt-=preview

function! s:getCommonPath(paths)
    let common = split(a:paths[0], '/')
    for path in a:paths
        let index = 0
        for segment in split(path, '/')
            if len(common) <= index
                break
            elseif common[index] != segment
                call remove(common, index, -1)
                break
            endif
            let index += 1
        endfor
    endfor
    return join(common, '/')
endfunction

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4.. --preview-window up:40% --preview "''/Users/tbo/.nvim/plugged/fzf.vim/bin/preview.rb''"\ \{\}', 'dir': systemlist('git rev-parse --show-toplevel')[0], 'down': '50%'}, <bang>0)
let g:mruBuffers = []

function! AddBuffer()
    let currentBuffer = expand('%:p')
    let g:mruBuffers = [currentBuffer] + filter(g:mruBuffers, 'currentBuffer!=v:val&&bufexists(v:val)&&buflisted(v:val)')
endfunction

function! s:bufopen(e)
  execute 'buffer' a:e
endfunction

function! OpenBufferSelection()
    let common = s:getCommonPath(g:mruBuffers)
    let commonLength = strlen(common) + 2
    let buffers = map(add(g:mruBuffers[1:], g:mruBuffers[0]), 'strpart(v:val, commonLength)')
    call fzf#run({'source': buffers, 'sink': function('s:bufopen'), 'down': len(buffers)+3})
endfunction

autocmd BufAdd * :call AddBuffer()
autocmd BufEnter * :call AddBuffer()
command! -bang -nargs=* Buffers call OpenBufferSelection()
