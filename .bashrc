# ~/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

PS1='\u@\h \D{%Y/%m/%d %H:%M:%S} \w $?\n\$ '
PROMPT_COMMAND="jobs"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    fi
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
    for d in /usr/local/etc/bash_completion.d/; do
        if [ -d "$d" ]; then
            for f in $(find "$d" -type f -or -type l); do
                . "$f"
            done
            unset f
        fi
    done
    unset d
fi

if [ -d "$HOME/.bashrc.d" ]; then
    for i in $HOME/.bashrc.d/*.sh; do
        if [ -r "$i" ]; then
            . "$i"
        fi
    done
    unset i
fi
