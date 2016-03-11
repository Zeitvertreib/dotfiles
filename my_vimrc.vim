" ln -s ~/my_dotfiles/my_vimrc.vim ../plugin/my_vimrc.vim
" Automatic reloading of .vimrc
" autocmd! bufwritepost my_vimrc.vim source %

set ttimeout
set ttimeoutlen=100
"" vimconf is not vi-compatible
"set nocompatible
" window size
set ch=2 " Make command line two lines high
set number
set list
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif

" enable automatic yanking to and pasting from the selection
if has('unnamedplus')
    set clipboard=unnamedplus,unnamed
else
    set clipboard+=unnamed
endif
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
set showmatch
set matchtime=2
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
" CURSOR {{{
"set cursorline
set sidescroll=1
set sidescrolloff=30
set scrolloff=50 "scrollabstand zu unten und oben?
" WRAPPING {{{
nnoremap <M-w> :set wrap!<CR>
set whichwrap+=<,>,[,] " allow cursor keys to go right off end of one line, onto start of next
set linebreak " wrap at word breaks
" set showbreak=… " show an ellipsis at the start of wrapped lines
" let &flp='\w\+> '
set cpoptions+=n
set showbreak=>\ _
highlight NonText ctermfg=None     " Theme your indent symbols
set tw=80
" }}}
set lazyredraw

" -------------  plugins -------------
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline_theme='pencil'
let g:airline_exclude_preview = 1

let g:yankring_persist = 0
let g:rainbow_active = 1
let g:move_key_modifier = 'C'
let NERDSpaceDelims=1
"g:neosnippet#disable_runtime_snippets
"i_<C-l> v_<C-l> xpt-key-trigger g:xptemplate_key
let g:neosnippet#enable_preview=1
imap <expr><C-l>
\ neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"

"let g:UltiSnipsExpandTrigger="ds"
"let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger=">"
"let g:UltiSnipsListSnippets="<c-b>"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj21'
let g:EasyMotion_keys = 'asdplje'
" forget about mappings in mks
"set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds
let g:virtualenv_directory = '~/programming/web/django'
let g:NERDTreeWinPos = "left"
let NERDTreeShowBookmarks=1
map ,l :NERDTreeToggle<CR>
map ,k :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
let NERDTreeChDirMode = 0
" CtrlSpace
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
" full Python syntax highlighting
" let g:pymode_options = 0
" let g:pymode_syntax_print_as_function = 0
" let g:pymode_rope_lookup_project = 1
" let g:pymode_lint_ignore = "E128,W"
" let g:pymode_quickfix_minheight = 2
" let g:pymode_lint_signs = 0
" let g:pymode_python = 'python'
" let python_highlight_all=1
" let g:pyflakes_use_quickfix=1
" " skip all single-letter deletes (x)
" let g:yankring_min_element_length = 2

" save yankring entries across vim instances
let g:yankring_persist = 1
let g:yankring_share_between_instances = 1

" have yankring manage Vim's numbered registers ("0-"9)
let g:yankring_manage_numbered_reg = 1

" -------- shortcuts -------------
cmap gcc !gcc % -g -Wall -o inVimCompiled
" ..sudo
cmap W!! w !sudo tee > /dev/null %
nnoremap ,ffo : !firefox % &<cr><cr>
nnoremap ,te :let b:p=expand("%:p:h")<cr>: !x-terminal-emulator b:p<cr><cr>

" last search selection in commanline copy/paste
cmap ,<Space> <C-R>/
nnoremap ,<Space> /

" -------- mappings -------------
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
"noremap <leader>ss :setlocal spell! spelllang=de<cr>
" F1 is annoying
inoremap ,. <Esc>
vnoremap ,. <Esc>

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
noremap ;; :%s:::g<Left><Left><Left><C-R>/<Right>
vnoremap ;; "hy:%s/<C-r>h//gc<left><left><left>
" macht in regex : anstelle \
" s/\/dir1\/dir2\/dir3\/file/dir4\/dir5\/file2/g
" sieht dann so aus:
" s:/dir1/dir2/dir3/file:/dir4/dir5/file2:g

"sprünge im normal-mode für :help
map t <C-]>
"" pymode order togglebar / jump folds / closes fold
"map mj <esc>]z
"map mk <esc>[z
"map mh <esc>zc
"ignore wrap when moving
nnoremap j gj
nnoremap k gk
" changes current working dir
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
"select whole word
"nnoremap <space> vi
" idle mapping
map pyk :!idle-python3.2 -r % & <CR> <CR>
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
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
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

" ----- workarounds/functions -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

set timeout ttimeoutlen=50

" ............. coloring
colorscheme pencil
set background=dark
"colorscheme heliotrope
"colorscheme hybrid
"colorscheme torte
"colorscheme no_quarter
"colorscheme relaxedgreen
"colorscheme railscasts
"colorscheme pw
"colorscheme paintbox
"colorscheme moss
"colorscheme nour
"colorscheme moria
"colorscheme nevfn
"colorscheme nightsky
"colorscheme desert
"colorscheme industry
"colorscheme Mustang
"colorscheme vj
"colorscheme base16-atelierseaside
"colorscheme twilight
"colorscheme yeller
"colorscheme zmrok
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
set omnifunc=syntaxcomplete#Complete

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

