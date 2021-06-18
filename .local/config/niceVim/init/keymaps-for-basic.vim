"======================================================================
"
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


autocmd BufNewFile *.cpp,*.c,*.py,*.sh,*.md exec ":call Settitle()"
function Settitle()
    if &filetype == 'sh'
        call setline(1,"\#!/usr/bin/env bash")
    elseif &filetype == 'python'
        call setline(1,"# -*- coding:utf-8 -*-")
    elseif &filetype == 'markdown'
        call setline(1, "# ".expand("%:t:r"))
    elseif &filetype == 'cpp'
        call setline(1, "\#include<bits/stdc++.h>")
        call setline(2, "using namespace std;")
    elseif &filetype == 'c'
        call setline(1, "#include<stdio.h>")
    else
        call setline(1, "filetype error")
    endif
    call append(line("$"), "")
    . normal G
endfunc
"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
nnoremap <C-e> <c-u>
nnoremap <C-j> <down>
nnoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" <space>+数字键 切换tab
"----------------------------------------------------------------------
noremap <silent><space>1 1gt<cr>
noremap <silent><space>2 2gt<cr>
noremap <silent><space>3 3gt<cr>
noremap <silent><space>4 4gt<cr>
noremap <silent><space>5 5gt<cr>
noremap <silent><space>6 6gt<cr>
noremap <silent><space>7 7gt<cr>
noremap <silent><space>8 8gt<cr>
noremap <silent><space>9 9gt<cr>
noremap <silent><space>0 10gt<cr>

"==================================================================
" Title: 连续切换buffer或tab
"==================================================================

noremap <silent> [j :bp<cr>
noremap <silent> ]j :bn<cr>
noremap <tab>c :tabnew \| Startify<cr>
noremap <tab>q :tabclose<cr>
" 进入新的buffer之后，为该buffer建立一个tab
noremap <tab>n mM:tabnew<cr>`M:delmarks M<cr>

" tab enhancement  替换之前的c-i/c-o
noremap <silent><tab> <nop>
noremap <silent><tab>f <c-i>
noremap <silent><tab>b <c-o>

noremap <tab>h <c-w>h
noremap <tab>j <c-w>j
noremap <tab>k <c-w>k
noremap <tab>l <c-w>l
noremap <tab>w <c-w>w

noremap <tab>+ <c-w>+
noremap <tab>- <c-w>-
noremap <tab>< <c-w><
noremap <tab>> <c-w>>
noremap <tab>= <c-w>=

noremap <tab>s <c-w>s
noremap <tab>v <c-w>v
noremap <tab>o <c-w>o
noremap <tab><tab> <c-w><c-w>

"----------------------------------------------------------------------
" TAB：创建，关闭，上一个，下一个，左移，右移
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
"----------------------------------------------------------------------

" 左移 tab
function! Tab_MoveLeft()
    let l:tabnr = tabpagenr() - 2
    if l:tabnr >= 0
        exec 'tabmove '.l:tabnr
    endif
endfunc

" 右移 tab
function! Tab_MoveRight()
    let l:tabnr = tabpagenr() + 1
    if l:tabnr <= tabpagenr('$')
        exec 'tabmove '.l:tabnr
    endif
endfunc

noremap <silent><m-left> :call Tab_MoveLeft()<cr>
noremap <silent><m-right> :call Tab_MoveRight()<cr>


"----------------------------------------------------------------------
" ALT 键移动增强
"----------------------------------------------------------------------

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
noremap <m-h> b
noremap <m-l> w
inoremap <m-h> <c-left>
inoremap <m-l> <c-right>

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转）
noremap <m-j> gj
noremap <m-k> gk
" inoremap <m-j> <c-\><c-o>gj
" inoremap <m-k> <c-\><c-o>gk

" 命令模式下的相同快捷
cnoremap <m-h> <c-left>
cnoremap <m-l> <c-right>


"----------------------------------------------------------------------
" 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
noremap <m-H> gT
noremap <m-L> gt
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc>gT
inoremap <m-L> <esc>gt
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
    " vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
    " 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
    " 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
    set termwinkey=<c-_>
    tnoremap <m-H> <c-_>h
    tnoremap <m-L> <c-_>l
    tnoremap <m-J> <c-_>j
    tnoremap <m-K> <c-_>k
    tnoremap <m-q> <c-\><c-n>
elseif has('nvim')
    " neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
    tnoremap <m-H> <c-\><c-n><c-w>h
    tnoremap <m-L> <c-\><c-n><c-w>l
    tnoremap <m-J> <c-\><c-n><c-w>j
    tnoremap <m-K> <c-\><c-n><c-w>k
    tnoremap <m-q> <c-\><c-n>
endif



"----------------------------------------------------------------------
" 编译运行 C/C++ 项目
" 详细见：http://www.skywind.me/blog/archives/2084
"----------------------------------------------------------------------

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1


nnoremap <space>e :exit<CR>
nnoremap <space>w :w<CR>
nnoremap <Space>W :w !sudo tee % > /dev/null <CR>
nmap L $
nmap H 0^
map L $
map H 0^
vnoremap L $h
vnoremap H 0^
"映射显示当前文件目录的快捷键"
if has('win32') || has('win64')
    cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'\' : '%%'
else
    cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
endif
"C-l 清除高亮
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>:cclose<CR><C-l>

"快捷复制粘贴至系统
nnoremap <C-a> mmggVG"+y`m<CR>
" 重定义*, 使其那能够搜索选中文本
xnoremap * : <C-u> call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # : <C-u> call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

cmap w!! w !sudo tee % > /dev/null <CR>

nnoremap <C-2> @@
nnoremap <space>p "+p
