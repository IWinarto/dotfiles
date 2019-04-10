# author: irsanwinarto@gmail.com

pac_clean() {
    local to_clean=$(pacman -Qtdq)
    if [[ ! -z $to_clean ]]; then
        pacman -Rnss $to_clean
    fi

    # sudo pacman -Scc
    sudo pacman -Scc
} 


push_dots() {
    local repo='~/Repositories/dotfiles/'
    eval repo=$repo
    git -C $repo commit -a -m "${*:-Update some dot file(s)}"
    git -C $repo push
}


colour() {
    # colour escape sequence is \e[<sequences>m
    local FOREGROUND='38;5'
    echo "\\e[${FOREGROUND};$1m"
}


set_prompts() {
    local PS2_SYMBOL='>>'

    local PS1_COLOR_U=71
    local PS1_COLOR_W=74
    local PS2_COLOR=202

    local RESET='\e[0m'
    local BOLD="\\[$(tput bold)\\]"

    # \u is username; \w is current working directory
    PS2="${BOLD}$(colour $PS2_COLOR)${PS2_SYMBOL} ${RESET}"
    PS1="$(colour $PS1_COLOR_U)\u $(colour $PS1_COLOR_W)\w ${PS2}"
}


set_prompts
unset -f set_prompts colour

# just for easy referencing when downloading from the AUR 
AUR='https://aur.archlinux.org'

alias cds='cd ~/Programming/Shell/'
alias ls='ls --color=auto'
alias makecleanpkg='makepkg -sri; rm -rf pkg src'
alias pacclean='pac_clean'
alias pacremove='sudo pacman -Rnss'
alias pacupdate='sudo pacman -Syu'
alias pushdots='push_dots'
