# dotfiles
The folder structure is such that symlinks can be automatically made using GNU stow. Clone the repo to a folder within the home directory (such as ~/dotfiles/ or ~/.dotfiles/). Then, stow the desired configs from the top level of said directory using e.g. `stow bash helix vim nvim less`; these titles merely correspond to the names of subfolders found in the root of the dotfiles directory and nothing more. Leave out whatever you haven't installed on that machine or don't feel like using. Simply repeat the `stow whatever` command(s) if new files have been added to one of the categories/folders.

> [!CAUTION]
> To stow everything at once you ${\color{red}MUST}$ use `stow */ --dotfiles` (instead of `stow * --dotfiles` or `stow . --dotfiles`) or stow will shit itself on loose files such as README.md. We use the convenient `--dotfiles` option so that the repo doesn't contain any hidden files to hide from `ls` or `tree` (and instead has files named `dot-bashrc` which are converted to real dotfiles by stow's --dotfiles option).

Just delete the few AutoHotkey and JPEGView links manually or run `stow -D AutoHotkey JPEGView` after running `stow */ --dotfiles` on Linux systems.

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
