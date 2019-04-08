# author: irsanwinarto@gmail.com

pac_clean() {
    # sudo pacman -Scc
    sudo pacman -Scc

    local to_clean=$(pacman -Qtdq)
    if [[ ! -z $to_clean ]]; then
        pacman -Rnss $to_clean
    fi
} 


push_dots() {
    local repo='~/Repositories/dotfiles/'
    eval repo=$repo
    git -C $repo commit -a -m "${*:-Update some dot file(s)}"
    git -C $repo push
}


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


set_prompts
unset -f set_prompts

# just for easy referencing when downloading from the AUR 
AUR='https://aur.archlinux.org'

alias cds='cd ~/Programming/Shell/'
alias ls='ls --color=auto'
alias makecleanpkg='makepkg -sri; rm -rf pkg src'
alias pacclean='pac_clean'
alias pacremove='sudo pacman -Rnss'
alias pacupdate='sudo pacman -Syu'
alias pushdots='push_dots'
