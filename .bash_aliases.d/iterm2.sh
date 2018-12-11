# ~/.bash_aliases.d/iterm2.sh

if [ "$(uname)" != "Darwin" ]; then
    return
fi

function iterm2_begin_osc {
    printf "\033]"
}

function iterm2_end_osc {
    printf "\007"
}

function iterm2_set_profile {
    iterm2_begin_osc
    echo -en "50;SetProfile=$1"
    iterm2_end_osc
}

function p {
    if [ -n "$TMUX" ]; then
        echo "Cannot change iTerm2 profile in tmux env"
    elif [ -z "$ITERM_PROFILE" ]; then
        echo "ITERM_PROFILE is not set"
    else
        if [ "$ITERM_PROFILE" == "Cramshell" ]; then
            ITERM_PROFILE="Laptop"
        else
            ITERM_PROFILE="Cramshell"
        fi
        iterm2_set_profile "$ITERM_PROFILE"
    fi
}
