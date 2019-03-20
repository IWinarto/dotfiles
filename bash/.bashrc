# author: irsanwinarto@gmail.com

set_prompts() {
    local PS1_SYMBOL=' '
    local PS2_SYMBOL='>>'

    local PS1_COLOR=110
    local PS2_COLOR=202

    local RESET='0'
    local FOREGROUND='38;5'

    # colour escape sequence is \e[<sequences>m
    # \u is username; \w is current working directory
    PS2="\e[${FOREGROUND};${PS2_COLOR}m${PS2_SYMBOL} \e[${RESET}m"
    PS1="\e[${FOREGROUND};${PS1_COLOR}m\u${PS1_SYMBOL}\w ${PS2}"
}


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


set_prompts

# just for easy referencing when deownloading from the AUR 
AUR='https://aur.archlinux.org'

alias cds='cd ~/Programming/Shell/'
alias ls='ls --color=auto'
alias pacupdate='sudo pacman -Syu'
alias pacclean='sudo pacman -Rnss $(pacman -Qtdq)'
alias pushdots='push_dots'




