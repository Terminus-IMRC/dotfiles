# ~/.bash_aliases.d/tmux.sh

ta() {
    test -n "$1" && S="$1" || S="0"
    if tmux has-session -t "$S" >/dev/null 2>/dev/null; then
        tmux attach-session -d -t "$S"
    else
        tmux new-session -s "$S"
    fi
}
