# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

alias l='ls -v --color=auto --group-directories-first'
alias ls='ls -v --color=auto --group-directories-first'
alias la='ls -Av --color=auto --group-directories-first'
alias ll='ls -lhv --color=auto --group-directories-first'
alias lla='ls -lhAv --color=auto --group-directories-first'
alias hx=helix
alias cat=lolcat
alias view='vim -R'
alias which='alias | which -i'
alias fort='fortune | cowsay | lolcat -a -d 12 -s 60'
alias b='cd ${OLDPWD}'
alias dte='date +"%A %B %d %I:%M %p %Y"'
################ aliases for Arch or Arch-based distros ########################
#alias pacdiff=eos-pacdiff
alias packs="pacman -Qqe | expac -t='%s%t%c' '%-30n\t%l\t%w' | grep explicit | sort -k2 | cut -f1,3"

EDITOR=vim

[[ "$(whoami)" = "root" ]] && return
# PS1='[\u@\h \W]\$ '
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100   # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

_open_files_for_editing() {
#    # Open any given document file(s) for editing (or just viewing).
#    # Note1: - Do not use for executable files!
#    # Note2: - Uses 'mime' bindings, so you may need to use
#    #          e.g. a file manager to make proper file bindings.
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

