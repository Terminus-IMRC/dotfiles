# ~/.bash_aliases

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias gf=fg

alias ls='ls -p --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias l='ls'
alias vi=vim
alias view='vim -R'
alias less='less -X'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'
alias fgrep='fgrep --color'
alias egrep='egrep --color'
alias ispell='aspell -a'
alias crontab='crontab -i'
alias pip2='python2 -m pip'
alias pip3='python3 -m pip'
alias -- ':w=sync'
alias doodle='ping crosschannel-game.com'
alias sudo='sudo env LD_LIBRARY_PATH=$LD_LIBRARY_PATH PATH=$PATH'

urlencode() {
    nkf -WwMQ | tr = % | sed -e 's/%20/+/g' -e 's/%2E/./g'
}

lessmd() {
	[ -n "$1" ] && FILE="$1" || FILE='-'
	cat "$FILE" | cmark -t html | w3m -T text/html
}

if [ -d "$HOME/.bash_aliases.d" ]; then
    for i in $HOME/.bash_aliases.d/*.sh; do
        if [ -r "$i" ]; then
            . "$i"
        fi
    done
    unset i
fi
