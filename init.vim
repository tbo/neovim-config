let g:dwm_map_keys = 0
let g:mruBuffers = get(g:, 'mruBuffers', [])
let g:fzf_buffers_jump = 1
let g:coc_enable_locationlist = 0
let g:python3_host_prog = '/Users/tbo/.pyenv/versions/py3neovim/bin/python'
let g:polyglot_disabled = ['typescript', 'typescript.tsx', 'typescript.jsx', 'typescriptreact']
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

autocmd!
autocmd User CocLocationsChange CocList --normal location
call plug#begin('~/.nvim/plugged')

" " General Purpose
"
Plug 'tomtom/tcomment_vim'
Plug 'michaeljsmith/vim-indent-object'

" User interface

Plug 'spolu/dwm.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'
Plug 'tbo/notion'
" Plug 'wellle/context.vim'

" Syntax & completion

Plug 'editorconfig/editorconfig-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'
Plug 'ron-rs/ron.vim'
Plug 'jparise/vim-graphql' 
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}

" Helpers

Plug 'simnalamburt/vim-mundo'
Plug 'PeterRincker/vim-argumentative'

" Color Themes
Plug 'ryanoasis/vim-devicons'
Plug 'chriskempson/base16-vim'

" COC
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}, 'branch': 'release'}
Plug 'neoclide/coc-jest', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

" Options
" Indent defaults
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
" Highlights current line
set cursorline
set ignorecase
set smartcase
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
set mouse=a
" Center current line
set scrolloff=9999
" Do not wrap lines
set nowrap
" No syntax highlighting beyond 3000 columns
set synmaxcol=3000
syntax sync minlines=3000
" Highlight trailing whitespace
set listchars=tab:\ \ ,trail:·,extends:…,precedes:…
set list
" Share clipboard between vim and mac
set clipboard=unnamed
" Reduces visual noise
set noshowcmd
set noshowmode
set nolazyredraw
" Show sign column by default
set signcolumn=yes:2
set updatetime=120
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
set concealcursor=
set conceallevel=2
set noautoread
" Fold settings
set foldlevel=0
set foldmethod=syntax
set foldnestmax=1
set nofoldenable
" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 0

let g:matchparen_timeout = 10
let g:matchparen_insert_timeout = 10

let g:coc_auto_copen = 0
" Increase terminal scroll back size
let g:terminal_scrollback_buffer_size = 10000
let g:startify_change_to_dir = 0
syntax enable

let g:EditorConfig_max_line_indicator = "exceeding"
set noswapfile
set directory^=~/.nvim/swap/

" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.nvim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.nvim/undo//

" Key bindings
nmap ; :
map <silent> f :MyBuffers<CR>
nmap gv <Plug>(iced_eval)<Plug>(sexp_inner_element)``

" Avoids syntax issues
autocmd BufEnter * :syntax sync fromstart
" autocmd BufWritePost *.rs :silent execute "r !rustfmt %"

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

nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

nmap U :join<CR>
nmap J <C-D>
nmap K <C-U>
nmap S :IcedRequire<CR>

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap for rename current word
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> ga <Plug>(coc-codeaction-selected)

" Show signature help while editing
autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gq  <Plug>(coc-codeaction)

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Remap for format selected region
vmap f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
vmap ga :CocCommand<CR>
nmap ga  <Plug>(coc-codeaction)
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)

nmap gu :CocCommand git.chunkUndo<CR>
nmap <silent> <Esc> :noh<CR>

" set fillchars+=vert:▐,eob:\ 
set fillchars+=vert:\ ,eob:\ 

nmap <silent> F :NotionJump<CR>

set termguicolors

augroup inactive_win
    au!
    au ColorScheme * hi link MyInactiveWin ColorColumn | hi link MyNormalWin Normal
    au FileType,BufWinEnter * set winhighlight=NormalNC:MyInactiveWin
    au FocusGained * hi link MyNormalWin Normal
    au FocusLost * hi link MyNormalWin MyInactiveWin
augroup END

autocmd ColorScheme * hi Comment gui=italic
autocmd ColorScheme * hi TermCursorNC guibg=fg
autocmd ColorScheme * hi CocUnderline cterm=undercurl gui=undercurl

colorscheme gotham
let g:enable_bold_font = 1
set completeopt-=preview
set completeopt=noinsert,menuone,noselect

" Leaving and entering terminal window
autocmd FileType mail setlocal spell spelllang=en_us,de_de
autocmd BufLeave term://* stopinsert
autocmd BufEnter term://* startinsert
autocmd WinEnter,BufAdd,BufEnter,BufDelete,TermOpen,WinLeave * :call AddBuffer()
autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
autocmd BufWinEnter,WinEnter * setlocal scrolloff=999999 conceallevel=2
autocmd TermOpen,BufWinEnter,WinEnter term://* setlocal concealcursor= conceallevel=0 nonumber norelativenumber signcolumn=no scrolloff=0 scrollback=100000 | startinsert | call timer_start(300, 'RedrawStatusline', {'repeat': -1}) " | call FixWindow()
autocmd BufNewFile,BufRead *.jscad set filetype=javascript
autocmd! User FzfStatusLine setlocal statusline=\ 
autocmd FileType * set fo-=c fo-=r fo-=o
command! -bang -nargs=* ToggleCommentMode call ToggleCommentMode()
command! -bang -nargs=* CleanUpBuffers call CleanUpBuffers()
command! -bang -nargs=* Blame call Blame()
command! -bang -nargs=* MyBuffers call OpenBufferSelection()
command! -bang -nargs=* Bl echo expand('%:p:h')
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

function! Blame()
    echo b:coc_git_blame
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
    call fzf#run({'window': 'call FloatingFZF()', 'source': buffers, 'sink': function('s:bufopen'), 'down': len(buffers)+3})
endfunction

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
        let git = get(g:,'coc_git_status','')
    endif
    return git != '' ? ' '.git : ''
endfunction

function! ToggleCommentMode() 
  let [&fo, b:oldFo] = [get(b:, 'oldFo', 'actroqwnb'), &fo]
  let [&formatexpr, b:oldFormatExpr] = [get(b:, 'oldFormatExpr', ''), &formatexpr]
  let [&textwidth, b:oldTextWidth] = [get(b:, 'oldTextWidth', 80), &textwidth]
  set spell!
endfunction

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(15)
  let width = float2nr(120)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

set statusline=\ %{WebDevIconsGetFileTypeSymbol()}\ %{FilenameOrTerm()}\ %=%{GitInfo()}

" lua << EOF
" function GlobalLuaFunction()
"     vim.api.nvim_command("echo 'hello world'")
"     print "nvim-example-lua-plugin.luamodule.init GlobalLuaFunction: hello"
" end
" EOF
