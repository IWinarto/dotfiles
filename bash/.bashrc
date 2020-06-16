# author: irsanwinarto@gmail.com

pac_clean() {
    local to_clean=$(pacman -Qtdq)

    if [[ ! -z $to_clean ]]; then
        sudo pacman -Rnss $to_clean
    fi

    sudo pacman -Scc
} 


push_dots() {
    eval local repo='~/Repositories/dotfiles/'
    git -C $repo commit -am "${*:-Update some dot file(s)}"
    git -C $repo push
}


run() {
    nohup >/dev/null "${@}" &
    exit
}


colour() {
    # colour escape sequence is \e[<sequences>m
    local FOREGROUND='38;5'
    echo "\\[\\e[${FOREGROUND};$1m\\]"
}


set_prompts() {
    local PS2_SYMBOL='>>'

    local PS1_COLOUR_U=71
    local PS1_COLOUR_W=74
    local PS2_COLOUR=202

    local RESET='\[\e[0m\]'
    local BOLD=\\[$(tput bold)\\]

    # \u is username; \w is current working directory
    PS2="${BOLD}$(colour $PS2_COLOUR)${PS2_SYMBOL} ${RESET}"
    PS1="${BOLD}$(colour $PS1_COLOUR_U)\u $(colour $PS1_COLOUR_W)\w ${PS2}"
}


rdp() {
    cat "$@" | \
    awk '/DesiredHRES/ {print "DesiredHRES=2560"; next} \
         /DesiredVRES/ {print "DesiredVRES=1440"; next} \
         /TWIMode/     {print "TWIMode=Off";      next} \
                       {print}' \
         RS='\r\n' > temp

    mv temp "$@"

    cat "$@"

    run_scaled --scale=1.5 /opt/Citrix/ICAClient/wfica "$@"
}


set_prompts
unset -f set_prompts colour

# just for easy referencing when downloading from the AUR 
AUR='https://aur.archlinux.org'

alias cds='cd ~/Programming/Shell/'
alias cls=clear
alias llpp='run llpp'
alias ls='ls --color=auto --group-directories-first -X'
alias mkp='makepkg -cris'
alias mpv='run mpv'
alias pacclean='pac_clean'
alias pacremove='sudo pacman -Rnss'
alias pacupdate='sudo pacman -Syu'
alias pushdots='push_dots'

# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/share/powerline/bindings/bash/powerline.sh
