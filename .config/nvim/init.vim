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
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
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
" Deoplete settings
" let g:python3_host_prog = '/home/t_minami/miniconda/envs/py3/bin/python'

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
" Use smartcase.
" let g:deoplete#enable_smart_case = 1
"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
"
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#mappings#close_popup() . "\<CR>"
" endfunction
"
" " deoplete-go
let g:deoplete#sources#go#align_class = 1
"
" let g:deoplete#omni#input_patterns = {}


" End Deoplete settings
" ============================================================================

" ============================================================================
" syntastic settings

let g:syntastic_markdown_checkers = ['textlint']
let g:syntastic_javascript_checkers = ['eslint']
" エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時にチェックを実行する
let g:syntastic_check_on_open = 1
" :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0

" End syntastic settings
" ============================================================================

" ============================================================================
" Golang settings

" let g:deoplete#omni#input_patterns.go = '\h\w\.\w*'
let g:deoplete#sources#go#align_class = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" let g:go_list_type = "quickfix"

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
        return "⭤"
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
let g:EditorConfig_exec_path = '/Users/t_minami/.pyenv/shims/editorconfig'
let g:EditorConfig_core_mode = 'external_command'
" End EditorConfig
" ============================================================================

" ============================================================================
" Javascript
let g:esformatter_autosave = 1
let g:javascript_plugin_jsdoc = 1
"
" End Javascript
" ============================================================================


set background=dark
" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid_material
