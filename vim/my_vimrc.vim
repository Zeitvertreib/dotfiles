" echom "portable ".expand('<sfile>')." used"

" ln -s ~/my_dotfiles/my_vimrc.vim ../plugin/my_vimrc.vim
" Automatic reloading of .vimrc
" autocmd! bufwritepost my_vimrc.vim source %

" in case of system overwrite
let $LANG = 'en'
set langmenu=en_US.UTF-8
" nivm related
let g:deoplete#enable_at_startup = 1
" autocmd OptionSet guicursor noautocmd set guicursor=
" If there are two windows with scroll bind option enabled, scroll them simultaneously.
    " setl scrollbind
" Scrolling asynchrously in splitted windows, even with same buffer.
    " set noscrollbind
set more
set history=200
set diffopt=vertical
" set ttimeout ttimeoutlen=100
set ch=2 " Make command line two lines high
" tabs to 2, instead of 4
" Lineal
set number
set nornu
" set relativenumber!
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
set cpoptions+=$ "markiert, wo c aufhoert
set wildignore+=*.pyc
" set statusline=\ %t\ %l\/%L
set laststatus=2
set modelines=0
" CURSOR {{{
" set cursorline
set sidescroll=1
set sidescrolloff=10
set scrolloff=15 "scrollabstand zu unten und oben?
" WRAPPING {{{
nnoremap <M-w> :set wrap!<CR>
set whichwrap+=<,>,[,] " allow cursor keys to go right off end of one line, onto start of next
set linebreak " wrap at word breaks
" set showbreak=… " show an ellipsis at the start of wrapped lines
" let &flp='\w\+> '
set cpoptions+=n
set tw=80
" }}}
set lazyredraw
" set synmaxcol=120
set breakindent
set sb spr | "split below and right
" Always substitute all letters, not just substitute first hit on line
set gdefault

" Indentation
" set showbreak=>\ _
" delicious, enable showbreak when breakindent not working
let g:indentLine_char="·"

" Folding
" set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
" set <space> to toggle folds in normal & visual modes
nnoremap <space><space> za
vnoremap <space> zf
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

if has("folding")
  set foldenable        " enable folding
  set foldmethod=syntax " fold based on syntax highlighting
  set foldlevelstart=99 " start editing with all folds open

  " toggle folds
  " nnoremap <Space> za
  " vnoremap <Space> za

  set foldtext=FoldText()
  function! FoldText()
    let l:lpadding = &fdc
    redir => l:signs
      execute 'silent sign place buffer='.bufnr('%')
    redir End
    let l:lpadding += l:signs =~ 'id=' ? 2 : 0

    if exists("+relativenumber")
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      elseif (&relativenumber)
        let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
      endif
    else
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      endif
    endif

    " expand tabs
    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
    let l:width = winwidth(0) - l:lpadding - l:infolen

    let l:separator = ' … '
    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
    let l:text = l:start . ' … ' . l:end

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
  endfunction
endif
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif
" enable automatic yanking to and pasting from the selection cnp
if has('unnamedplus')
    set clipboard=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif

vnoremap y m'y
nnoremap v m'v
" cnp
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
inoremap <C-V> "+gP

" Select just pasted text
nnoremap <leader>v V`]

" set viminfo=%,'9999,s512,nexpand('g:portable')

" -------------  plugins -------------
let g:vcoolor_disable_mappings = 1
let g:colorizer_maxlines=1000
let g:yankring_persist = 0
let g:rainbow_active = 0
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/{%/ end=/%}/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
let g:move_key_modifier = 'C'
let NERDSpaceDelims=1
"let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj21'
let g:EasyMotion_keys = 'asdplje'
" forget about mappings in mks
"set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "left"
let NERDTreeShowBookmarks=1
map ,l :NERDTreeToggle<CR>
map ,k :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
let NERDTreeChDirMode = 0
" call NERDTreeAddKeyMap({
        " \ 'key': '<ESC>',
        " \ 'callback': 'NERDTreeMapQuit',
        " \ 'quickhelpText': 'closes, like q'})

" Startify
let g:startify_use_env = 1
let g:startify_relative_path = 1
let g:startify_custom_indices = ['a','f', 'g', 'h']
let g:startify_session_sort = 1
let g:startify_list_order = [
        \ ['Sessions'],'sessions',
        \ 'files',
        \ 'dir',
        \ 'bookmarks',
        \ 'commands',
        \ ]

let g:startify_files_number = 5
let g:startify_session_dir = '$HOME/tmp/vimsessions'
let g:startify_skiplist = [
    \ '.vimrc',
    \ expand(g:portable.'/'.'*')]
let g:startify_bookmarks = [
    \ { 'd': expand(fnamemodify(g:portable, ":h").'/shell/'.'distribute')},
    \ { 'gg': expand(fnamemodify(g:portable, ":h").'/shell/concepts/'.'gg.sh')},
    \ { 'vv': expand(g:portable.'/'.'my_vimrc.vim')},
    \ { 'v.': expand(g:portable.'/'.'.vimrc')},
    \ { 'gg': '~/tmp/syms/'} ]

" \ {'n': ['node support', 'call My_node()']},
let g:startify_commands = [
    \ {'xxx': 'h ref'},
    \ ]

let g:ascii = [
        \ '               ',
        \ '     .     .|  |.        .',
        \ '     |  |  ||  ||        |',
        \ '      \___/ |__||__|__|__|',
        \ '     '
        \]
let g:startify_custom_header = g:ascii
   " startify#fortune#quote()    raw random quote
    " startify#fortune#boxed()    formatted random quote in a box
    " startify#fortune#cowsay()   formatted random quote in a box + cow

" CtrlSpace
nmap <C-Space> :CtrlSpace<CR>

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
        hi CtrlSpaceNormal guifg=#000000 guibg=#021B25 gui=NONE
        hi CtrlSpaceSearch guifg=#9b1b06 guibg=NONE gui=bold
        hi CtrlSpaceStatus guifg=#000000 guibg=#667B83 gui=NONE
        hi CtrlSpaceSearch ctermfg=220 guifg=#ffd700 ctermbg=NONE guibg=NONE cterm=bold gui=bold
    else
        hi CtrlSpaceSelected term=reverse ctermfg=187 guifg=#d7d7af ctermbg=23 guibg=#005f5f cterm=bold gui=bold
        hi CtrlSpaceNormal term=NONE ctermfg=244 guifg=#808080 ctermbg=232 guibg=#080808 cterm=NONE gui=NONE
        hi CtrlSpaceSearch ctermfg=220 guifg=#ffd700 ctermbg=NONE guibg=NONE cterm=bold gui=bold
        hi CtrlSpaceStatus ctermfg=230 guifg=#ffffd7 ctermbg=234 guibg=#1c1c1c cterm=NONE gui=NONE
    endif
endfunction

call CtrlSpace_coloring()

let g:ctrlspace_use_horizontal_splits=1
let g:CtrlSpaceSaveWorkspaceOnExit=1
let g:CtrlSpaceLoadLastWorkspaceOnStart=1

" surround.vim
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
" mine
let g:surround_{char2nr("p")} = "print( \r )"
let g:surround_{char2nr("-")} = "\1my_py: \1( \r )"

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

" -------- shortcuts / keybinds -------------
inoremap <C-w> <Esc>bdwa
cmap gcc !gcc % -g -Wall -o inVimCompiled
" ..sudo
cmap W!! w !sudo tee > /dev/null %

nnoremap ,h :let @i=expand("<cword>")<CR>:h <C-R>i<CR>
nnoremap ,ff : !firefox % &<cr><cr>

nnoremap ,te :let @p=expand("%:p:h")<cr>: !x-terminal-emulator -T started_in_gvim --working-directory=<C-R>p &
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
map pyk :!idle-python3.2 -r % & <CR> <CR>

" Copy current buffer path relative to root of VIM session to system clipboard
nnoremap <Leader>yp :let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>
" Copy current filename to system clipboard
nnoremap <Leader>yf :let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>
" Copy current buffer path without filename to system clipboard
nnoremap <Leader>yd :let @*=expand("%:h")<cr>:echo "Copied file directory to clipboard"<cr>
" Delete line under your current position (Delete next-line).
"
nnoremap do myjdd`y
nnoremap dO mykdd`y
" Jump outside any parentheses or quotes, when your cursor is inside a closed region.
    " inoremap jj <Esc>/[)}"'\]>]<CR>:nohl<CR>a

" Make em uppercase, not only the character, but the whole word. Which is more common.
    nnoremap gU <esc>mz<esc>gUiw`z
    vnoremap gU <esc>mz<esc>gvgU`z
" And make it lowercase.
    nnoremap gu <esc>mz<esc>guiw`z
    vnoremap gu <esc>mz<esc>gvgu`z
" Look for the same words.
    nnoremap <S-LeftMouse> <LeftMouse>:<C-U>let @/='\<'.expand("<cword>").'\>'<CR>:set hlsearch<CR>

" last search selection in commanline copy/paste
cmap ,<Space> <C-R>/
nnoremap ,<Space> /

" -------- mappings -------------
" inoremap {{ {<CR><CR>}<up>
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>
nnoremap ,0 :AirlineTheme cool<CR>
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
noremap <leader>ss :setlocal spell! spelllang=de<CR>
"
" SPELLING
" toggle spell checking
nnoremap <silent> <leader>s :set spell!<CR>

" correct the current word and move to the next one using ,S
nnoremap <silent> <leader>S 1z=]s
set spelllang=en_us " Set region to US English
" let &spellfile=g:DV."/spell/en.latin1.add"

" switch to last buffer
nnoremap <leader>d <c-^>
map <F1> <Esc>
map! <F1> <Esc>

map c9 :lcl<CR>
" closes quifixwindow
imap ,dw <C-R>=string(eval(input("Berechne: ")))<CR>
command! Rechner <C-R>=string(eval(input("Berechne: ")))<CR>
" space to search vergesse ich immer
" macht :h vertival, BEACHTE ^H!
command! -nargs=* -complete=help Help vertical belowright help <args>
" substitute find and replace // select
vnoremap ;; "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader><space> "hy/<C-r>h
"get all in hochkomma
map ," /".\{-}"<CR>
" nnoremap <Leader>w :let @/=expand("<cword>")<Bar>split<Bar>normal n<CR>
nnoremap <Leader>W :let @/='\<'.expand("<cword>").'\>'<Bar>vsplit<Bar>normal n<CR>

" substitute
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
nnoremap sa <esc>:tabprevious<CR>
nnoremap se <esc>:tabnext<CR>
nnoremap st :tabe %<CR>
" nnoremap ,q <esc>:tabprevious<CR>
" nnoremap ,w <esc>:tabnext<CR>
nnoremap <silent> <F9> :MaximizerToggle<CR>
" alles markieren
nnoremap <m-a> <ESC>ggVG
" save
vnoremap <m-q> <esc>:update<cr>
inoremap <m-q> <esc>:update<cr>
nnoremap <m-q> <esc>:update<cr>
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

let &grepprg = 'grep -Rn $* .'
" nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cWORD>")) . " getcwd() "<cr>:copen<cr>
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
" current word does not get highlighted
let g:matchup_matchparen_timeout = 300
let g:matchup_matchparen_insert_timeout = 60
hi MatchParen gui=bold
" ............. coloring
" colorscheme gotham256
colorscheme despacio
" colorscheme gruvbox
" let g:gruvbox_vert_split="red"
" set background=dark
" colorscheme hybrid
" colorscheme knuckleduster
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
" colorscheme mustang
"colorscheme base16-atelierseaside
"colorscheme twilight
"colorscheme yeller
"colorscheme zmrok
" colorscheme darkburn
" You need to reload this file for the change to apply
" colorscheme corn
" colorscheme mod8

" enusre coloring:
highlight ExtraWhitespace ctermbg=NONE

hi TabLine            gui=NONE       guifg=#507080       guibg=Black
hi TabLineSel         gui=bold       guifg=Black         guibg=#507080
hi TabLineFill        gui=NONE       guifg=White         guibg=Black
hi Title              gui=bold       guifg=#507080       guibg=NONE

" hi Cursor             guifg=black    guibg=green         gui=bold
" hi CursorLine           guibg=gray10
hi CursorColumn         cterm=NONE    ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" highlight StatusLine    guifg=red   guibg=#032 gui=bold
" highlight StatusLineNC  guifg=black   guibg=#add8e6 gui=NONE
" highlight Search      guifg=#000000 guibg=#a1a11d gui=bold
highlight Search        guifg=#A8CA00 guibg=#032a0a
highlight Title         guifg=#3333cc guibg=NONE gui=NONE
hi Todo  guifg=orangered guibg=gray10 gui=bold

highlight NonText ctermfg=None     |" Theme your indent symbols
" highlight Folded guifg=#001010 guibg=#001010 guifg=#a00066
" highlight Folded guifg=#001010 guibg=#001010 guifg=#30dfaf
highlight Folded guifg=#001010 guibg=#333300 guifg=#ff4422
highlight FoldColumn guifg=#1A1A1A guibg=#000000 guifg=white
hi Error guibg=#D488F6 guifg=#005510
"
" linenumbercoloring:
hi SignColumn guibg=gray15 guibg=gray15
highlight LineNr        guifg=#666666 guibg=gray15

" popup menue pink error
hi Pmenusel guifg=#ffffff guibg=#032a0a
hi Pmenu guibg=#9c9c9c guifg=#000000
" hi link Pmenu Folded
" hi Normal                   guifg=#6BFF22 guibg=#330033
" hi Normal                   guifg=#ABFF82 guibg=#003333
" hi Comment                  guifg=#009434
hi Constant                 guifg=#33DAFF gui=none

" hi Statement                guifg=#CCEE40 gui=italic
hi StatementU               guifg=#CCEE40 gui=underline
" hi Keyword                  guifg=#CCEE40
hi Visual  guifg=#330033 guibg=#FFFFFF gui=none
" hi MatchParen gui=bold
nnoremap <silent> <leader>a :ArgWrap<CR>
" let g:matchup_matchparen_nomode = 'i'
call matchup#util#patch_match_words(
   \ '<\@<=\([^/][^ \t>]*\)\%(>\|$\|[ \t][^>]*\%(>\|$\)\):<\@<=/\1>',
   \ '<\@<=\([^/][^ \t>]*\)\ze\%(>\|$\|[ \t][^>]*\%(>\|$\)\):<\@<=/\1>'
   \)
augroup matchup_highlight
    autocmd!
    autocmd ColorScheme * hi MatchParenCur gui=bold cterm=bold
augroup END

" -------------last words
filetype plugin indent on

set makeprg="make -C buildgarbagecollectset autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=4
set expandtab

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
