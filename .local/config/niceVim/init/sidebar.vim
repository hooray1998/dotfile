" 以后合并menu.vim
Plug 'brglng/vim-sidebar-manager'
Plug 'mbbill/undotree'
Plug 'liuchengxu/vista.vim'
Plug 'skywind3000/vim-terminal-help'


"——————————————————————————————————————————————————————————————————
" Title: 内置终端
"——————————————————————————————————————————————————————————————————


let g:terminal_cwd = 1
let g:terminal_height = 15
let g:terminal_pos = 'rightbelow'
let g:terminal_shell = '/bin/zsh'
let g:terminal_edit = 'tab drop'
let g:terminal_kill = 1
let g:terminal_list = 0
" let g:terminal_fixheight': set to 1 to set 'winfixheight' for the terminal
let g:terminal_close = 1

"==================================================================
" Title: 文件浏览器coc-explore，符号树Vista， UndoTree
"==================================================================

if has("persistent_undo")
    set undodir=$HOME/.undodir
    set undofile
endif
let g:undotree_SplitWidth = 30
let g:undotree_SetFocusWhenToggle = 1

let g:vista_sidebar_width = 30
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'python': 'coc',
  \ }
let g:vista_icon_indent = ["▸ ", ""]

let g:sidebars = {
  \ 'coc-explorer': {
  \     'position': 'left',
  \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'coc-explorer'},
  \     'open': 'CocCommand explorer --no-toggle',
  \     'close': 'CocCommand explorer --toggle'
  \ },
  \ 'vista': {
  \     'position': 'right',
  \     'check_win': {nr -> bufname(winbufnr(nr)) =~ '__vista__'},
  \     'open': 'Vista',
  \     'close': 'Vista!'
  \ },
  \ 'undotree': {
  \     'position': 'left',
  \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'undotree'},
  \     'open': 'UndotreeShow',
  \     'close': 'UndotreeHide'
  \ }
  \ }

let g:startify_session_before_save = ['call sidebar#close_all()']


"Plug 'irrationalistic/vim-tasks'
autocmd BufNewFile,BufReadPost *.TODO,TODO,*.todo set filetype=todo
