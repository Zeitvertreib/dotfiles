" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)
" echo "portable ".expand('<sfile>')." used"

" what is the name of the directory containing this file?
" portable load config:
let g:portable = expand('<sfile>:p:h')

" silent execute '!ln -s ~/dotfiles/vim/my_func.vim ' g:portable.'/plugin/my_func.vim'
" silent execute '!ln -s ~/dotfiles/vim/my_vimrc.vim ' g:portable.'/plugin/my_vimrc.vim'

" let s:portableVundle= g:portable . '/bundle/Vundle.vim'
let s:portableBundle= g:portable . '/bundle'

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', g:portable, &runtimepath, g:portable)

" start vim with: vim -u /path/to/portable/vim/.vimrc
" in HOME/.vimrc :source /media/datenspeicher/data/global_conf/portable_vimrc/.vim/.vimrc
" let mapleader=","

set nocompatible | filetype off

" https://github.com/junegunn/vim-plug
call plug#begin(s:portableBundle)
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin(s:portableBundle)

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
Plug 'tpope/vim-pathogen'

Plug 'dahu/vimple'
Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'virtual env'
Plug 'chrisbra/NrrwRgn'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

" IDE-ish
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'Shougo/neocomplete.vim'
" Plug 'scrooloose/syntastic'
" Plug 'lambdalisue/vim-pyenv'
" Plug 'rkulla/pydiction'

Plug 'ervandew/supertab'
Plug 'wincent/command-t'

" ======================================
" Plug 'carlhuda/janus'
" Plug 'xolox/vim-easytags'
" Plug 'rkulla/pydiction'
Plug 'fboender/bexec'
" ======================================
" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/lh-tags'
" Plug 'LucHermitte/lh-dev'
" Plug 'LucHermitte/lh-brackets'


Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'

" to test -==========
Plug 'bronson/vim-visual-star-search'
" Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
" Plug 'chrisbra/changesPlugin'
Plug 'jceb/vim-orgmode'

" Plug 'laurentgoudet/vim-howdoi'
" needs howdoi
" pip install howdoi
" =================

" Plugin 'mbbill/undotree'
" Plug 'vim-scripts/YankRing.vim'
"
" Plugin 'kien/rainbow_parentheses.vim'"
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'
" highten up around cursor, nice
Plug 'junegunn/limelight.vim'
" automated disable hl, not sure, if needed
" Plug 'pgdouyon/vim-evanesco'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'

" Plug 'mechatroner/rainbow_csv'
" https://github.com/Yggdroot/indentLine
Plug 'ap/vim-css-color'
" alternative try:
" Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'

Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'

Plug 'scrooloose/nerdcommenter'
" closes bracets
" Plug 'raimondi/delimitmate'
" following bugged!!!!!!!!!!!!!!!!!!!!!!
" Plug 'kopischke/vim-stay'

" Plug 'chrisbra/unicode.vim'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'godlygeek/tabular'
" Plug 'aldeed/meteor-tabular'
" display in browser, while editing
" Plug 'iamcco/markdown-preview.vim'
" makes use quikfix...
" Plug 'jceb/vim-hier'

Plug 'jelera/vim-javascript-syntax'

" colorshemes:
Plug 'JarrodCTaylor/vim-256-color-schemes'
Plug 'ewilazarus/preto'
Plug 'pgdouyon/vim-yin-yang'

Plug 'whatyouhide/vim-gotham'
Plug 'atelierbram/vim-colors_duotones'
Plug 'PotatoesMaster/vim-colors-harold'
Plug 'vim-scripts/true-monochrome'
Plug 'reedes/vim-colors-pencil'
Plug 'flazz/vim-colorschemes'


call plug#end()            " required

" savety first, had an issue, got solved by both loaders... might want to remove
" pathogen at some point
call pathogen#infect()
call pathogen#helptags()

function! Migrate_portable_vim()
    let s:portable_Plugin = g:portable . '/plugin'
    let s:p_configs = [ "my_vimrc.vim", "my_func.vim", "my_omni.vim"]
    for ff in s:p_configs
      let pf = s:portable_Plugin.'/'.ff
        " if thelisted files are in your directory, dont load them
        if filereadable( expand(pf)) == 0
            let dot_f = '~/dotfiles/vim/'.ff
            " execute '!ln -s ~/dotfiles/vim/'.ff.' '.pf
            execute "source " . dot_f
        endif
    endfor
endfunction

call Migrate_portable_vim()

syntax enable

filetype on
filetype plugin indent on    " required
filetype plugin on

" set hidden is needed to be loaded here, for ctrlspace
set hidden


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
"set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'
" Better copy & paste

" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/

" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap

" TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable backup and swap files - for file system watchers
set nobackup
set nowritebackup
set noswapfile

" =========================================================================
" Python IDE Setup
" =========================================================================

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"
if has("gui_running")
" GUI is running or is about to start.
" Maximize gvim window.
  set lines=55 columns=160
endif


" not vim related https://github.com/jaraco/irc