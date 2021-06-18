" 提供 gist 接口
"Plug 'lambdalisue/vim-gista', { 'on': 'Gista' }
"Plug 'mattn/webapi-vim'
"Plug 'mattn/vim-gist'
vnoremap <C-n> y:call NewGist()<CR>
command -nargs=0 Gist :execute("Leaderf rg '' ".g:local_gist_dir)

let g:local_gist_dir='~/.gist/'
function! NewGist()
	let time=string(localtime())
	let suffix=input("文件名后缀:")
    let comment='#'
    if index(['c', 'cpp'], suffix) >= 0
        let comment = '//'
    elseif index(['vim'], suffix) >= 0
        let comment = '"'
    endif

    let filename=g:local_gist_dir . time . '.' . suffix
    exec ":edit ".expand(filename)
    call setline(1, comment . ' DATE: ' . strftime("%y-%m-%d %T")) 
    call append(line("."), comment . " MAIL: hoorayitt@gmail.com") 
    call append(line(".")+1, comment . "  TAG: ") 
    call append(line(".")+2, comment . " DISC: ") 
    call append(line(".")+3, "") 
    normal 3GA
endfunc
