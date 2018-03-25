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
set ambiwidth=double
set shell=/bin/bash " http://this.aereal.org/entry/2014/02/02/002254
set splitbelow

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
" deoplete
let g:deoplete#enable_at_startup = 1
"
" End deoplete
" ============================================================================

" ============================================================================
" Key maps

nmap <ESC><ESC> :nohlsearch<CR><ESC>
" Insert new line with <ENTER>
"nmap <CR> :<C-u>call append(expand('.'), '')<CR>j
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
let g:go_snippet_case_type = "camelcase"
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
autocmd FileType gohtmltmpl let b:match_words = '<:>,<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_metalinter_disabled = ['errcheck']

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
            \             [ 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename',
            \   'filetype': 'LightLineFiletype',
            \   'fileformat': 'LightLineFileformat',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

"           \ 'separator': { 'left': '', 'right': '' },
"           \ 'subseparator': { 'left': '', 'right': '' }
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

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
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
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript.tsx' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'jsx',
\  },
\}
let g:flow#autoclose = 1
let g:jsx_ext_required = 0
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.jsx Neoformat
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.tsx Neoformat
autocmd FileType typescript setlocal formatprg=prettier\ --stdin\ --parser\ typescript
autocmd BufWritePre *.json Neoformat
autocmd FileType json setlocal formatprg=prettier\ --stdin\ --parser\ json
" Use formatprg when available
let g:neoformat_try_formatprg = 1
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_semicolon_import = 0
nmap <C-i> <Plug>(TsuquyomiImport)<CR>
"
" End Javascript
" ============================================================================

" ============================================================================
" Neosnippet

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/Dropbox/dev/snippets'

nmap <C-s> :NeoSnippetEdit -split -vertical<CR>

" End Neosnippet
" ============================================================================


" ============================================================================
" DevIcons

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vue'] = "41B883"
let g:NERDTreeExtensionHighlightColor['ts'] = "007ACC"
let g:NERDTreeExtensionHighlightColor['tsx'] = "61dafb"
let g:NERDTreeExtensionHighlightColor['jsx'] = "61dafb"

" End DevIcons
" ============================================================================

" ============================================================================
" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_use_migemo = 1
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$'
\ }


" End CtrlP
" ============================================================================

" ============================================================================
" NERDTree

nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeLimitedSyntax = 1

" End NERDTree
" ============================================================================

" ============================================================================
" CamelMotion

nmap <silent> w <Plug>CamelCaseMotion_w
nmap <silent> b <Plug>CamelCaseMotion_b
nmap <silent> e <Plug>CamelCaseMotion_e
nmap <silent> ge <Plug>CamelCaseMotion_ge


" End CamelMotion
" ============================================================================


" ============================================================================
" Markdown

autocmd FileType go :set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
let g:previm_custom_css_path = '~/.config/previm/styles.css'

" End Markdown
" ============================================================================

" Flow
" ============================================================================
let g:flow#autoclose = 1
let g:flow#timeout = 10

" ============================================================================

" ALE
" ============================================================================
let g:ale_linters = {
            \ 'html': ['HTMLHint'],
            \ 'go': ['gometalinter'],
            \ 'typescript': ['tslint'],
            \ 'javascript': [''],
\}

" ============================================================================

nmap <C-h> :s/<[^>]*>/\r&\r/g<CR>:g/^$/d<CR>

" let g:tsuquyomi_use_vimproc=1
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
hi link goSpecialString Character
colorscheme hybrid

