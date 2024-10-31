alias ss="scripts/start.sh"
alias tt="scripts/test.sh"
alias gg="lazygit"
alias nn="nvim"
alias XX="tmux kill-server"
alias gs="git status"

fuzzy_cd() {
    local dir
    dir=$(find / -type d 2> /dev/null | fzf --height 40% --layout reverse)
    if [ -n "$dir" ]; then
        cd "$dir" || return
    fi
}

alias cc="fuzzy_cd"

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh
EDITOR=nvim