call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
" items containing tips, tips will display in the cmdline
call quickui#menu#install('&File', [
            \ [ 'Auto&Format', 'Autoformat', '使用AutoFormat格式化代码' ],
            \ [ '&Tab2Space', 'set ts=4|set expandtab|%retab!|%s/\s\+$//g','清理tab和行末空格' ],
            \ [ '&CRLF to LF', 'exec ":%s///gg"', '换行符转化' ],
            \ [ '-','' ],
            \ [ '&Save Session','SSave!', '保存会话' ],
            \ ])
call quickui#menu#install('&Development', [
            \ [ '&Apc', '', '词典补全'],
            \ [ '&Task', 'Leaderf --nowrap task', '任务列表' ],
            \ [ '&Execute', 'AsyncTask file-run', '执行代码' ],
            \ [ '&Switch H/S', 'echo "none"', '头文件切换' ],
            \ ])


function! EnableGutentags()
    exec ":GutentagsToggleEnabled"
    if g:gutentags_enabled == 1
        echom "已启用:gutentags"
    else
        echom "已禁用:gutentags"
    endif
endfunc
call quickui#menu#install('&Git' ,  [
            \ [ 'Git &add'       ,  'Gwrite'      ,  '增加到暂存区'],
            \ [ 'Git &diff'      ,  'Gvdiffsplit' ,  '文件对比' ],
            \ [ 'Git &read'      ,  'Gread'       ,  '恢复到最近的提交' ],
            \ [ 'Git &blame'     ,  'Gblame'      ,  '文件问责' ],
            \ [ 'Git &grep'      ,  'Ggrep'       ,  'Git文件搜索' ],
            \ [ 'Git &commit'    ,  'BCommits'    ,  '本文件相关的提交' ],
            \ [ 'Git l&og'       ,  'Gclog'       ,  '提交记录' ],
            \ [ '&Git'           ,  'G'           ,  'fugitive' ],
            \ ])
" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
            \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
            \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
            \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
            \ ['Set &Cursor Column %{&cursorcolumn? "Off":"On"}', 'set cursorcolumn!'],
            \ ['&Goyo', 'call QuietMode()', '专注模式'],
            \ ['Turn &Gutentags %{get(g:, "gutentags_enabled")==1? "Off":"On"}', 'EnableGutentags'],
            \ ['Toggle H&iPairs', 'HiPairsToggle'],
            \ ['Turn Task &Output %{g:asynctasks_term_pos=="right"? "Hide":"Right"}', 'call ToggleOutputPos()'],
            \ ['Task Output &Focus %{g:asynctasks_term_focus==1? "Off":"On"}', 'call ToggleOutputFocus()'],
            \ ])

function! ToggleOutputPos()
    if g:asynctasks_term_pos == "right"
        let g:asynctasks_term_pos = "hide"
    else
        let g:asynctasks_term_pos = "right"
    end
endfunc
function! ToggleOutputFocus()
    if g:asynctasks_term_focus == 1
        let g:asynctasks_term_focus = 0
    else
        let g:asynctasks_term_focus = 1
    end
endfunc

" register HELP menu with weight 10000
call quickui#menu#install('&Help', [
            \ ['&Dict', 'Dict', '词典'],
            \ ["&Cheatsheet", 'help index', ''],
            \ ['T&ips', 'help tips', ''],
            \ ['--',''],
            \ ["&Tutorial", 'help tutor', ''],
            \ ['&Quick Reference', 'help quickref', ''],
            \ ['&Summary', 'help summary', ''],
            \ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1
let g:quickui_border_style = 2
let g:quickui_color_scheme = 'papercol dark'
hi! QuickBG ctermfg=0 ctermbg=7 guifg=black guibg=gray
" hi! QuickSel cterm=bold ctermfg=0 ctermbg=2 gui=bold guibg=brown guifg=gray
" hi! QuickKey term=bold ctermfg=1 gui=bold guifg=#ff0000
" hi! QuickOff ctermfg=59 guifg=#75715e
" hi! QuickHelp ctermfg=247 guifg=#959173
" hit space twice to open menu
noremap <silent> <m-8> :call quickui#menu#open()<cr>
noremap <silent> <space><space> :call quickui#menu#open()<cr>

" command! -nargs=0 TranslatePopup CocCommand translator.popup
" command! -nargs=0 Translate CocCommand translator.echo
" command! -nargs=0 Dict CocList translators
" call CocAction('doHover')
let content = [
            \ ["&CocHover\tc"        ,  'call CocAction("doHover")' ],
            \ ["&Translate\tt"       ,  'CocCommand translator.popup'],
            \ ['-'],
            \ ["Find &Defintion\td"  ,  'call GoDefinition()' ],
            \ ["Find &References\tr" ,  'call GoReferences()'],
            \ ['-'],
            \ ["&Find in File\tf"     ,  'Leaderf line --cword' ],
            \ ["Ctrl&SF\ts"          ,  'CtrlSF '.expand("<cword>") ],
            \ ["R&g\tg"              ,  'Leaderf rg --cword' ],
            \ ]
" set cursor to the last position
let opts = {'index':g:quickui#context#cursor}
noremap K :call quickui#context#open(content, opts)<CR>
