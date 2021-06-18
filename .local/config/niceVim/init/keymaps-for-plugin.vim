"==================================================================
" Title: 文件/文本检索
"==================================================================


"|GFiles [OPTS]|Git files (git ls-files)|
"|GFiles?|Git files (git status)|
if has('win32')
nnoremap <silent> <Space>f :LeaderfFile<CR>
nnoremap <silent> <Space>b :LeaderfBuffer<CR>
else
nnoremap <silent> <space>f :<C-u>FzfPreviewGitFiles<CR>
nnoremap <silent> <Space>b :<C-u>FzfPreviewAllBuffers<CR>
endif
cnoremap <silent> h<Space> LeaderfHelp<CR>
" cnoremap <silent> : LeaderfCommand<CR>
nnoremap <silent> <c-n> :LeaderfMru<cr>

nnoremap <silent> <m-/> :LeaderfLine<CR>
nnoremap <silent> <m-?> :LeaderfLineAll<CR>


noremap <m-*> :<C-U><C-R>=printf("Leaderf rg --bottom --stayOpen %s ", expand("<cword>"))<CR><CR>
command! -nargs=* Rg :Leaderf rg --bottom --stayOpen <args>

"==================================================================
" Title: 定义、引用、符号
"==================================================================


nnoremap <c-p> :LeaderfFile<cr>
nnoremap <m-m> :LeaderfFunction<cr>
nnoremap <m-p> :LeaderfBufTag<cr>
nnoremap <m-P> :Leaderf gtags<cr>

nnoremap <silent> <m-up> :cp<CR>
nnoremap <silent> <m-down> :cn<CR>

autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
autocmd FileType qf nnoremap <silent><buffer> <Enter> :PreviewClose<cr><CR>
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>

inoremap <F3> <c-\><c-o>:PreviewTag<cr>
noremap <F3> :PreviewTag<cr>
noremap <F4> :PreviewGoto tabe<cr>
" 函数参数
"noremap <F4> :PreviewSignature!<cr>
"inoremap <F4> <c-\><c-o>:PreviewSignature!<cr>


"激活补全
if !has('win32')
    inoremap <silent><expr> <c-n> coc#refresh()
endif
function! GoDefinition()
    if index(['python', 'go', 'vim'], &ft) >= 0
        exec "call CocAction('jumpDefinition')"
    else
        exec 'Leaderf gtags -d '.expand("<cword>").' --auto-jump --nowrap'
    endif
endfunc
function! GoReferences()
    if index(['python', 'go', 'vim'], &ft) >= 0
        exec "call CocAction('jumpReferences')"
    else
        exec 'Leaderf gtags -r '.expand("<cword>").' --auto-jump --nowrap'
    endif
endfunc

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
noremap <F9> :<C-U>Leaderf --recall<CR>

nmap <silent> gd :call GoDefinition()<CR>
nmap <silent> gr :call GoReferences()<CR>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)

" Note: 查询当前文本符号
" noremap <silent> <space>gt :GscopeFind t <C-R><C-W><cr>
" noremap <silent> <space>ge :GscopeFind e <C-R><C-W><cr>

" Note: 查询当前文件
" noremap <silent> <space>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <space>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>

"==================================================================
" Title: Coc修改意见，格式化，改名，函数文档
"==================================================================


" vmap <silent> <m-cr> :<C-u>silent! execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <m-cr> :<C-u>silent! execute 'CocCommand actions.open ' <CR>
nmap <silent> <m-\> <Plug>(coc-codeaction)
nmap <silent> <m-cr> <Plug>(coc-fix-current)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Rename  <Plug>(coc-rename)

vmap <m-space>  <Plug>(coc-format-selected)
nmap <m-space>  <Plug>(coc-format-selected)ap

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"nnoremap <silent> <m-K> :PreviewTag<cr>

function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  if (index(['c', 'cpp'], &filetype) >= 0)
    " execute 'PreviewSignature'
  else
    call CocActionAsync('doHover')
    " call CocAction('doHover')
  endif
endfunction
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"==================================================================
" Title: 其他窗口/菜单
"==================================================================

" NOTE: 保证离开时保存并且删除buffer
autocmd WinLeave *.todo silent! exec "update"
autocmd WinEnter *.todo silent! exec "e %"
function! TodoToggle()
    if bufexists(g:todo_filepath)
		if bufname('%') == g:todo_filepath
            silent! exec "exit"
        endif
        silent! exec "bwipeout " . g:todo_filepath
    else
        exec ":vsplit " . g:todo_filepath
    endif
endfunc
noremap <silent><m-7> <ESC>:<C-U>call TodoToggle()<CR>

" noremap <silent><m-8> :call quickmenu#toggle(3)<cr>
noremap <silent><m-9> :call quickmenu#toggle(0)<cr>
noremap <silent><m-0> :call quickmenu#toggle(1)<cr>


noremap <silent> <M-1> :call sidebar#toggle('coc-explorer')<CR>
noremap <silent> <M-2> :call sidebar#toggle('vista')<CR>
noremap <silent> <M-3> :call sidebar#toggle('undotree')<CR>

noremap <space>nn :NERDTree<cr>
noremap <space>no :NERDTreeFocus<cr>
noremap <space>nm :NERDTreeMirror<cr>
noremap <space>nt :NERDTreeToggle<cr>


"==================================================================
" Title: Todo中快捷键
"==================================================================


" MAPPINGS
autocmd Filetype todo inoremap <buffer> <Tab> 
autocmd Filetype todo inoremap <buffer> <S-Tab> 
" 编辑下一行
autocmd Filetype todo inoremap <buffer> <Enter> <ESC>:call NewTask(1)<cr>
autocmd Filetype todo nnoremap <buffer> o :call NewTask(1)<cr>
autocmd Filetype todo nnoremap <buffer> O :call NewTask(-1)<cr>
autocmd Filetype todo nnoremap <buffer> <Enter> :call TaskComplete()<cr>j
autocmd Filetype todo nnoremap <buffer> <BS> :call TaskCancel()<cr>j
autocmd Filetype todo nnoremap <buffer> <C-l> m6:call TasksArchive()<cr>'6

autocmd Filetype todo nnoremap <buffer> * :call TaskStar()<cr>
autocmd Filetype todo nnoremap <buffer> <C-j> /:\s*$<cr>:<C-u>set nohlsearch<cr>
autocmd Filetype todo nnoremap <buffer> <C-k> ?:\s*$<cr>:<C-u>set nohlsearch<cr>

"setlocal foldlevel=2        " 设置折叠层数为
" 用空格键来开关折叠
autocmd Filetype todo nnoremap <buffer> ; @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>






"==================================================================
" Title: 增强功能
"==================================================================

nnoremap <m-;> :Commands<CR>
nnoremap <m-:> :CocCommand<CR>
nnoremap <silent> <m-y>  :<C-u>CocList -A yank<cr>
nnoremap <silent> <m-M>  :Maps<cr>
nnoremap mm :Marks<CR>
":Colors	Color schemes

":History:	Command history
cnoremap <c-f>: <ESC>:History:<CR>
":History/	Search history
cnoremap <c-f>/ <ESC>:History/<CR>

"fzf或者内置终端可以使用<C-\><C-n>回到norm模式，进行拷贝等操作
"


"==================================================================
" Title: 其他映射
"==================================================================


" 使用 <space>ha 清除 errormarker 标注的错误
noremap <silent><space>ha :RemoveErrorMarkers<cr>

let g:quiet_mode = 0
function! QuietMode() abort
    if g:quiet_mode == 0
        exec "SignifyDisable"
        exec "Goyo"
    else
        exec "SignifyEnable"
        exec "Goyo"
    endif
    let g:quiet_mode = !g:quiet_mode
endfunction
nnoremap <silent> <buffer> <F12> :call QuietMode()<CR>

" 不同模式下Ctrl-t对齐
nnoremap <C-t> :<C-U><C-R>=printf("Tabularize /\|")<CR><CR>
vnoremap <C-t> "ry:Tabularize /r

 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
nmap <C-f> <Plug>(easymotion-overwin-f2)

command! -nargs=0 TranslatePopup CocCommand translator.popup
command! -nargs=0 Translate CocCommand translator.echo
command! -nargs=0 Dict CocList translators


"==================================================================
" Title: 终端快捷键
"==================================================================

let g:terminal_default_mapping = 0
" 如果不行的话注明原因: 导致fzf不能通过c-[退出
" tnoremap <c-[> <c-\><c-n>
tnoremap <m-q> <c-\><c-n>
tnoremap <m-'> <c-\><c-n>"0pa

nnoremap <silent> <m-=> :call TerminalToggle()<cr>
tnoremap <silent> <m-=> <c-\><c-n>:call TerminalToggle()<cr>

nnoremap <silent> <space>r :AsyncTask file-run<cr>
nnoremap <silent> <space>d :DogeGenerate<cr>

function! GoDiff()
    silent! normal $gf
    silent! execute "Gvdiffsplit"
    silent! wincmd l
endfunc
autocmd FileType fugitive  noremap <silent><buffer> dd :call GoDiff()<CR>

nnoremap ]a :ALENext<CR>
nnoremap [a :ALEPrevious<CR>
nnoremap <C-Up> :Leaderf --previous<CR>
nnoremap <C-Down> :Leaderf --next<CR>
nnoremap <C-Left> :Leaderf --recall<CR>
noremap <C-Right> <ESC>

vnoremap D :norm 
vnoremap Q :norm @q<CR>
