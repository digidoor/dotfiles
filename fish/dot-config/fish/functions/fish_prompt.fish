function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status red

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    # To input the ° symbol, use ^KDG aka <Ctrl+k>DG
    set -l suffix '><(((°>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

	# change the following arg to "informative" and it will give counts
#    set -g __fish_git_prompt_showupstream 1
    set -g __fish_git_prompt_showupstream informative
    set -g __fish_git_prompt_use_informative_chars 1

    # Color doesn't work for the upstream indicators. maybe we can work
    # on it later or something.
#   set -q __fish_git_prompt_color_upstream_ahead
#   or set -g __fish_git_prompt_color_upstream_ahead yellow
#   set -q __fish_git_prompt_color_upstream_behind
#   or set -g __fish_git_prompt_color_upstream_behind red

    set -q __fish_git_prompt_showdirtystate
    or set -g __fish_git_prompt_showdirtystate 1
    set -q __fish_git_prompt_showuntrackedfiles
    or set -g __fish_git_prompt_showuntrackedfiles 1
    set -q __fish_git_prompt_showstashstate
    or set -g __fish_git_prompt_showstashstate 1
    set -q __fish_git_prompt_showcolorhints
    or set -g __fish_git_prompt_showcolorhints 1
    set -q __fish_git_prompt_color_untrackedfiles
    or set -g __fish_git_prompt_color_untrackedfiles yellow
    set -q __fish_git_prompt_char_untrackedfiles
    or set -g __fish_git_prompt_char_untrackedfiles '%'
    set -q __fish_git_prompt_color_invalidstate
    or set -g __fish_git_prompt_color_invalidstate red
    set -q __fish_git_prompt_char_invalidstate
    or set -g __fish_git_prompt_char_invalidstate '!'
    set -q __fish_git_prompt_color_dirtystate
    or set -g __fish_git_prompt_color_dirtystate blue
    set -q __fish_git_prompt_char_dirtystate
    or set -g __fish_git_prompt_char_dirtystate '*'
    set -q __fish_git_prompt_color_stagedstate
    or set -g __fish_git_prompt_color_stagedstate yellow
    set -q __fish_git_prompt_char_stagedstate
    or set -g __fish_git_prompt_char_stagedstate '+'
    set -q __fish_git_prompt_color_cleanstate
    or set -g __fish_git_prompt_color_cleanstate green
    set -q __fish_git_prompt_char_cleanstate
    or set -g __fish_git_prompt_char_cleanstate '✓'
    set -q __fish_git_prompt_color_branch_dirty
    or set -g __fish_git_prompt_color_branch_dirty red
    set -q __fish_git_prompt_color_branch_staged
    or set -g __fish_git_prompt_color_branch_staged yellow
    set -q __fish_git_prompt_color_branch
    or set -g __fish_git_prompt_color_branch green
    set -q __fish_git_prompt_char_stateseparator
    or set -g __fish_git_prompt_char_stateseparator ''

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -s -e $prompt_status (prompt_login)' ' (set_color $color_cwd) (prompt_pwd -D 7) $normal (fish_vcs_prompt) " " (set_color bryellow --bold) $suffix "\n"
end
