if !has('nvim') | finish | endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"==================================================================
" Title: Coc配置
"==================================================================

let g:coc_global_extensions = [
            \ 'coc-vimlsp' ,
            \ 'coc-todolist' ,
            \ 'coc-snippets' ,
            \ 'coc-marketplace'  ,
            \ 'coc-xml' ,
            \ 'coc-python' ,
            \ 'coc-lua' ,
            \ 'coc-json' ,
            \ 'coc-java' ,
            \ 'coc-html' ,
            \ 'coc-css',
            \ 'coc-cmake',
            \ 'coc-actions']

            " \ 'coc-zi' ,
            " \ 'coc-ecdict' ,
            " \ 'coc-translator' ,
set updatetime=300
set shortmess+=c

if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight the symbol and its references when holding the cursor.
" if has('nvim')
    " autocmd CursorHold *.py,*.sh silent call CocActionAsync('highlight')
" endif

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
