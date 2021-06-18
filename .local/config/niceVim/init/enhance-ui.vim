" Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'joshdick/onedark.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'tomasiser/vim-code-dark'
Plug 'liuchengxu/space-vim-theme'

Plug 'morhetz/gruvbox'
" 修改如下两行
" call s:HL('CursorLineNr', s:yellow, s:bg0)
" let s:sign_column = s:bg0

Plug 'tomasr/molokai'
Plug 'mhartington/oceanic-next'
Plug 'gosukiwi/vim-atom-dark'
Plug 'NLKNguyen/papercolor-theme'
let g:rehash256 = 1


"==================================================================
" Title: Airline
"==================================================================

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 0
let g:airline_exclude_preview = 1
let g:airline_section_b = '%n'
let g:airline_theme='deus'
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#vimagit#enabled = 0

" 优化tab栏显示
" let g:airline_theme='gruvbox'
let g:airline_theme='onedark'
let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 1


let g:airline_powerline_fonts=1
