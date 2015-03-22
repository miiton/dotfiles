set colorcolumn=80
set encoding=utf-8
set guioptions-=L "左スクロールバーを非表示
set guioptions-=T "メニューバーを非表示
set guioptions-=r "右スクロールバーを非表示
set guioptions-=e "タブバーをテキストモードに
set cmdheight=2
set linespace=2
if has('win32')
    set guifont=Cica:h11
    set columns=180
    set lines=50
    let howm_fileencoding   =   'utf-8'
    let howm_fileformat     =   'unix'
    if has('kaoriya')
        set ambiwidth=auto
    endif
elseif has('mac')
    set guifont=Cica:h16
    set columns=180
    set lines=35
    set transparency=0
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
endif

if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=Purple guifg=NONE
    set iminsert=0 imsearch=0
    if has('xim') && has('GUI_GTK')
    endif
    inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" Printer config

if has('printer')
    if has('win32')
        set printfont=Cica:h8
        set printoptions=left:6pc,right:6pc,number:y
        set printheader=%<%t%=\ %{&ff}\/%{&fileencoding}\ \|\ %N\ Page
    elseif has('mac')
        set printfont=Cica:h12
        set printoptions=left:6pc,right:6pc,number:y
        set printheader=%<%t%=\ %{&ff}\/%{&fileencoding}\ \|\ %N\ Page
    endif
endif


au InsertLeave * set imdisable
au InsertEnter * set noimdisable
colorscheme hybrid

