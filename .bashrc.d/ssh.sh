# ~/.bashrc.d/ssh.sh

if ! [[ "$-" =~ i ]]; then
    return
fi

agent="$HOME/.ssh/agent.$(hostname -s)"
if [ -S "$SSH_AUTH_SOCK" ]; then
    if [ "$SSH_AUTH_SOCK" != "$agent" ]; then
        if [ -S "$agent" ]; then
            echo "Using existing SSH socket $agent instead of $SSH_AUTH_SOCK"
            echo "To renew one, do:"
            echo "ln -snf $SSH_AUTH_SOCK $agent"
        else
            echo "Linking SSH socket $SSH_AUTH_SOCK to $agent"
            ln -snf "$SSH_AUTH_SOCK" "$agent"
        fi
        SSH_AUTH_SOCK="$agent"
    fi
elif [ -S "$agent" ]; then
    echo "Using existing SSH socket $agent"
    export SSH_AUTH_SOCK="$agent"
else
    echo "SSH agent nou found"
fi
unset agent
