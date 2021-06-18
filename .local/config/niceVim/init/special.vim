Plug 'junegunn/vim-peekaboo'
Plug 'metakirby5/codi.vim'
Plug 'dbridges/vim-markdown-runner'
" Plug 'gpanders/vim-medieval'
" Plug 'sillybun/vim-repl'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps['Find Under']  = '<M-n>'
let g:VM_maps['Find Subword Under'] = '<M-n>'

Plug 'Krasjet/auto.pairs'
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''
" Plug 'Yggdroot/hiPairs'
let g:hiPairs_hl_matchPair = { 'term'    : 'underline,bold',
            \                  'cterm'   : 'underline,bold',
            \                  'ctermbg' : '30',
            \                  'gui'     : 'bold',
            \                  'guifg'   : 'Black',
            \                  'guibg'   : '#13B17D' }
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'

let g:lens#disabled_filetypes = ['nerdtree', 'fzf', 'leaderf', 'vista', 'undotree', 'diff', 'coc-explorer', 'qf']
let g:lens#disabled_buftypes=['terminal']
Plug 'easymotion/vim-easymotion'

" 用 v 选中一个区域后，ALT_+/- 按分隔符扩大/缩小选区
Plug 'terryma/vim-expand-region'
map <m-=> <Plug>(expand_region_expand)
map <m--> <Plug>(expand_region_shrink)

Plug 'honza/vim-snippets'

Plug 'kkoomen/vim-doge'
Plug 'mhinz/vim-startify'
"==================================================================
" Title: Startify
"==================================================================

autocmd User Startified nnoremap <buffer> <space>e :wincmd o\|exit<CR>
autocmd User Startified nnoremap <buffer> l :call TodoToggle()<CR>
if !has('win32')
    autocmd User Startified nnoremap <buffer> - :LfCurrentDirectory<CR>
endif
autocmd User StartifyBufferOpened silent execute "wincmd o"

let g:startify_disable_at_vimenter = 0
let g:startify_session_dir = '~/.vim/session'
let g:startify_change_to_vcs_root = 0
let g:startify_update_oldfiles    = 1
let g:startify_enable_special     = 0
let g:startify_files_number       = 6
let g:startify_relative_path      = 1

let g:startify_skiplist = [
       \ '\.vimgolf',
       \ '^/tmp',
       \ '.*\.todo',
       \ '.*/\.vim/.*',
       \ '/sys/devices/.*',
       \ '.*/\.git/.*',
       \ '/project/.*/documentation',
       \ escape(fnamemodify($HOME, ':p'), '\') .'mysecret.txt',
       \ ]
let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [
            \ { 'c': '~/.vim/niceVim' },
            \ '~/golfing',
            \ ]

let g:startify_custom_footer =
            \ ['', "   撸起袖子加油干", '']

let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

if has('win32')
let g:startify_commands = [
            \ {'g': ['git', 'silent! G']},
            \ {'n': ['leaderf mru', 'LeaderfMru']},
            \ {'f': ['leaderf file', 'LeaderfFile']},
            \ {'v': ['vim config', 'e E:/gVim/niceVim/init.vim']},
            \ {'m': ['basic map', 'e E:/gVim/niceVim/init/keymaps-for-basic.vim']},
            \ {'p': ['plugin map', ':e E:/gVim/niceVim/init/keymaps-for-plugin.vim']},
            \ ]
" let g:startify_custom_header_quotes = [
            " \ {-> systemlist('shuf -n8 E:/quote.list')}
            " \ ]
else
let g:startify_commands = [
            \ {'g': ['git', 'silent! G']},
            \ {'n': ['leaderf mru', 'LeaderfMru']},
            \ {'f': ['leaderf file', 'LeaderfFile']},
            \ {'v': ['vim config', 'e ~/.vim/niceVim/init.vim']},
            \ {'m': ['basic map', 'e ~/.vim/niceVim/init/keymaps-for-basic.vim']},
            \ {'p': ['plugin map', ':e ~/.vim/niceVim/init/keymaps-for-plugin.vim']},
            \ ]
let g:startify_custom_header_quotes = [
            \ {-> systemlist('shuf -n8 $HOME/quote.list')}
            \ ]
endif

let g:startify_custom_header = 'startify#pad( startify#fortune#boxed())'
" function! StartifyEntryFormat()
    " return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
" endfunction
