if !has('nvim') | finish | endif
" 快速文件搜索
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'
let g:fzf_preview_use_dev_icons=1
" 使用 :CtrlSF 命令进行模仿 sublime 的 grep
Plug 'dyng/ctrlsf.vim'
" ALT_+/- 用于按分隔符扩大缩小 v 选区
"==================================================================
" Title: fzf
"==================================================================

function! OpenFloatingWin()
    let height = &lines - 3
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)

    " 设置浮动窗口打开的位置，大小等。
    " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
    let opts = {
                \ 'relative': 'editor',
                \ 'row': height * 0.2,
                \ 'col': col,
                \ 'width': width ,
                \ 'height': height * 2 / 3
                \ }

    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, opts)

    " 设置浮动窗口高亮
    call setwinvar(win, '&winhl', 'Normal:Pmenu')

    setlocal
                \ buftype=nofile
                \ nobuflisted
                \ bufhidden=hide
                \ nonumber
                \ norelativenumber
                \ signcolumn=no
endfunction
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }


