# dotfiles
The folder structure is such that symlinks can be automatically maded using GNU stow. Clone the repo to a folder within the home directory (such as ~/dotfiles/ or ~/.dotfiles/). Then, stow the desired configs from the top level of said directory with `stow bash helix vim nvim less`. Leave out whatever you haven't installed on that machine or don't feel like using. Simply repeat the `stow whatever` command(s) if new files have been added to one of the categories.
## Helix
The directory structure is the same in both, only the location differs.
#### Windows
~/AppData/Roaming/helix/
#### Linux
~/.config/helix/

## vim
_gvimrc/.gvimrc is loaded after vimrc.
#### Windows
_vimrc and _gvimrc should go in ~ or somewhere in the runtime.
#### Linux
.vimrc and .gvimrc can go directly into ~, but I've put them in ~/.vim/ to reduce clutter.

## nvim
#### Windows
~/AppData/Local/nvim/
#### Linux
~~Not sure, but something like `:echo $MYVIMRC` should work.~~

~/.config/nvim/
## JPEGView
~/AppData/Roaming/JPEGView/
