finish
" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
Plug 'skywind3000/vim-preview'
" 提供 ctags/gtags 后台数据库自动更新功能
Plug 'ludovicchabant/vim-gutentags', { 'for': ['c', 'cpp']  }
" 提供 GscopeFind 命令并自动处理好 gtags 数据库切换
Plug 'skywind3000/gutentags_plus', { 'for': ['c', 'cpp'] }


"==================================================================
" Title: 自动更新数据库(universal ctags && gtags)
"==================================================================

let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
let $GTAGSLABEL = 'native-pygments'

autocmd BufEnter *.c,*.cpp exec "let g:gutentags_enabled=1"
autocmd BufLeave *.c,*.cpp exec "let g:gutentags_enabled=0"

let g:gutentags_define_advanced_commands = 1 "启用更多功能
let g:gutentags_enabled = 0 " 使用GutentagsToggleEnable启用
let g:gutentags_dont_load = 0
let g:gutentags_plus_nomap = 1

" 设定项目目录标志：除了 .git/.svn 外，还有 .root 文件
let g:gutentags_project_root = ['.root']

" 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_exclude_filetypes = ['json', 'markdown', 'txt', 'vim']
" 默认禁用自动生成
let g:gutentags_modules = []

" 如果有 ctags 可执行就允许动态生成 ctags 文件
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif

" 如果有 gtags 可执行就允许动态生成 gtags 数据库
if executable('gtags') && executable('gtags-cscope')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 设置 ctags 的参数
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 使用 universal-ctags 的话需要下面这行，请反注释
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁止 gutentags 自动链接 gtags 数据库
let g:gutentags_auto_add_gtags_cscope = 1

let g:Lf_RootMarkers = ['.git', '.svn', '.root']
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_Gtagslabel = 'native-pygments'
