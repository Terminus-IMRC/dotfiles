# ~/.bash_aliases.d/console.sh

helpless() {
    $@ --help |& $PAGER
}

align() {
    echo -e "\e#8"
}


if [ "$(uname)" != "Linux" ]; then
    return
fi


jterm() {
    LANG=ja_JP.UTF-8 fbterm
}
