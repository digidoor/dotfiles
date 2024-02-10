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
alias ranger='source ranger'
alias which='alias | which -i'
alias fort='fortune | cowsay | lolcat -a -d 12 -s 60'
alias b='cd ${OLDPWD}'
alias dte='date +"%A %B %d %I:%M %p %Y"'
################ aliases for Arch or Arch-based distros ########################
#alias pacdiff=eos-pacdiff
alias packs="pacman -Qqe | expac -t='%s%t%c' '%-30n\t%l\t%w' | grep explicit | sort -k2 | cut -f1,3"

lfcd () {
	# `command` is needed in case `lfcd` is aliased to `lf`
	cd "$(command lf -print-last-dir "$@")"
}

export EDITOR=vim
export LESS="-R"

[[ "$(whoami)" = "root" ]] && return
# PS1='[\u@\h \W]\$ '
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100   # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

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

export LESS_TERMCAP_mb=$'\e[96;5m' # no apparent effect
export LESS_TERMCAP_md=$'\e[96m' # HEADINGS, emphasis, commands and args
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[96;1;7m' # search bar and search results
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[34;2;3m' # MAIN title and underlined key words
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_mr=$'\e[96m' # no apparent effect
export LESS_TERMCAP_mh=$'\e[96m' # no apparent effect
export LESS_TERMCAP_ZN=$'\e[96m' # no apparent effect
export LESS_TERMCAP_ZV=$'\e[96m' # no apparent effect
export LESS_TERMCAP_ZO=$'\e[0m'
export LESS_TERMCAP_ZW=$'\e[0m'
export GROFF_NO_SGR=1  # For Konsole and Gnome-terminal

source ~/.git-prompt.sh
PS1='\e[91;5m$?\e[0m\e[90;1m|\e[96m\u\e[37m@\e[96m\h \e[34m\w\e[35m$(__git_ps1 ) \e[93;1m\\$\e[0m\n'

