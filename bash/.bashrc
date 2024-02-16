# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

alias l='ls -v --color=auto --group-directories-first'
alias ls='ls -v --color=auto --group-directories-first'
alias la='ls -Av --color=auto --group-directories-first'
alias ll='ls -lhv --color=auto --group-directories-first'
alias lla='ls -lhAv --color=auto --group-directories-first'
alias lf=lfcd
alias hx=helix
alias cat=lolcat
alias view='vim -R'
alias svim='sudo vim'
alias please='sudo $(fc -ln -1)'
alias b='cd ${OLDPWD}'
alias diff='diff --color'
alias vless='~/.vim/less.sh'
alias r=ranger
alias ranger='source ranger'
alias which='alias | which -i'
alias dte='date +"%A %B %d %I:%M %p %Y"'
alias fort='fortune | cowsay | lolcat -a -d 12 -s 60'
################ aliases for Arch or Arch-based distros ########################
alias packs="pacman -Qqe | expac -t='%s%t%c' '%-30n\t%l\t%w' | grep explicit |
	sort -k4 | cut -f1,3"

lfcd () {
	# `command` is needed in case `lfcd` is aliased to `lf`
	cd "$(command lf -print-last-dir "$@")"
}

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export EDITOR=vim
export GROFF_NO_SGR=1  # This is necessary to get colors in less

[[ "$(whoami)" = "root" ]] && return
# PS1='[\u@\h \W]\$ '
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100   # limits recursive functions, see 'man bash'

_open_files_for_editing() {
# Uses 'mime' bindings
    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi
    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}
## Alias for the function above.
alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing


source ~/.git-prompt.sh
PS1='\e[91;5m$?\e[0m\e[90;1m|\e[96m\u\e[37m@\e[96m\h \e[34m\w\e[35m$(__git_ps1 ) \e[93;1m\\$\e[0m\n'

