# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias ls='ls -v --color=auto --group-directories-first'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias lla='ls -lhA'
alias lf=lfcd
alias vim=nvim
alias hx=helix
alias cat=lolcat
alias view='nvim -R'
alias svim='sudo nvim'
alias b='cd ${OLDPWD}'
alias diff='diff --color'
alias r=ranger
alias ranger='source ranger'
alias grep='grep --color=auto'
alias which='alias | which -i'
alias please='sudo $(fc -ln -1)'
alias pls='sudo $(fc -ln -1)'
alias vless='~/.config/nvim/less.sh'
alias dte='date +"%A %B %d %I:%M %p %Y"'
alias dmesg='sudo dmesg -H --color=always | less'
alias fort='fortune | cowsay | lolcat -a -d 12 -s 60'
################ aliases for Arch or Arch-based distros ########################
alias packs="pacman -Qqe | expac -t='%s%t%c' '%-30n\t%l\t%w' | grep explicit |
	sort -k4 | cut -f1,3"

cd() {
	builtin cd "$@" && l
}

lfcd () { # enables cd to last lf directory on exit
	# `command` is needed in case `lfcd` is aliased to `lf`
	cd "$(command lf -print-last-dir "$@")"
}

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export EDITOR=vim
export GROFF_NO_SGR=1  # This is necessary to get colors in less
export RANGER_LOAD_DEFAULT_RC=FALSE

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

