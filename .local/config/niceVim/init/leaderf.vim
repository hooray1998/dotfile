Plug 'Yggdroot/LeaderF'
Plug 'tamago324/LeaderF-filer'

"==================================================================
" Title: Leaderf文件查找
"==================================================================


" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_RootMarkers = ['.git', '.svn', '.root']
let g:Lf_MruMaxFile = 50
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 0,
        \ 'Function': 0,
        \ 'Line': 0,
        \ 'Colorscheme': 1,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PopupWidth = 0.75
let g:Lf_PopupHeight = 0.4
let g:Lf_PopupPosition = [ &lines * 1 / 2,  0]
let g:Lf_StlSeparator = { 'left': "", 'right': "" }

let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}
" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')

" 显示绝对路径
let g:Lf_ShowRelativePath = 1

let g:Lf_NoChdir = 1
" 隐藏帮助
let g:Lf_HideHelp = 1

" 模糊匹配忽略扩展名
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','tags','.tags']
            \ }

" MRU 文件忽略扩展名
let g:Lf_MruMaxFiles = 100
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll', 'tags', '.tags', '*.todo']
" let g:Lf_StlColorscheme = 'gruvbox_masterial'
" let g:Lf_PopupColorscheme = 'gruvbox_masterial'
" ui 定制
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

" 禁用 function/buftag 的预览功能，可以手动用 p 预览
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" 使用 ESC 键可以直接退出 leaderf 的 normal 模式
let g:Lf_NormalMap = {
            \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<cr>']],
            \ "Mru": [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<cr>']],
            \ "Tag": [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<cr>']],
            \ "BufTag": [["<ESC>", ':exec g:Lf_py "bufTagExplManager.quit()"<cr>']],
            \ "Function": [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<cr>']],
            \ }
" let g:Lf_CommandMap = {'<C-Up>': ['<C-U>'], '<C-Down>': ['<C-D>']}

