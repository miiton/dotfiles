" ============================================================================
" Common Settings
" ============================================================================
set background=dark
colorscheme Tomorrow-Night-Eighties
syntax on
set number
set nowrap
set textwidth=0
set shiftwidth=4
set tabstop=4
set expandtab
set hlsearch
set visualbell t_vb=
set nobackup
set nowritebackup
set noswapfile
set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,cp932,utf-16,utf-16le,iso-2022-jp,euc-jp,default,latin
set nocompatible
set cursorline
set cursorcolumn
set autoread
set virtualedit=block " 矩形選択のモード
set formatoptions+=mM
set shellslash        " Windowsでもパスを/で扱えるように
set laststatus=2
set showtabline=2     " タブバーを常に表示
set matchpairs& matchpairs+=<:>
set matchtime=3
set relativenumber
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set foldmethod=syntax
set foldlevel=5
set scrolloff=8
set undofile
set undodir=~/.vimundo
set grepprg=jvgrep
set cmdheight=2
set splitright

" ============================================================================
" Plugins
" ============================================================================

source $VIMRUNTIME/macros/matchit.vim

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    if has('win32') || has('win64')
        set runtimepath+=~/vimfiles/bundle/neobundle.vim/
    else 
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
endif

if has('win32') || has('win64')
    call neobundle#begin(expand('~/vimfiles/bundle'))
else
    call neobundle#begin(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" -------------------------------------
" Themes
" -------------------------------------
NeoBundle 'miiton/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'sjl/badwolf'
NeoBundle 'BusyBee'
NeoBundle 'morhetz/gruvbox'

" -------------------------------------
" Bundles
" -------------------------------------
NeoBundle 'Shougo/vimproc', {
            \ 'build': {
            \   'windows'   : 'make -f make_mingw32.mak',
            \   'cygwin'    : 'make -f make_cygwin.mak',
            \   'mac'       : 'make -f make_mac.mak',
            \   'unix'      : 'make -f make_unix.mak',
            \ }}
NeoBundle 'Align'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'fuenor/qfixhowm'
NeoBundle 'gregsexton/gitv'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'koron/minimap-vim'
NeoBundle 'lambdalisue/vim-python-virtualenv'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'motemen/git-vim'
NeoBundle 'msanders/cocoa.vim'
NeoBundle 'osyo-manga/unite-qfixhowm'
NeoBundle 'pekepeke/titanium-vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'


NeoBundleLazy 'vim-scripts/VOoM',{'autoload':{'commands':['Voom']}}
NeoBundleLazy 'majutsushi/tagbar',{'autoload':{'commands':['Tagbar','TagbarToggle']}}
NeoBundleLazy 'Shougo/neocomplete.vim', { 'autoload': {'insert': 1}}
NeoBundleLazy 'Shougo/neosnippet.vim', { 'autoload': {'insert': 1}}
NeoBundleLazy 'Shougo/neosnippet-snippets', { 'autoload': {'insert': 1}}
NeoBundleLazy 'sjl/gundo.vim', { 'autoload': {'commands': ['GundoToggle']}}
NeoBundleLazy 'mattn/emmet-vim', { 'autoload': {'filetypes': ['html']}}
NeoBundleLazy 'mattn/sonictemplate-vim',{'autoload':{'commands':['Template']}}
NeoBundleLazy 'JavaScript-syntax',{'autoload':{'filetypes':['javascript']}}
NeoBundleLazy '2072/PHP-Indenting-for-VIm', {'autoload':{'filetypes':['php']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script',{'autoload':{'filetypes':['coffee']}}
NeoBundleLazy 'nvie/vim-flake8',{'autoload':{'filetypes':['python']}}
NeoBundleLazy 'hynek/vim-python-pep8-indent',{'autoload':{'filetypes':['python']}}
NeoBundleLazy 'rcmdnk/vim-markdown',{'autoload':{'filetypes':['mkd','markdown','md']}}
NeoBundleLazy 'miiton/vim-ps1','v5',{'autoload':{'filetypes':['ps1']}}
NeoBundleLazy 'phaubos/vim-mql4',{'autoload':{'filetypes':['mql4']}}
" NeoBundleLazy 'google/vim-ft-go',{'autoload':{'filetypes':['go']}}
NeoBundleLazy 'vim-jp/vim-go-extra',{'autoload':{'filetypes':['go']}}


NeoBundleLazy 'Shougo/vimshell',{
            \ 'depends' : 'Shougo/vimproc',
            \ 'autoload' : {
            \   'commands' : [{ 'name' : 'VimShell',
            \                   'complete' : 'customlist,vimshell#complete'},
            \                 'VimShellExecute', 'VimShellInteractive',
            \                 'VimShellTerminal', 'VimShellPop'],
            \   'mappings' : ['<Plug>(vimshell_']
            \ }}

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" ============================================================================
" Key maps
" ============================================================================

nnoremap <F4> :<C-u>setlocal relativenumber!<CR>
nmap <ESC><ESC> :nohlsearch<CR><ESC>
nmap <F2> :Unite buffer file file_mru<CR>
nmap <F3> :GundoToggle<CR>
nmap <CR> :<C-u>call append(expand('.'), '')<CR>j
nmap <silent> <Leader>P <Plug>ToggleProject
nmap <silent> <Leader>p :Project<CR>
nmap <F9> :VimFiler -split -explorer<CR>
nmap <F5> :vsp \| NeoSnippetEdit<CR>
nmap <F12> :Fontzoom +1<CR>
nmap <S-F12> :Fontzoom -1<CR>
nmap <C-F12> :Fontzoom!<CR>

" ============================================================================
" Key remaps
" ============================================================================

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" ============================================================================
" Debug Key Setting
" ============================================================================

if has('win32') || has('win64')
    au FileType python nmap <F8> :!timeit python %<CR>
else
    au FileType python nmap <F8> :!time python %<CR>
endif

" ============================================================================
" Startup
" ============================================================================
if getcwd() != $HOME
    if filereadable(getcwd(). '/.vimprojects')
        Project .vimprojects
    endif
endif

" ============================================================================
" My Customize
" ============================================================================

:let g:proj_flags = "imstc"
autocmd FileType python setlocal foldmethod=indent
autocmd FileType markdown setlocal shiftwidth=4
autocmd FileType markdown setlocal tabstop=4
autocmd BufNewFile,BufRead *.json setlocal ft=none
let g:markdown_quote_syntax_filetypes = {
            \ "ps1" : {
            \   "start" : "ps1",
            \},
            \ "r" : {
            \   "start" : "r",
            \},
            \ "go" : {
            \   "start" : "go",
            \},
            \ "vim" : {
            \   "start" : "vim",
            \},
            \ "sh" : {
            \   "start" : "sh",
            \},
            \}
set completeopt=menuone
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:Align_xstrlen = 3


" ============================================================================
" EasyMotion
" ============================================================================
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap s <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)

" ============================================================================
" QFixHowm
" ============================================================================

let howm_dir            = '~/Dropbox/vim/howm'
let howm_filename       = '~/Dropbox/vim/howm/%Y/%m/%Y-%m-%d_%H%M%S.md'
let howm_fileencoding   = 'utf-8'
let howm_fileformat     = 'unix'
let QFixMRU_Filename    = '~/Dropbox/vim/howm/.qfixmru'
let QFixHowm_FileType   = 'markdown'
let QFixHowm_Title      = '#'
let QFixHowm_Autoformat = 0
let QFixHowm_Folding    = 1

" ============================================================================
" lightline
" ============================================================================

let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'MyFugitive',
            \   'readonly': 'MyReadonly',
            \   'modified': 'MyModified',
            \   'filename': 'MyFilename'
            \ },
            \ 'separator': { 'left': '⮀', 'right': '⮂' },
            \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
            \ }

function! MyModified()
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

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "⭤"
    else
        return ""
    endif
endfunction

function! MyFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
    endif
    return ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

" ============================================================================
" neosnippet
" ============================================================================

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/Dropbox/vim/snippets'


" ============================================================================
" neocomplete
" ============================================================================

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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
    return neocomplete#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#enable_auto_close_preview = 0

" ============================================================================
" Unite
" ============================================================================
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
endif

" ============================================================================
" golang
" ============================================================================
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
