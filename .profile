# ~/.profile

# kernel name: "Linux" or "Darwin"
uname="$(uname -s)"

umask 022

LANG="en_US.UTF-8"
LC_CTYPE="$LANG"
PAGER="less"
EDITOR="vim"
export LANG LC_CTYPE PAGER EDITOR

unset PATH LD_LIBRARY_PATH PKG_CONFIG_PATH MANPATH
preficies="$HOME/.local/local $HOME/.local"
case "$uname" in
    Darwin)
        preficies="$preficies /opt/X11"
        ;;
esac
for prefix in "" "/usr" "/usr/local" $preficies; do
    PATH="$prefix/sbin:$prefix/bin:$PATH"
    LD_LIBRARY_PATH="$prefix/lib:$LD_LIBRARY_PATH"
    PKG_CONFIG_PATH="$prefix/lib/pkgconfig:$PKG_CONFIG_PATH"
    MANPATH="$prefix/share/man:$MANPATH"
done
unset preficies prefix
case "$uname" in
    Linux)
        PATH="$PATH:/usr/games"
        ;;
    Darwin)
        for pkg in /usr/local/opt/*; do
            if [ -d "$pkg/libexec/gnubin" ]; then
                PATH="$pkg/libexec/gnubin:$PATH"
            fi
            if [ -d "$pkg/libexec/gnuman" ]; then
                MANPATH="$pkg/libexec/gnuman:$MANPATH"
            fi
        done
        unset pkg
        ;;
esac
export PATH LD_LIBRARY_PATH PKG_CONFIG_PATH MANPATH

if [ -d ~/.venv ]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    source ~/.venv/bin/activate
else
    echo "warning: ~/.venv does not exist; skipping sourcing it"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

unset uname
