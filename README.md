# dotfiles
The folder structure is such that symlinks can be automatically made using GNU stow. Clone the repo to a folder within the home directory (such as ~/dotfiles/ or ~/.dotfiles/). Then, stow the desired configs from the top level of said directory using e.g. `stow bash helix vim nvim less`. Leave out whatever you haven't installed on that machine or don't feel like using. Simply repeat the `stow whatever` command(s) if new files have been added to one of the categories.
## Helix
The directory structure is the same on both windows and linux; only the location differs.
#### Windows
~/AppData/Roaming/helix/
#### Linux
~/.config/helix/

## vim
_gvimrc/.gvimrc is loaded after vimrc.
#### Windows
_vimrc and _gvimrc should go in ~ or somewhere in the runtime.
#### Linux
.vimrc and .gvimrc can go directly into ~, but I've put them in ~/.vim/ to reduce clutter. This location is checked by vim automatically.

## nvim
#### Windows
~/AppData/Local/nvim/
#### Linux
~/.config/nvim/
## JPEGView
~/AppData/Roaming/JPEGView/
