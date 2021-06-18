"——————————————————————————————————————————————————————————————————
" Title: vim config
" Last Modified: 2020/03/31 18:26:34
"——————————————————————————————————————————————————————————————————

" 防止重复加载
if get(s:, 'loaded', 0) != 0
    " finish
else
    let s:loaded = 1
endif

" 取得本文件所在的目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
function! GetVimPath(path)
    let path = expand(s:home . '/' . a:path )
    return substitute(path, '\\', '/', 'g')
endfunc

" 定义一个命令用来加载文件
command! -nargs=1 LoadScript exec 'so '.s:home.'/'.'<args>'
" 将 vim-init 目录加入 runtimepath
exec 'set rtp+='.s:home
" 将 ~/.vim 目录加入 runtimepath (有时候 vim 不会自动帮你加入）
set rtp+=~/.vim


if has('win32')
    if has('nvim')
        au GUIEnter * simalt ~x
    else
        winpos 0 0
        set lines=103 columns=80
        au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 250)
    endif

    set guifont=SauceCodePro\ Nerd\ Font\ Mono:h12:cANSI:qDRAFT
    exec 'cd ' . fnameescape('E:/')
    set clipboard+=unnamed
    let g:todo_filepath='E:/my.todo'
else
    let g:todo_filepath='/media/Document/my.todo'
endif



"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 修改iskeyword, verbose判断谁修改了
LoadScript init/init-basic.vim
LoadScript init/init-config.vim
LoadScript init/init-style.vim

let g:TasksMarkerDone=''
let g:TasksMarkerCancelled=''
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))
    " Plug 'voldikss/vim-floaterm'
    LoadScript init/enhance-basic.vim
    LoadScript init/enhance-format.vim
    LoadScript init/enhance-search.vim
    LoadScript init/enhance-lint.vim
    LoadScript init/enhance-ui.vim
    " LoadScript init/enhance-markdown.vim

    " LoadScript init/enhance-symbol.vim
    " LoadScript init/coc.vim
    " LoadScript init/ycm.vim
    " LoadScript init/gutentags.vim
    "
    " LoadScript init/git.vim
    " LoadScript init/sidebar.vim
    Plug 'justinmk/vim-sneak'
    " Plug 'vim-latex/vim-latex' "ctrl-j有问题
    LoadScript init/special.vim
    LoadScript init/leaderf.vim
    " LoadScript init/gist.vim
    LoadScript init/tasks.vim
    " LoadScript init/web.vim
    " Plug 'liuchengxu/vim-which-key'
    Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}
call plug#end()

LoadScript init/keymaps-for-basic.vim
LoadScript init/keymaps-for-plugin.vim
LoadScript init/menu.vim

function! ChangeTheme()
    let scheme_arr=[
                \ 'onedark',
                \ 'OceanicNext',
                \ 'molokai',
                \ 'PaperColor',
                \ 'codedark',
                \ 'xcodedark',
                \ 'gruvbox',
                \ 'space_vim_theme',
                \ 'atom-dark-256'
                \ ]
    exec 'colorscheme ' . scheme_arr[rand()%len(scheme_arr)]
endfunc
command! -nargs=0 ChangeTheme call ChangeTheme()

if has('nvim')
    colorscheme xcodedark
else
    ChangeTheme
endif
"——————————————————————————————————————————————————————————————————
" Title: 去掉Signify的背景色
"——————————————————————————————————————————————————————————————————
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
