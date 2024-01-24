# dotfiles
## Helix
The directory structure is the same in both, only the location differs.
#### Windows
~/AppData/Roaming/helix
#### Linux
~/.config/helix

## vim
Both unix and windows (g)Vim can have their config files in various places, but ~/.vimrc and ~/_vimrc (or the gvim variants) should work on both.
_gvimrc/.gvimrc is loaded after vimrc.

## nvim
#### Windows
~/AppData/Local/nvim
#### Linux
Not sure, but something like `:echo $MYVIMRC` should work.
## JPEGView
~/AppData/Roaming/JPEGView
