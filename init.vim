let g:dwm_map_keys = 0
let g:mruBuffers = get(g:, 'mruBuffers', [])
let g:fzf_buffers_jump = 1
let g:python3_host_prog = '/Users/tbo/.pyenv/versions/py3neovim/bin/python'
autocmd!
call plug#begin('~/.nvim/plugged')

" Defaults defined by tpope

Plug 'tpope/vim-sensible'

" General Purpose

Plug 'tomtom/tcomment_vim'
Plug 'vim-scripts/fugitive.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'michaeljsmith/vim-indent-object'

" User interface

Plug 'spolu/dwm.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'

" Syntax & completion

Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'idanarye/vim-vebugger', {'branch': 'develop'}

Plug 'jparise/vim-graphql' 
" Plug 'styled-components/vim-styled-components', {'branch': 'main'}
"
Plug 'artur-shaik/vim-javacomplete2'
" Helpers

Plug 'simnalamburt/vim-mundo'
Plug 'PeterRincker/vim-argumentative'

" Color Themes
Plug 'chriskempson/base16-vim'
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
" No syntax highlighting beyond 500 columns
set synmaxcol=500
syntax sync minlines=500
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
set updatetime=100
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
set concealcursor=
set conceallevel=2
set noautoread

let g:coc_auto_copen = 0
" Increase terminal scroll back size
let g:terminal_scrollback_buffer_size = 10000
let g:startify_change_to_dir = 0
syntax enable

" Key bindings
nmap ; :
map f :MyBuffers<CR>

" Use ESC to switch to normal mode in terminals except in fzf
autocmd FileType fzf tnoremap <buffer> <ESC> <C-g>
autocmd TermOpen term://* tmap <buffer> <ESC> <C-\><C-n>
autocmd TermOpen term://* tnoremap <buffer> <ESC-e> <nop>
autocmd User CocQuickfixChange :call fzf_quickfix#run()

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
tmap <c-x> <C-\><C-n>:terminal<CR>

nmap <silent> <F8> :call DWM_New()<bar>:terminal<CR>
tmap <silent> <F8> <C-\><C-n>:call DWM_New()<bar>:terminal<CR>

nmap <silent> <F9> :call DWM_New()<CR>
tmap <silent> <F9> <C-\><C-n>:call DWM_New()<CR>

map <Space> :GFiles<CR>
nmap s :w<CR>
nnoremap gk <C-i>
nnoremap gj <C-O>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap for rename current word
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> ga <Plug>(coc-codeaction-selected)

" Show signature help while editing
autocmd CursorHoldI * silent! call CocAction('showSignatureHelp')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gq  <Plug>(coc-codeaction)

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Remap for format selected region
vmap f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
vmap ga :CocCommand<CR>
nmap ga  <Plug>(coc-codeaction)
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

nmap gu :GitGutterUndoHunk<CR>
nmap <silent> <Esc> :noh<CR>

let g:deoplete#file#enable_buffer_path = 1
let g:deoplete_ignore_sources = ['buffer', 'neco-syntax', 'cwd']
let g:deoplete#enable_at_startup = 1

set fillchars+=vert:│,eob:\ 

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/ultisnips', 'UltiSnips']

let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap c <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'
let g:gitgutter_map_keys = 0

if (has("termguicolors") || has("vimr"))
 set termguicolors
endif

augroup inactive_win
    au!
    au ColorScheme * hi link MyInactiveWin ColorColumn | hi link MyNormalWin Normal
    au FileType,BufWinEnter * set winhighlight=NormalNC:MyInactiveWin
    au FocusGained * hi link MyNormalWin Normal
    au FocusLost * hi link MyNormalWin MyInactiveWin
augroup END

autocmd ColorScheme * hi Comment gui=italic
autocmd ColorScheme * hi VertSplit guibg=bg
autocmd ColorScheme * hi TermCursorNC guibg=fg

colorscheme gotham
let g:enable_bold_font = 1
let g:vebugger_use_tags = 1
set completeopt-=preview
set completeopt=noinsert,menuone,noselect

" Leaving and entering terminal window
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
autocmd WinEnter,BufAdd,BufEnter,BufDelete,TermOpen,WinLeave * :call AddBuffer()
autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
autocmd BufWinEnter,WinEnter * setlocal scrolloff=999999 conceallevel=2
autocmd TermOpen,BufWinEnter,WinEnter term://* setlocal concealcursor= conceallevel=0 nonumber norelativenumber signcolumn=no scrolloff=0 scrollback=100000 | startinsert | call timer_start(60, 'RedrawStatusline', {'repeat': -1}) | call FixWindow()
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
autocmd! User FzfStatusLine setlocal statusline=\ 
highlight link CocErrorSign ErrorMsg
highlight link CocWarningSign WarningMsg
highlight link CocInfoSign CursorColumn
highlight link CocHintSign CursorColumn
command! -bang -nargs=* CleanUpBuffers call CleanUpBuffers()
command! -bang -nargs=* MyBuffers call OpenBufferSelection()
command! -bang -nargs=* Bl echo expand('%:p:h')
command! -bang -nargs=* LC execute "LanguageClientStop"|LanguageClientStart
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4.. --preview-window up:40% --preview "''/Users/tbo/.nvim/plugged/fzf.vim/bin/preview.rb''"\ \{\}', 'dir': systemlist('git rev-parse --show-toplevel')[0], 'down': '50%'}, <bang>0)

function! s:getMruBuffers()
    return filter(g:mruBuffers, 'bufexists(v:val)&&buflisted(bufnr(v:val))')
endfunction

function! IsTerminalBuffer(name)
    return getbufvar(a:name, '&buftype') == 'terminal'
endfunction

function! s:getMruFileBuffers()
    return filter(deepcopy(s:getMruBuffers()), '!IsTerminalBuffer(v:val)')
endfunction

function! s:getMruTerminalBuffers()
    return filter(deepcopy(s:getMruBuffers()), 'IsTerminalBuffer(v:val)')
endfunction

function! s:getFileBuffers()
    return filter(filter(range(1,bufnr('$')), 'buflisted(v:val)'), '!IsTerminalBuffer(bufname(v:val))')
endfunction

function! FocusFileWindow()
    let fileWindows = s:getFileWindows()
    if len(fileWindows) > 0
        exe fileWindows[0] . "wincmd w" 
    else
        call DWM_New()
    endif
endfunction

function! s:getFileWindows()
    return filter(range(1, winnr('$')), '!IsTerminalBuffer(bufname(winbufnr(v:val)))')
endfunction

function! DeleteWindow()
    let currentBufferNr = bufnr('%')
    let currentBuffer = expand('%:p')
    let l:mruBuffers = s:getMruBuffers()
    let l:mruFileBuffers = s:getMruFileBuffers()
    if IsTerminalBuffer(currentBuffer) || getbufvar(currentBuffer, '&buftype') == 'nofile' || len(s:getFileWindows()) > 1
        exec DWM_Close()
    elseif len(l:mruFileBuffers) > 1
        exec 'buffer '. l:mruFileBuffers[1]
    else 
        exec 'Startify'
    endif
    exec 'silent! bd! ' . currentBufferNr
endfunction


function! CleanUpBuffers()
    let l:mruBuffers = s:getFileBuffers()
    exec 'bd! ' . join(l:mruBuffers, ' ')
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

function! AddBuffer()
    let currentBuffer = expand('%:p')

    let g:mruBuffers = filter(g:mruBuffers, 'currentBuffer!=v:val&&bufexists(v:val)&&buflisted(bufnr(v:val))')
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

    let terminals = map(filter(s:getMruTerminalBuffers(), 'bufwinnr(buffer_number(v:val)) == -1'), 'buffer_number(v:val)."\t  ".split(getbufvar(v:val, "term_title"), ",")[0]')
    let common = s:getCommonPath(files)
    let commonLength = strlen(common) > 0 ? strlen(common) + 2 : 0
    let buffers = map(files, 'strpart(v:val, commonLength)') + terminals
    call fzf#run({'source': buffers, 'sink': function('s:bufopen'), 'down': len(buffers)+3})
endfunction

" Statusline
function! FilenameOrTerm()
    return exists('b:term_title') ? get(split(b:term_title, ','), 0, 'unknown') : expand('%:p:h:t') . '/' . expand('%:t')
endfunction

function! RedrawStatusline(timer)
	execute 'redrawstatus'
    if !exists('b:term_title')
        let noop = timer_stop(a:timer)
    endif 
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

function! FixWindow()
    execute "res -1 | res +1"
endfunction
syntax match jsArrowFunction "=>" conceal cchar=⇒
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
map gu :call SynStack()<CR>
" let g:coc_force_debug = 1
