# ~/.bashrc.d/ssh.sh

agent="$HOME/.ssh/agent.$(hostname -s)"
if [ -S "$SSH_AUTH_SOCK" ]; then
    if [ "$SSH_AUTH_SOCK" != "$agent" ]; then
        if [ -S "$agent" ]; then
            # Override a sock which may have been lost.
            echo "Renewing SSH socket"\
                    "which is already linked in another session"
        fi
        echo "Linking SSH socket $SSH_AUTH_SOCK"
        ln -snf "$SSH_AUTH_SOCK" "$agent"
        SSH_AUTH_SOCK="$agent"
    fi
elif [ -S "$agent" ]; then
    echo "Linked SSH socket $agent is found"
    export SSH_AUTH_SOCK="$agent"
else
    echo "SSH agent nou found"
fi
unset agent
