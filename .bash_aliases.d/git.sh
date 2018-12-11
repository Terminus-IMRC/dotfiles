# ~/.bash_aliases.d/git.sh

alias g=git
alias s='git status'
alias d='git diff'
alias b='git branch'
alias r='git remote'

show_current_branch() {
    __res="$(git branch 2>/dev/null)"
    if [ $? -eq 0 ]; then
        echo -n 'git: On branch '
        echo "$__res" | grep '^\*' | sed 's/^\*[ \t]*\([^ \t]*\)[ \t]*$/\1/'
    fi
    unset __res
}
