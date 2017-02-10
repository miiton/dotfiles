" ============================================================================
" Common Settings
" ============================================================================
syntax on
set number
set nowrap
set textwidth=0
set shiftwidth=4
set tabstop=4
set expandtab
set hlsearch
set nobackup
set visualbell t_vb=
set nowritebackup
set noswapfile
set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,cp932,utf-16,utf-16le,iso-2022-jp,euc-jp,default,latin
set cursorline
set cursorcolumn
set autoread
set virtualedit=block
set formatoptions+=mM
set shellslash
set laststatus=2
set showtabline=2
set matchpairs& matchpairs+=<:>
set matchtime=3
set relativenumber
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" set foldmethod=syntax
" set foldlevel=5
set scrolloff=8
set undofile
set undodir=~/.vimundo
set grepprg=jvgrep
set cmdheight=2
set splitright
set completeopt=menuone,noinsert
set breakindent
set termguicolors
set ambiwidth=single
set shell=/bin/bash " http://this.aereal.org/entry/2014/02/02/002254

" set pythonthreedll=/usr/local/Cellar/python3/3.6.0/Frameworks/Python.framework/Versions/3.6/Python

" ============================================================================
" dein.vim

if &compatible
  set nocompatible
endif

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.vim/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" End dein.vim
" ============================================================================

" ============================================================================
" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" End neocomplete
" ============================================================================

" ============================================================================
" Key maps

nmap <ESC><ESC> :nohlsearch<CR><ESC>
" Insert new line with <ENTER>
nmap <CR> :<C-u>call append(expand('.'), '')<CR>j
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" End Key maps
" ============================================================================

" ============================================================================
" enhanced diff : https://github.com/chrisbra/vim-diff-enhanced
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif
" End enhanced diff
" ============================================================================
"

" ============================================================================
" ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
" End ternjs settings
" ============================================================================

" ============================================================================
" neomake settings
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_error_sign = {'text': '>>', 'texthl': 'Error'}
let g:neomake_warning_sign = {'text': '>>',  'texthl': 'Todo'}
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']
let g:neomake_typescript_enabled_makers = ['tslint']
" End neomake settings
" ============================================================================

" ============================================================================
" Golang settings

let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
autocmd FileType gohtmltmpl let b:match_words = '<:>,<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'

" End Golang settings
" ============================================================================
" ============================================================================
" QFixHowm

let howm_dir            = '~/Dropbox/vim/howm'
let howm_filename       = '~/Dropbox/vim/howm/%Y/%m/%Y-%m-%d_%H%M%S.md'
let howm_fileencoding   = 'utf-8'
let howm_fileformat     = 'unix'
let QFixMRU_Filename    = '~/Dropbox/vim/howm/.qfixmru'
let QFixHowm_FileType   = 'markdown'
let QFixHowm_Title      = '#'
let QFixHowm_Autoformat = 0
let QFixHowm_Folding    = 1

" End QFixHowm
" ============================================================================

" ============================================================================
" lightline

let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ""
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ''._ : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" End lightline
" ============================================================================

" ============================================================================
" JSON
let g:vim_json_syntax_conceal = 0
" End JSON
" ============================================================================

" ============================================================================
" EditorConfig
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'
" End EditorConfig
" ============================================================================

" ============================================================================
" Javascript
let g:esformatter_autosave = 1
let g:javascript_plugin_jsdoc = 1

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
"
" End Javascript
" ============================================================================

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
hi link goSpecialString Character
colorscheme hybrid

