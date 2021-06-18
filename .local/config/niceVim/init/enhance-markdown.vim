" TODO:注释掉syntax目录才能正确高亮
" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" 数学公式支持
Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
" 中文文档美化
Plug 'hotoo/pangu.vim', { 'for': 'markdown' }
" 专注模式
Plug 'junegunn/goyo.vim'
" Plug 'amix/vim-zenroom2'
"autocmd! User goyo.vim echom 'Goyo is now loaded!'
" 代码块执行
" Plug 'gpanders/vim-medieval'

" Plug 'skywind3000/vim-auto-popmenu'
" Plug 'skywind3000/vim-dict'

" enable this plugin for filetypes, '*' for all files.
" let g:apc_enable_ft = {'*':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
" set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c
"
" 常用命令 Toc， TableFormat
" gx：在与标准gx命令相同的浏览器中打开光标下的链接。<Plug>Markdown_OpenUrlUnderCursor
" ge：打开Vim中光标下的链接进行编辑。对于相对降价链接很有用。<Plug>Markdown_EditUrlUnderCursor
" ]]：转到下一个标题。 <Plug>Markdown_MoveToNextHeader
" [[：转到上一个标题。对比]c。<Plug>Markdown_MoveToPreviousHeader
" ][：如果有的话，去下一个兄弟标题。 <Plug>Markdown_MoveToNextSiblingHeader
" []：如果有的话，转到上一个兄弟标题。 <Plug>Markdown_MoveToPreviousSiblingHeader
" ]c：转到当前标题。 <Plug>Markdown_MoveToCurHeader
" ]u：转到父标题（向上）。 <Plug>Markdown_MoveToParentHeader
"
" 自动生成Markdown目录， GenTocGFM


" 更改折叠方式，全部只占一行
"let g:vim_markdown_folding_style_pythonic=1
" 从二级标题开始折叠
let g:vim_markdown_folding_level = 9
" Toc的quickfix窗口大小自动调整
let g:vim_markdown_toc_autofit = 1
"语法隐藏，设置阅读时语法隐藏，编辑时不隐藏
set conceallevel=2
"设置代码块不隐藏
"let g:vim_markdown_conceal_code_blocks = 0
"设置不隐藏
"let g:vim_markdown_conceal = 0
"设置LateX公式不隐藏
let g:tex_conceal = ""
"数学公式高亮
let g:vim_markdown_math = 1
" 启用删除线
let g:vim_markdown_strikethrough = 1


" 不自启，自动刷新，自动关闭，命令只在md中有效
let g:mkdp_refresh_slow = 0
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_command_for_global = 0

"===============================================================
"    NOTE:  For Notes
"===============================================================
" 集成Enter，list快速进入文件，markdown快速运行代码
function! RunCode()
    .normal mb?```"ayy
    if match(@a,"cpp")>-1
        .normal VNkoj:w /tmp/tmp.cpp
        exec ":!clear;echo '<<===>>  Making  <<===>>';g++ -o /tmp/run%:t:r /tmp/tmp.cpp;rm /tmp/tmp.cpp;echo '<<===>>  Runing  <<===>>'; /tmp/run%:t:r"
    elseif match(@a,"python")>-1
        .normal VNkoj:w !python
    elseif match(@a,"lua")>-1
        .normal VNkoj:w !echo '<<<======================================>>>'&&lua
    elseif match(@a,"perl")>-1
        .normal VNkoj:w !perl
    elseif match(@a,"javascript")>-1  || match(@a,"JavaScript")>-1
        .normal VNkoj:w !node
    endif
    .normal `b:delmarks b
endfunc

"===============================================================
"    NOTE:  For Markdown
"===============================================================

"command! InstantMarkdownStop :!killall nodejs<CR>

" 可视模式输入C-l增加行号
" 改进：只在同等缩进的行添加行号
function! AddListNumber()
    let i = 1
    let spaceNum = match(getline("'<"), "\\S")
    exec "'<,'>g/^\\ \\{" .spaceNum. "\\}\\S/norm ^i=i. :let i+=1"
endfunc
function! AddListFlag()
    let spaceNum = match(getline("'<"), "\\S")
    exec "'<,'>g/^\\ \\{" .spaceNum. "\\}\\S/norm ^i- "
endfunc

function! SetTitle()
    .normal "yyy
    if match(@y,"#")>-1
        .normal I#
    else
        .normal I# 
    endif
endfunc


"    记录上一次的markdown笔记的目录
" autocmd BufEnter  * call RecordPath()
" function! RecordPath()
"     if match(expand("%:p"),'Notes') > -1
"         call writefile([expand("%:p")],expand("$HOME/.last-vim-list/last-note"))
"     endif
"     if match(expand("%:e"), 'md') > -1
"         call writefile([expand("%:p")],expand("$HOME/.last-vim-list/last-md"))
"     elseif match(expand("%:e"), 'py') > -1
"         call writefile([expand("%:p")],expand("$HOME/.last-vim-list/last-py"))
"     elseif match(expand("%:e"), 'cpp') > -1
"         call writefile([expand("%:p")],expand("$HOME/.last-vim-list/last-cpp"))
"     endif
" endfunc

let g:CodeLanguage = "python"
function! AddCodeFlag()
    " 如果同行则插入
    let curmode = visualmode()
    let top = getpos("'<")
    let bottom = getpos("'>")
    "echo ax .','. ay .' => '. bx.','. by
    if curmode ==# 'V' || top[1] < bottom[1]
        call append(getpos("'>")[1], "```")
        call append(getpos("'<")[1]-1, "```" . g:CodeLanguage)
    else
        exec "normal `>i`xp`<P"
    endif
endfunc

augroup pscbindings
    autocmd! pscbindings
    " autocmd FileType markdown nnoremap <buffer> <Enter> :call RunCode()<CR>
    autocmd FileType markdown nnoremap <silent> <buffer> <Enter> :MarkdownRunner<CR>
    autocmd FileType markdown vnoremap <buffer> <C-l>   <ESC>:call AddListNumber()<CR>
    autocmd FileType markdown vnoremap <buffer> <C-k>   <ESC>:call AddListFlag()<CR>
    autocmd FileType markdown nnoremap <buffer> <C-b>   I**<ESC>A**<ESC>
    autocmd FileType markdown vnoremap <buffer> c       <ESC>:call AddCodeFlag()<CR>
    autocmd FileType markdown nnoremap <buffer> #       :call SetTitle()<CR>
    "setlocal foldlevel=1        " 设置折叠层数为
    "autocmd FileType markdown nnoremap <buffer> ; @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
augroup end
