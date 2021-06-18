Plug 'ap/vim-css-color'
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
autocmd FileType vue,html,htmldjango,xml inoremap <silent> <buffer> <c-\>     <ESC>:call emmet#expandAbbr(3,"")<CR>i

" 少部分替换
nnoremap <silent> gn *Ncgn
" 可视模式选中之后gn, 之前重映射了*
vmap <silent> gn *Ncgn

" 可视模式@q直接执行宏，不用输入normal @了
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" 单独设置缩进为2
autocmd FileType vue,javascript,css setlocal et sta sw=2 sts=2
