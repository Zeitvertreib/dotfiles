# vim configs

**!!(currently only works when cloned into home ..  working on it)!!**

when cloned to /anywhere/you/want/

make a symlink from within your /path/to/portable/vim/ like so:

    /path/to/portable/vim/ $ ln -s /anywhere/you/want/vim/.vimrc .vimrc

start vim with: (this sould point to your new symlink)
    vim -u /path/to/portable/vim/.vimrc

or put in your local .vimrc

    :source /path/to/portable/vim/.vimrc

--
## bug / feature

    :so %
in your .vimrc might cause to reset the workin path-things for vim

fix: source the link or rather restart vim (not a biggy, but if you wonder...)
