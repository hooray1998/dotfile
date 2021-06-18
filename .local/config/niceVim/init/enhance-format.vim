" 自动格式化
Plug 'Chiel92/vim-autoformat'
" 快速代码注释
Plug 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1
let NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign='left'
noremap <silent> <m-a> :call NERDComment("n", "Toggle")<CR>
" 根据 quickfix 中匹配到的错误信息，高亮对应文件的错误行
" 使用 :RemoveErrorMarkers 命令或者 <space>ha 清除错误
Plug 'mh21/errormarker.vim'
let errormarker_disablemappings = 1
