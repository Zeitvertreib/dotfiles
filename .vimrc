" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
" portable load config:
let s:portable = expand('<sfile>:p:h')

" silent execute '!ln -s ~/dotfiles/my_func.vim ' s:portable.'/plugin/my_func.vim'
" silent execute '!ln -s ~/dotfiles/my_vimrc.vim ' s:portable.'/plugin/my_vimrc.vim'

" let s:portableVundle= s:portable . '/bundle/Vundle.vim'
let s:portableBundle= s:portable . '/bundle'

function! Migrate_portable_vim()
    let s:portable_Plugin = s:portable . '/plugin'
    let s:p_configs = [ "my_vimrc.vim", "my_func.vim"]
    for f in s:p_configs
      let qq = s:portable_Plugin.'/'.f
        if filereadable( expand(qq)) == 0
            echom "create symlink @: ".qq
            execute '!ln -s ~/dotfiles/'.f.' '.qq
        endif
    endfor
endfunction

call Migrate_portable_vim()

let g:neosnippet#snippets_directory= s:portable . '/snipps'

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

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

Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'virtual env'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-pathogen'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
" ======================================
" Plug 'carlhuda/janus'
" Plug 'xolox/vim-easytags'
" Plug 'rkulla/pydiction'
" Plug 'fboender/bexec'
" ======================================

Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'

" to test -==========
Plug 'bronson/vim-visual-star-search'
Plug 'tmhedberg/SimpylFold'
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
" https://github.com/Yggdroot/indentLine
Plug 'ap/vim-css-color'
" alternative try:
" Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'scrooloose/nerdcommenter'
" closes bracets
Plug 'raimondi/delimitmate'
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
Plug 'whatyouhide/vim-gotham'
Plug 'atelierbram/vim-colors_duotones'
Plug 'PotatoesMaster/vim-colors-harold'
Plug 'vim-scripts/true-monochrome'
Plug 'reedes/vim-colors-pencil'
Plug 'flazz/vim-colorschemes'


call plug#end()            " required

call pathogen#infect()
call pathogen#helptags()

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

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" set ofu=syntaxcomplete#Complete
" set completeopt=longest,menuone
" function! OmniPopup(action)
    " if pumvisible()
        " if a:action == 'j'
            " return "\<C-N>"
            " elseif a:action == 'k'
            " return "\<C-P>"
        " endif
    " endif
" return a:action
" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

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
