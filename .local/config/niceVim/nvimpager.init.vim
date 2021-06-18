"======================================================================
"
" init.vim - initialize config
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 18:26:34
"
"======================================================================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
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


"----------------------------------------------------------------------
" 模块加载
"----------------------------------------------------------------------

" 修改iskeyword, verbose判断谁修改了
LoadScript init/init-basic.vim
" LoadScript init/init-config.vim
" LoadScript init/init-style.vim

call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))
    " LoadScript init/enhance-basic.vim
    " LoadScript init/enhance-search.vim
    " LoadScript init/enhance-ui.vim
    Plug 'sheerun/vim-polyglot'
    Plug 'joshdick/onedark.vim'
    LoadScript init/enhance-markdown.vim
    " LoadScript init/ycm.vim
    " LoadScript init/gutentags.vim
    " LoadScript init/special.vim
    " LoadScript init/leaderf.vim


call plug#end()

" LoadScript init/keymaps-for-basic.vim

" colorscheme xcodedark
colorscheme onedark
" colorscheme edge
