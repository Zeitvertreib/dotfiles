" the runtimepath settings are not from me, but i forgot/ cant find the source
" so honor someone else !!!
" set default 'runtimepath'
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" the name of the directory containing this file
let g:global = expand('<sfile>:p:h')
" echo "target installation: ".g:global
" wokr around on symlinks, double resolve
let s:portable_raw =resolve(expand('<sfile>:p'))
" echo "resolved: ".s:portable_raw
let g:portable = fnamemodify(s:portable_raw, ":h")
" echo "resolved, modified, used: ".expand(g:portable)
" mods, becaus following des not work
" echo "resolved: ".resolve(expand('<sfile>:p:h'))

" let s:portableVundle= g:global . '/bundle/Vundle.vim'
let s:portableBundle= g:global . '/bundle'

let plug_path = g:portable.'/'.'plug.vim'
if filereadable( expand(plug_path)) == 1
execute "source " . plug_path
endif

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', g:global, &runtimepath, g:global)

" start vim with: vim -u /path/to/global/vim/.vimrc

set nocompatible | filetype off

" https://github.com/junegunn/vim-plug
call plug#begin(s:portableBundle)
" alternatively, pass a path where Vundle should install plugins
if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neopairs'
else
Plug 'Shougo/neocomplete'
endif
Plug 'digitaltoad/vim-pug'
Plug 'posva/vim-vue'
" call vundle#begin(s:portableBundle)
" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-textobj-user'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'itchyny/calendar.vim'

Plug 'ervandew/supertab'
Plug 'mtth/scratch.vim'
" Plug 'sk1418/QFGrep'
Plug 'vimwiki/vimwiki'

" Plug 'virtual env'
Plug 'chrisbra/NrrwRgn'
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/lightline-powerful'
Plug 'itchyny/vim-cursorword'
" Plug 'osyo-manga/vim-stripe'
" Plug 'osyo-manga/vim-over'
" Plug 'osyo-manga/vim-hopping'
" Plug 'tyru/open-browser.vim'
" Plug 'lordm/vim-browser-reload-linux'
" Plug 'jaxbot/browserlink.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'lervag/vimtex'
" Plug 'LaTeX-Box-Team/LaTeX-Box'

" IDE-ish
" Plug 'dyng/ctrlsf.vim'
Plug 'mhinz/vim-startify'
" Plug 'dahu/vimple'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'SirVer/ultisnips'
" Plug 'jordwalke/VimCompleteLikeAModernEditor'
" Plug 'jordwalke/AutoComplPop'
" Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/unite.vim'
" synthax: all
Plug 'sheerun/vim-polyglot'
Plug 'FooSoft/vim-argwrap'
Plug 'AndrewRadev/sideways.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
" Plug 'Shougo/neco-vim'

" Plug 'ivanov/vim-ipython'
"
" Plug 'johndgiese/vipy'
" Plug 'scrooloose/syntastic'
" Plug 'lambdalisue/vim-pyenv'
" Plug 'rkulla/pydiction'
" Plug 'mhinz/vim-grepper'

" Plug 'wincent/command-t'
" ======================================
" Plug 'carlhuda/janus'
" Plug 'xolox/vim-easytags'
" Plug 'rkulla/pydiction'
" Plug 'fboender/bexec'
" ======================================
" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/lh-tags'
" Plug 'LucHermitte/lh-dev'
" Plug 'LucHermitte/lh-brackets'

" Plug 'myusuf3/numbers.vim'
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" to test -==========
Plug 'bronson/vim-visual-star-search'
Plug 'tmhedberg/SimpylFold'
" Plug 'Konfekt/FastFold'
" Plug 'chrisbra/changesPlugin'
" Plug 'jceb/vim-orgmode'

Plug 'will133/vim-dirdiff'
" Plug 'laurentgoudet/vim-howdoi'
" needs howdoi
" pip install howdoi
" =================

" Plugin 'mbbill/undotree'
" Plug 'vim-scripts/YankRing.vim'
"
" Plugin 'kien/rainbow_parentheses.vim'"
" Plug 'junegunn/vim-easy-align'
" Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'
" highten up around cursor, nice
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'andymass/vim-matchup'
" easy marks, disable on small screens
" Plug 'kshenoy/vim-signature'
" automated disable hl, not sure, if needed
" Plug 'pgdouyon/vim-evanesco'
" Plug 'junegunn/vim-pseudocl'
" Plug 'junegunn/vim-oblique'

" Plug 'mechatroner/rainbow_csv'
" https://github.com/Yggdroot/indentLine
" Plug 'ap/vim-css-color'
" alternative try:
Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'
" Plug 'KabbAmine/vCoolor.vim'

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

" Plug 'mjbrownie/vim-htmldjango_omnicomplete'
" Plug 'tweekmonster/django-plus.vim'
Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'posva/vim-vue'

" colorshemes:
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'AlessandroYorba/Despacio'
Plug 'cocopon/iceberg.vim'

Plug 'jaxbot/semantic-highlight.vim'
Plug 'chriskempson/base16'
Plug 'w0ng/vim-hybrid'
Plug 'JarrodCTaylor/vim-256-color-schemes'
Plug 'ewilazarus/preto'
Plug 'pgdouyon/vim-yin-yang'
Plug 'baskerville/bubblegum'
Plug 'noahfrederick/vim-hemisu'
Plug 'jonathanfilip/vim-lucius'
Plug 'morhetz/gruvbox'
Plug 'itchyny/landscape.vim'
" #!
Plug 'nightsense/vrunchbang'
Plug 'whatyouhide/vim-gotham'
Plug 'atelierbram/vim-colors_duotones'
Plug 'PotatoesMaster/vim-colors-harold'
Plug 'vim-scripts/true-monochrome'
Plug 'reedes/vim-colors-pencil'
Plug 'flazz/vim-colorschemes'


call plug#end()           | " required

" savety first, had an issue, got solved by both loaders... might want to remove
" pathogen at some point
" call pathogen#infect()
" call pathogen#helptags()

function! Migrate_portable_vim()
    let s:p_configs = [ "my_vimrc.vim", "my_func.vim", "my_omni.vim", "my_airline.vim"]
    for ff in s:p_configs
      let pf = g:portable.'/'.ff
        if filereadable( expand(pf)) == 1
            " let dot_f = '~/dotfiles/vim/'.ff
            " execute '!ln -s ~/dotfiles/vim/'.ff.' '.pf
            execute "source " . pf
            " echo pf
        endif
    endfor
endfunction

call Migrate_portable_vim()

filetype on
filetype plugin indent on    " required
filetype plugin on

" set hidden is needed to be loaded here, for ctrlspace
set hidden


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

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
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
set shiftround
set expandtab

" Disable backup and swap files - for file system watchers
set nobackup
set nowritebackup
set noswapfile
set guicursor=n-v-c:block,i-ci-ve:ver15,r-cr:hor20,o:hor50
      \,a:blinkon0
      \,sm:block-blinkwait175-blinkoff150-blinkon175

if has("gui_running")
" GUI is running or is about to start.
" Maximize gvim window.
  set lines=55 columns=160
endif
" not vim related https://github.com/jaraco/irc
