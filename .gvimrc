set colorcolumn=80
set guioptions-=L "左スクロールバーを非表示
set guioptions-=T "メニューバーを非表示
set guioptions-=r "右スクロールバーを非表示
set guioptions-=e "タブバーをテキストモードに
if has('win32') || has('win64')
    set guifont=Cica:h11
    set printfont=Cica:h8
    set columns=180
    set lines=50
    if has('kaoriya')
        set ambiwidth=auto
    endif
elseif has('mac')
    set guifont=Cica:h16
    set printfont=Cica:h12
    set columns=180
    set lines=45
    set transparency=0
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
endif

if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=Purple guifg=NONE
    set iminsert=0 imsearch=0
    inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" Printer config

set printoptions=left:6pc,right:6pc,number:y
set printheader=%<%t%=\ %{&ff}\/%{&fileencoding}\ \|\ %N\ Page

au InsertLeave * set imdisable
au InsertEnter * set noimdisable
colorscheme hybrid

