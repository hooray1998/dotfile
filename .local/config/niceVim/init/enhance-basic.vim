    " 支持库，给其他插件用的函数库
    Plug 'xolox/vim-misc'
    " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
    Plug 'kshenoy/vim-signature'
    "Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind'] }
    "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'psliwka/vim-smoothie'
    Plug 'tpope/vim-eunuch'

    Plug 'Yggdroot/indentLine'

    if has('win32')
        " 文件浏览器，代替 netrw
        Plug 'justinmk/vim-dirvish'
    else
        nmap <silent> - :Leaderf filer --popup <C-R>=expand("%:p:h")<CR><CR>
    endif


    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    " 基础插件：提供让用户方便的自定义文本对象的接口
    Plug 'kana/vim-textobj-user'
    " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
    Plug 'kana/vim-textobj-indent'
    " 语法文本对象：iy/ay 基于语法的文本对象
    Plug 'kana/vim-textobj-syntax'
    " 函数文本对象：if/af 支持 c/c++/vim/java
    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
    " 参数文本对象：i,/a, 包括参数或者列表元素
    Plug 'sgur/vim-textobj-parameter'
    " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
    Plug 'bps/vim-textobj-python', {'for': 'python'}
    " 提供 uri/url 的文本对象，iu/au 表示
    Plug 'jceb/vim-textobj-uri'

    " powershell 脚本文件的语法高亮
    " Plug 'pprovost/vim-ps1', { 'for': 'ps1' }
    " lua 语法高亮增强
    " Plug 'tbastos/vim-lua', { 'for': 'lua' }
    " C++ 语法高亮增强，支持 11/14/17 标准
    Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
    Plug 'sheerun/vim-polyglot'
    " 额外语法文件
    " Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
    " python 语法文件增强
    " Plug 'vim-python/python-syntax', { 'for': ['python'] }
    " rust 语法增强
    " Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    " vim org-mode
    " Plug 'jceb/vim-orgmode', { 'for': 'org' }




"==================================================================
" Title: 文件管理器
"==================================================================

"----------------------------------------------------------------------
" Dirvish 设置：自动排序并隐藏文件，同时定位到相关文件
" 这个排序函数可以将目录排在前面，文件排在后面，并且按照字母顺序排序
" 比默认的纯按照字母排序更友好点。
"----------------------------------------------------------------------
function! s:setup_dirvish()
    if &buftype != 'nofile' && &filetype != 'dirvish'
        return
    endif
    if has('nvim')
        return
    endif
    " 取得光标所在行的文本（当前选中的文件名）
    let text = getline('.')
    if ! get(g:, 'dirvish_hide_visible', 0)
        exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
    endif
    " 排序文件名
    exec 'sort ,^.*[\/],'
    let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
    " 定位到之前光标处的文件
    call search(name, 'wc')
    noremap <silent><buffer> ~ :Dirvish ~<cr>
    noremap <buffer> % :e %
endfunc

augroup MyPluginSetup
    autocmd!
    autocmd FileType dirvish call s:setup_dirvish()
    autocmd FileType dirvish nmap <buffer> l <CR>
    autocmd FileType dirvish nmap <buffer> h -
augroup END
