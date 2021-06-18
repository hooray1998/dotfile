" 用于在侧边符号栏显示 git/svn 的 diff
Plug 'mhinz/vim-signify'
" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'
" Git 支持
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
" Plug 'tpope/vim-fugitive'

"==================================================================
" Title: Signity显示git/svn
"==================================================================

" diff使用增强算法
autocmd VimEnter * EnhancedDiff histogram
" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
endif

" signify 调优
let g:signify_vcs_list = ['git', 'svn']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change
let g:signify_skip_filetype = { 'startify': 1 , 'tasks': 1 }

" git 仓库使用 histogram 算法进行 diff
let g:signify_vcs_cmds = {
            \ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
            \}
