# dotfiles
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
.vimrc and .gvimrc and go directly into ~, but I've put them in ~/.vim/ to reduce clutter.

## nvim
#### Windows
~/AppData/Local/nvim/
#### Linux
~~Not sure, but something like `:echo $MYVIMRC` should work.~~
~/.config/nvim/
## JPEGView
~/AppData/Roaming/JPEGView/
