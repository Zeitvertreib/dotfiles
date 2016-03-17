# dotfiles

put them in /anywhere/you/want/

make a symlink from within your /path/to/portable/vim/ like so:

    /path/to/portable/vim/ $ ln -s /anywhere/you/want/.vimrc .vimrc

start vim with:
    vim -u /path/to/portable/vim/.vimrc

or put in your local .vimrc

    :source /path/to/portable/vim/.vimrc
