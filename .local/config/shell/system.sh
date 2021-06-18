alias guanji='shutdown -h now'
alias cq='shutdown -r now'
alias g-='shutdown -h $1 '
alias c-='shutdown -r $1 '
alias quxiaoguanji='shutdown -c'

alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1090" 
alias unsetproxy="unset ALL_PROXY"
# ===========================================================
# proxy 终端下翻墙, 访问github更快
proxytoggle(){
    if [ -n "$http_proxy" ];then
        # export http_proxy=""
        # export https_proxy="$http_proxy"
        export all_proxy="socks://127.0.0.1:1090"
    else
        # export http_proxy="http://127.0.0.1:10809"
        # export https_proxy="$http_proxy"
        export all_proxy="socks5://127.0.0.1:1090"
    fi
}

[ -n "$ZSH_VERSION" ] && setopt no_nomatch  # zsh通配符问题
