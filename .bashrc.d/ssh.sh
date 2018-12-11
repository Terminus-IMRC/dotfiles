# ~/.bashrc.d/ssh.sh

agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case "$SSH_AUTH_SOCK" in
        /tmp/ssh-*/agent.[0-9]*)
            echo "A live SSH socket $SSH_AUTH_SOCK is found"
            ln -snf "$SSH_AUTH_SOCK" "$agent"
            export SSH_AUTH_SOCK="$agent"
    esac
elif [ -S "$agent" ]; then
    echo "A live SSH socket is not found but default agent $agent is found"
    export SSH_AUTH_SOCK="$agent"
else
    echo "SSH agent nou found"
fi
unset agent
