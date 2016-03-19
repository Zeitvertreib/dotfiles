" echom "portable ".expand('<sfile>')." used"

" ln -s ~/my_dotfiles/my_vimrc.vim ../plugin/my_vimrc.vim
" Automatic reloading of .vimrc
" autocmd! bufwritepost my_vimrc.vim source %

" in case of system overwrite
let $LANG = 'en'
set langmenu=en_US.UTF-8

" If there are two windows with scroll bind option enabled, scroll them simultaneously.
    " setl scrollbind
" Scrolling asynchrously in splitted windows, even with same buffer.
    " set noscrollbind
set more
set history=200
set diffopt=vertical
" set ttimeout ttimeoutlen=100
set ch=2 " Make command line two lines high
set number
set relativenumber
set list
set wildmenu
set formatoptions-=t " Do not auto-wrap text using textwidth
set formatoptions+=c " Auto-wrap comments using textwidth
set formatoptions+=r " Insert comment leader on Enter in insert mode
set formatoptions-=o " Do not continue comments when pressing o/O
set formatoptions+=q " Allow gq on comments
set formatoptions+=l " Don't break long lines if it was long when entering insert mode
set formatoptions+=1 " Don't break after 1-letter word, break before it
set formatoptions+=j " Remove comment leader wehn joining lines
set showcmd
" set showmatch
" set matchtime=2
set matchpairs+=<:>
set ignorecase
set smartcase "großgeschriebenes wird casesensitive
set incsearch "searching while typing?
set hlsearch " highlight search at default
set hidden "soll machen, dass es nicht immer speichern muss...
set gcr=a:blinkon0 "cursorblinken abstellen
set cpoptions+=$ "setzt ein $ am ende des 'changes'
set wildignore+=*.pyc
" set statusline=\ %t\ %l\/%L
set laststatus=2
set modelines=0
set undofile
" CURSOR {{{
"set cursorline
set sidescroll=1
set sidescrolloff=20
set scrolloff=50 "scrollabstand zu unten und oben?
" WRAPPING {{{
nnoremap <M-w> :set wrap!<CR>
set whichwrap+=<,>,[,] " allow cursor keys to go right off end of one line, onto start of next
set linebreak " wrap at word breaks
" set showbreak=… " show an ellipsis at the start of wrapped lines
" let &flp='\w\+> '
set cpoptions+=n
highlight NonText ctermfg=None     " Theme your indent symbols
set tw=80
" }}}
set lazyredraw
" set showbreak=>\ _
" delicious, enable showbreak when breakindent not working
set breakindent
set sb spr | "split below and right
" Always substitute all letters, not just substitute first hit on line
set gdefault
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif
" enable automatic yanking to and pasting from the selection
if has('unnamedplus')
    set clipboard=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif
" set viminfo=%,'9999,s512,nexpand('g:portable')

" -------------  plugins -------------
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline_theme='pencil'
let g:airline_exclude_preview = 1

let g:yankring_persist = 0
let g:rainbow_active = 1
let g:move_key_modifier = 'C'
let NERDSpaceDelims=1
"let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj21'
let g:EasyMotion_keys = 'asdplje'
" forget about mappings in mks
"set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds
let g:virtualenv_directory = '~/programming/web/django'
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "left"
let NERDTreeShowBookmarks=1
map ,l :NERDTreeToggle<CR>
map ,k :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
let NERDTreeChDirMode = 0
" CtrlSpace
function! CtrlSpace_coloring()
    if has("gui_running")
        set mouse=a
        set mousemodel=popup
        set guioptions-=L
        set guioptions-=R
        "set guioptions=m "minimal tags...
        set guioptions-=m "remove menue toolbar right/left scroll
        set guioptions-=T "remove menue toolbar right/left scroll
        set guioptions-=r "remove menue toolbar right/left scroll
        set guioptions-=l "remove menue toolbar right/left scroll
        set guioptions-=e "remove guioptions
        set guicursor=n-v-c:block-Cursor-blinkon0
        set guicursor+=ve:ver35-Cursor
        set guicursor+=o:hor50-Cursor
        set guicursor+=i-ci:ver25-Cursor
        set guicursor+=r-cr:hor20-Cursor
        set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon17
        set guifont=Monospace\ 10
        "set guifont=Ubuntu\ Mono
        hi CtrlSpaceSelected guifg=#021B25 guibg=#93A1A1 gui=bold
        hi CtrlSpaceNormal guifg=#839496 guibg=#021B25 gui=NONE
        hi CtrlSpaceSearch guifg=#9b1b06 guibg=NONE gui=bold
        hi CtrlSpaceStatus guifg=#000000 guibg=#667B83 gui=NONE
    else
        hi CtrlSpaceSelected term=reverse ctermfg=187 guifg=#d7d7af ctermbg=23 guibg=#005f5f cterm=bold gui=bold
        hi CtrlSpaceNormal term=NONE ctermfg=244 guifg=#808080 ctermbg=232 guibg=#080808 cterm=NONE gui=NONE
        hi CtrlSpaceSearch ctermfg=220 guifg=#ffd700 ctermbg=NONE guibg=NONE cterm=bold gui=bold
        hi CtrlSpaceStatus ctermfg=230 guifg=#ffffd7 ctermbg=234 guibg=#1c1c1c cterm=NONE gui=NONE
    endif
endfunction

call CtrlSpace_coloring()

let g:ctrlspace_use_horizontal_splits=1
let g:ctrlspace_save_workspace_on_exit=1
let g:ctrlspace_load_last_workspace_on_start=1

" surround.vim
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin' : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" save yankring entries across vim instances
let g:yankring_persist = 1
let g:yankring_share_between_instances = 1

" have yankring manage Vim's numbered registers ("0-"9)
let g:yankring_manage_numbered_reg = 1

" let bexec_splitdir=[belowright]
let bexec_rehighlight=1
" let bexec_interpreter="/path/to/interpreter"

" -------- shortcuts -------------
cmap gcc !gcc % -g -Wall -o inVimCompiled
" ..sudo
cmap W!! w !sudo tee > /dev/null %

nnoremap <c-i> :let @i=expand("<cword>")<CR>:h <C-R>i<CR>
nnoremap ,ffo : !firefox % &<cr><cr>

nnoremap ,te :let @p=expand("%:p:h")<cr>: !x-terminal-emulator -T started_in_gvim --working-directory=<C-R>p &<cr>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
map pyk :!idle-python3.2 -r % & <CR> <CR>
" Delete line under your current position (Delete next-line).
    nnoremap do myjdd`y
" Jump outside any parentheses or quotes, when your cursor is inside a closed region.
    " inoremap jj <Esc>/[)}"'\]>]<CR>:nohl<CR>a

" Make em uppercase, not only the character, but the whole word. Which is more common.
    nnoremap gU <esc>mz<esc>gUiw`z
    vnoremap gU <esc>mz<esc>gvgU`z
" And make it lowercase.
    nnoremap gu <esc>mz<esc>guiw`z
    vnoremap gu <esc>mz<esc>gvgu`z
" When open the line under you, stay in normal mode. I noticed I keep the normal modus most of the time.
    nnoremap O O<Esc>
    nnoremap o o<Esc>
" Look for the same words.
    nnoremap <S-LeftMouse> <LeftMouse>:<C-U>let @/='\<'.expand("<cword>").'\>'<CR>:set hlsearch<CR>

" last search selection in commanline copy/paste
cmap ,<Space> <C-R>/
nnoremap ,<Space> /

" -------- mappings -------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(LiveEasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

nnoremap ä `
nnoremap ö '
let mapleader = ","
noremap # *
noremap * #
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
vnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
nnoremap <Leader>a, :Tabularize /,/l0r1<CR>
vnoremap <Leader>a, :Tabularize /,/l0r1<CR>
" stays in visual after indenting
vnoremap < <gv
vnoremap > >gv
" Toggle and untoggle spell checking
"noremap <leader>ss :setlocal spell! spelllang=de

" switch to last buffer
nnoremap <leader>d <c-^>
map <F1> <Esc>
map! <F1> <Esc>

" Select just pasted text
nnoremap <leader>v V`]
nnoremap <Space>l :NERDTreeFind<CR>
map c9 :lcl<CR>
" closes quifixwindow
imap ,dw <C-R>=string(eval(input("Berechne: ")))<CR>
command! Rechner <C-R>=string(eval(input("Berechne: ")))<CR>
" space to search vergesse ich immer
" macht :h vertival, BEACHTE ^H!
command! -nargs=* -complete=help Help vertical belowright help <args>
"substitude find and replace
vnoremap ;; "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader><space> "hy/<C-r>h
" nnoremap <Leader>w :let @/=expand("<cword>")<Bar>split<Bar>normal n<CR>
nnoremap <Leader>W :let @/='\<'.expand("<cword>").'\>'<Bar>vsplit<Bar>normal n<CR>

noremap ;; :%s:::g<Left><Left><Left><C-R>/<Right>
" macht in regex : anstelle \
" s/\/dir1\/dir2\/dir3\/file/dir4\/dir5\/file2/g
" sieht dann so aus:
" s:/dir1/dir2/dir3/file:/dir4/dir5/file2:g

"sprünge im normal-mode für :help
map t <C-]>
" Open the file under the cursor.
    " nnoremap gt :tabnew<CR>:e#<CR>:e <cfile><cr>
    " nnoremap gf :vsplit<CR>:wincmd l<CR>:e <cfile><cr>
    " nnoremap gF :e <cfile><cr>

"ignore wrap when moving
nnoremap j gj
nnoremap k gk
" changes current working dir
" closing tags in INSERT MODE
" inoremap <Leader>( ()<Esc>i
" inoremap <Leader>) ()<Esc>i
" inoremap <Leader>[ []<Esc>i
" inoremap <Leader>] []<Esc>i
" inoremap <Leader>} {}<Esc>i
" inoremap <Leader>{ {}<Esc>i
" inoremap <Leader>% %%<Esc>i
" inoremap <Leader>' ''<Esc>i
" easier moving between tabs/buffer
nnoremap ,q <esc>:tabprevious<CR>
nnoremap ,w <esc>:tabnext<CR>
nnoremap <silent> <F9> :MaximizerToggle<CR>
" Folds
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
" set <space> to toggle folds in normal & visual modes
highlight Folded guifg=black guibg=black guifg=red
highlight FoldColumn guifg=black guibg=darkgrey guifg=white
nnoremap <space><space> za
vnoremap <space> zf
" alles markieren
nnoremap <m-a> <ESC>ggVG
" save
inoremap <c-s> <esc>:update<cr>
nnoremap <c-s> <esc>:update<cr>
" map cut & paste to what they bloody should be
vnoremap <C-c> "+y
vnoremap <C-x> "+x
vnoremap <C-v> "+gP
" map <c-c> "*y
" window movement
nnoremap s <c-w>
" needs to be reworked, cuz jumps back
nnoremap vw viw
" nnoremap gj <c-w>j
" nnoremap gk <c-w>k
" nnoremap gl <c-w>l
" nnoremap gh <c-w>h
" window-sizing...
nnoremap <m-j> 1<c-w>-
nnoremap <m-k> 1<c-w>+
nnoremap <m-l> 1<c-w>>
nnoremap <m-h> 1<c-w><

map <m-s> :StripWhitespace<CR>
nnoremap <m-u> :nohlsearch<CR><m-u>
nmap <F6> :set ignorecase!
nnoremap <Leader>s :source %
nnoremap <silent> <Leader>f :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>
 " nnoremap <A-n> :hi StatusLineNC GUIBg=#141414 guifg=#9a7824 gui=underline<CR>:hi StatusLine guifg=#9a7824 guibg=#141414 gui=underline<CR>:split<CR>
" ----- workarounds/functions -----
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }
" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E126,E127,E128,W801"'
let g:syntastic_python_python_exec = '/bin/python3'
" Use jshint (uses ~/.jshintrc)
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_jshint_exec='/usr/local/bin/jshint'
" The highlighting for errors in syslog/messages files is more often annoying
" than useful, so just turn it off.
highlight! link messagesError NONE

"damit Alt oder M in gnome terminal funktioniert
"let c='a'
"while c <= 'z'
  "exec "set <A-".c.">=\e".c
  "exec "imap \e".c." <A-".c.">"
  "let c = nr2char(1+char2nr(c))
"endw

" ............. coloring
set background=dark
" colorscheme gotham256
colorscheme knuckleduster
" colorscheme pencil
" colorscheme vj
" color darkspectrum
" color herald
"colorscheme heliotrope
"colorscheme hybrid
"colorscheme torte
"colorscheme no_quarter
"colorscheme relaxedgreen
" colorscheme pw
"colorscheme paintbox
"colorscheme moss
"colorscheme nour
"colorscheme moria
"colorscheme nevfn
"colorscheme nightsky
"colorscheme desert
"colorscheme industry
"colorscheme Mustang
"colorscheme base16-atelierseaside
"colorscheme twilight
"colorscheme yeller
"colorscheme zmrok
" colorscheme darkburn
" You need to reload this file for the change to apply

highlight ExtraWhitespace ctermbg=NONE

hi TabLine            gui=NONE       guifg=#507080       guibg=Black
hi TabLineSel         gui=bold       guifg=Black         guibg=#507080
hi TabLineFill        gui=NONE       guifg=White         guibg=Black

hi Title              gui=bold       guifg=#507080       guibg=NONE

hi Cursor             guifg=black    guibg=green         gui=bold
hi CursorLine         gui=NONE       guibg=gray10
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
highlight LineNr        guifg=#666666 guibg=#111111 gui=NONE
highlight StatusLine    guifg=black   guibg=#85ff85 gui=bold
highlight StatusLineNC  guifg=black   guibg=#add8e6 gui=NONE
highlight Search        guifg=#000000 guibg=#a1a11d gui=bold
highlight Title         guifg=#3333cc guibg=NONE gui=NONE
hi Todo  guifg=orangered guibg=gray10 gui=bold

" -------------last words
filetype plugin on

set makeprg="make -C build"

" set showtabline=0
" au BufRead .* setf sh
" au BufReadPost *.twig colorscheme koehler
" au BufReadPost *.css colorscheme slate
" au BufReadPost *.js colorscheme elflord
" au BufReadPost *.py colorscheme molokai
" au BufReadPost *.html colorscheme monokai
" au BufReadPost *.java colorscheme monokai
"au BufReadPost *.php colorscheme two2tango

" " The Vanilla Vim is not so good in formatting lines, so improve them: {

    " " Recognize numbered lists
     " set formatoptions+=n

    " " Use indent from 2nd line of a paragraph
     " set formatoptions+=2

    " " Don't break lines that are already long
     " set formatoptions+=l

    " " Break before 1-letter words
     " set formatoptions+=1

    " " Delete comment character when joining commented lines, so two lines of comment becomes one line when joining, without comment mark.
    " if v:version + has("patch541") >= 704
        " set formatoptions+=j
    " endif

    " " Don't continue comment mark after press 'o' when youre on a commented line
     " set formatoptions -=cro

    " " See the help under formatoptions for details
     " set formatoptions=tqw
" " }
" https://github.com/ehartc/dot-vimrc/blob/master/vim%20config/fold.vim
" set tags+=tags;$HOME            " look for tags in parent dirs
" set suffixes+=.class            " ignore Java class files
" set suffixes+=.pyc,.pyo         " ignore compiled Python files
" set suffixes+=.egg-info         " ignore compiled Python files
" set suffixes+=.~1~,.~2~         " ignore Bazaar droppings
" set wildignore+=*.pyc,*.pyo     " same as 'suffixes', but for tab completion
" set wildignore+=*.o,*.d,*.so    " same as 'suffixes', but for tab completion
" set wildignore+=*.egg-info/**   " same as 'suffixes', but for tab completion
" set wildignore+=*~              " same as 'suffixes', but for tab completion
" set wildignore+=local/**        " virtualenv
" set wildignore+=build/**        " distutils, I hates them
" set wildignore+=dist/**         " distutils deliverables
" set wildignore+=htmlcov/**      " coverage.py
" set wildignore+=coverage/**     " zope.testrunner --coverage
" set wildignore+=parts/omelette/** " collective.recipe.omelette
" set wildignore+=parts/**        " all buildout-generated junk even
" set wildignore+=.venv/**        " virtualenv
" set wildignore+=eggs/**         " virtualenv
" set wildignore+=.tox/**         " tox
" set wildignore+=_build/**       " sphinx
" set wildignore+=python/**       " virtualenv called 'python'
" set wildignore+=__pycache__/**  " compiled python files
