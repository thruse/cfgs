colorscheme koehler

if has('win32')
    set makeprg=build
elseif has('unix')
    set makeprg=./build
endif

set expandtab
set shiftwidth=4
set tabstop=4
set cinoptions=:0,=0,t0,(s

autocmd FileType * set formatoptions-=c
autocmd FileType * set formatoptions-=r
autocmd FileType * set formatoptions-=o

