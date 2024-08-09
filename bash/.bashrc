alias rr="./run.sh"
alias tt="./test.sh"
alias gg="lazygit"
alias nn="nvim"

fuzzy_cd() {
    local dir
    dir=$(find / -type d 2> /dev/null | fzf --height 40% --layout reverse)
    if [ -n "$dir" ]; then
        cd "$dir" || return
    fi
}

alias cc="fuzzy_cd"