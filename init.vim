let g:dwm_map_keys = 0
let g:mruBuffers = get(g:, 'mruBuffers', [])
let g:fzf_buffers_jump = 1
autocmd!
call plug#begin('~/.nvim/plugged')

" Defaults defined by tpope

Plug 'tpope/vim-sensible'

" General Purpose

" Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/fugitive.vim'
Plug 'Lokaltog/vim-easymotion'

" User interface

Plug 'spolu/dwm.vim'
Plug 'airblade/vim-gitgutter'
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

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Quramy/tsuquyomi'

" Helpers

Plug 'simnalamburt/vim-mundo'
Plug 'PeterRincker/vim-argumentative'

" Color Themes
Plug 'whatyouhide/vim-gotham'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Options

" Indent defaults
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
" Highlights current line
set cursorline
set ignorecase
set smartcase
" Don't create those annoying backup files
set noswapfile
set nowritebackup
" Don't delete hidden buffers
set hidden
" Prefix current line with its line number
set nu
" Set relative line numbers
set relativenumber
" Improve command completion
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
" Disable modelines
set modelines=0
set inccommand=nosplit
set mouse-=a
" Center current line
set scrolloff=9999
" Do not wrap lines
set nowrap
" No syntax highlighting beyond 256 columns
set synmaxcol=256
syntax sync minlines=256
" Highlight trailing whitespace
set listchars=tab:\ \ ,trail:·
set list
" Share clipboard between vim and mac
set clipboard=unnamed
" Reduces visual noise
set noshowcmd
set noshowmode
set nolazyredraw
" Show sign column by default
set signcolumn=yes
set cc=120
" Increase terminal scroll back size
let g:terminal_scrollback_buffer_size = 10000
let g:startify_change_to_dir = 0
syntax enable

    " \ 'javascript': ['~/git/typescript-language-server/lib/cli.js', '--stdio'],
    " \ 'typescript': ['~/git/typescript-language-server/lib/cli.js', '--stdio'],
    " \ 'typescript.jsx': ['~/git/typescript-language-server/lib/cli.js', '--stdio'],
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['~/git/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'typescript': ['~/git/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'typescript.jsx': ['~/git/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'go': ['~/go/bin/go-langserver'],
\ }

    " \ 'javascript': ['~/git/typescript-language-server/lib/cli.js', '--stdio', '--log-file', '/tmp/tslog.txt'],
    " \ 'typescript': ['~/git/typescript-language-server/lib/cli.js', '--stdio', '--log-file', '/tmp/tslog.txt'],
    " \ 'typescript.jsx': ['~/git/typescript-language-server/lib/cli.js', '--stdio', '--log-file', '/tmp/tslog.txt'],
" Automatically start language servers.
" let g:LanguageClient_windowLogMessageLevel = 4
let g:LanguageClient_setLoggingLevel = 'INFO'
let g:LanguageClient_autoStart = 1
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
"     au User lsp_setup call lsp#register_server({
"                 \ 'name': 'typescript-language-server',
"                 \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
"                 \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"                 \ 'whitelist': ['typescript'],
"                 \ })

" Key bindings
nmap ; :
map f :MyBuffers<CR>

" Use ESC to switch to normal mode in terminals except in fzf
autocmd FileType fzf tnoremap <buffer> <ESC> <C-g>
autocmd TermOpen term://* tmap <buffer> <ESC> <C-\><C-n>
autocmd TermOpen term://* tnoremap <buffer> <ESC-e> <nop>

" autocmd BufWinEnter * lcd %:p:h
nmap <silent> <D-j> <C-W>w
nmap <silent> <F2> <C-W>w
tmap <silent> <D-j> <C-\><C-n><C-W>w
tmap <silent> <F2> <C-\><C-n><C-W>w

nmap <silent> <D-k> <C-W>W
nmap <silent> <F3> <C-W>W
tmap <silent> <D-k> <C-\><C-n><C-W>W
tmap <silent> <F3> <C-\><C-n><C-W>W

nmap <silent> <D-Enter> :call DWM_Focus()<CR>
nmap <silent> <F4> :call DWM_Focus()<CR>
tmap <silent> <D-Enter> <C-\><C-n>:call DWM_Focus()<CR>
tmap <silent> <F4> <C-\><C-n>:call DWM_Focus()<CR>

nmap <silent> <F5> :call DWM_ShrinkMaster()<CR>
tmap <silent> <F5> <C-\><C-n>:call DWM_ShrinkMaster()<CR>

nmap <silent> <F6> :call DWM_GrowMaster()<CR>
tmap <silent> <F6> <C-\><C-n>:call DWM_GrowMaster()<CR>

nmap <silent> <F7> :exec DWM_Close()<CR>
tmap <silent> <F7> <C-\><C-n>:exec DWM_Close()<CR>

nmap <silent> <F10> :call DeleteWindow()<CR>
tmap <silent> <F10> <C-\><C-n>:call DeleteWindow()<CR>

nmap <silent> <F8> :call DWM_New()<bar>:terminal<CR>
tmap <silent> <F8> <C-\><C-n>:call DWM_New()<bar>:terminal<CR>

nmap <silent> <F9> :call DWM_New()<CR>
tmap <silent> <F9> <C-\><C-n>:call DWM_New()<CR>

map <Space> :GFiles<CR>
map s :w<CR>
nmap gh :call LanguageClient_textDocument_hover()<CR>
nmap gd :call LanguageClient_textDocument_definition()<CR>
nmap gn :call LanguageClient_textDocument_rename()<CR>
nmap gr :call LanguageClient_textDocument_references()<CR>
nmap <silent> <Esc> :noh<CR>

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
autocmd BufWritePost * Neomake

let g:deoplete#file#enable_buffer_path = 1
let b:deoplete_ignore_sources = ['buffer', 'neco-syntax']
let g:deoplete#enable_at_startup = 1

set fillchars+=vert:│

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap c <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_map_keys = 0

" Leaving and entering terminal window
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

if (has("termguicolors") || has("vimr"))
 set termguicolors
endif

autocmd ColorScheme * hi Comment gui=italic
autocmd ColorScheme * hi VertSplit guibg=bg guifg=#091f2e
autocmd ColorScheme * hi EndOfBuffer guifg=#0c1014
" Unsetting the background color can have serious performance benefits
autocmd ColorScheme * hi Normal guibg=None ctermbg=None
colorscheme gotham
let g:enable_bold_font = 1
set completeopt-=preview

function! s:getMruBuffers()
    return filter(g:mruBuffers, 'bufexists(v:val)&&buflisted(v:val)')
endfunction

function! s:getMruFileBuffers()
    return filter(deepcopy(s:getMruBuffers()), 'len(v:val) > 6 && v:val[:6] != "term://"')
endfunction

function! s:getMruTerminalBuffers()
    return filter(deepcopy(s:getMruBuffers()), 'len(v:val) > 6 && v:val[:6] == "term://"')
endfunction

function! DeleteWindow()
    let currentBufferNr = bufnr('%')
    let l:mruBuffers = s:getMruBuffers()
    if len(l:mruBuffers) > 1
        exec 'buffer '. l:mruBuffers[1]
    else
        exec 'Startify'
    endif
    " exec DWM_Close()
    exec 'bd! ' . currentBufferNr
endfunction

function! s:getCommonPath(paths)
    if len(a:paths) < 2
        return ''
    endif
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

autocmd! User FzfStatusLine setlocal statusline=\ 

function! AddBuffer()
    let currentBuffer = expand('%:p')
    let g:mruBuffers = filter(g:mruBuffers, 'currentBuffer!=v:val&&bufexists(v:val)&&buflisted(v:val)')
    if strlen(currentBuffer) > 0 && bufexists(currentBuffer)
        let g:mruBuffers = [currentBuffer] + g:mruBuffers
    endif
endfunction

function! s:bufopen(e)
  execute 'buffer' split(a:e, '\t')[0]
endfunction

function! OpenBufferSelection()
    let l:mruBuffers = s:getMruBuffers()
    if len(l:mruBuffers) == 0
        echo 'No open buffers'
        return
    endif
    let files = map(s:getMruFileBuffers(), 'buffer_number(v:val)."\t".WebDevIconsGetFileTypeSymbol(v:val)." ".v:val')

    if len(files) > 1
        let files = files[1:] + [files[0]]
    endif

    let terminals = map(s:getMruTerminalBuffers(), 'buffer_number(v:val)."\t  ".split(getbufvar(v:val, "term_title"), ",")[0]')
    let common = s:getCommonPath(files)
    let commonLength = strlen(common) > 0 ? strlen(common) + 2 : 0
    let buffers = map(files, 'strpart(v:val, commonLength)') + terminals
    call fzf#run({'source': buffers, 'sink': function('s:bufopen'), 'down': len(buffers)+3})
endfunction

autocmd BufAdd,BufEnter,BufDelete,TermOpen  * :call AddBuffer()
command! -bang -nargs=* MyBuffers call OpenBufferSelection()

autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no

" Statusline
function! FilenameOrTerm()
  return exists('b:term_title') ? split(b:term_title, ',')[0] : expand('%:p:h:t') . '/' . expand('%:t')
endfunction

function! GitInfo()
    if exists('b:term_title')
        let title = split(b:term_title, ',')
        if len(title) < 2
            return ''
        endif
        let git = title[-1]
    else
        let git = fugitive#head()
    endif
    return git != '' ? ' '.git : ''
endfunction

set statusline=\ %{WebDevIconsGetFileTypeSymbol()}\ %{FilenameOrTerm()}\ %=%{GitInfo()}

autocmd BufWinEnter,WinEnter * setlocal scrolloff=999999
autocmd TermOpen,BufWinEnter,WinEnter term://* setlocal nonumber norelativenumber signcolumn=no scrolloff=0 scrollback=100000 | startinsert
