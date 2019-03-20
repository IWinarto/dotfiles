# author: irsanwinarto@gmail.com

PS1_SYMBOL=' '
PS2_SYMBOL='>>'

PS1_COLOR=110
PS2_COLOR=202

RESET='0'
FOREGROUND='38;5'

# colour escape sequence is \e[<sequences>m
# \u is username; \w is current working directory
PS2="\e[${FOREGROUND};${PS2_COLOR}m${PS2_SYMBOL} \e[${RESET}m"
PS1="\e[${FOREGROUND};${PS1_COLOR}m\u${PS1_SYMBOL}\w ${PS2}"

# just for easy referencing when deownloading from the AUR 
AUR='https://aur.archlinux.org'

alias pacupdate='sudo pacman -Syu'
alias pacclean='sudo pacman -Rnss $(pacman -Qtdq)'
alias ls='ls --color=auto'
alias cds='cd ~/Programming/Shell/'
alias pushdots='push_dots'

push_dots() {
    local repo='~/Repositories/dotfiles/'
    eval repo=$repo
    if [[ -z $1 ]]; then
        local message='Update some dot file(s)'
    else
        local message=$1
    fi
    git -C $repo commit -a -m "$message"
    git -C $repo push
}
