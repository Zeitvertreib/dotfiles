" set ofu=syntaxcomplete#Complete

set completeopt+=menuone
let g:neosnippet#snippets_directory=g:portable.'/snippets'
let g:neosnippet#enable_preview=1
imap <expr><C-l>
\ neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"

"let g:UltiSnipsExpandTrigger="ds"
"let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger=">"
"let g:UltiSnipsListSnippets="<c-b>"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
set wildcharm=<TAB>
let g:neosnippet#snippets_directory= g:portable . '/snipps'
" sets cr to insert cndidate, but does not insert new line
" noremap <expr><CR> pumvisible()? "\<C-y>" : "\<CR>"
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#auto_completion_start_length = 3

" let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_select = 1
" Define dictionary.

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

 " Recommended key-mappings.
 " <CR>: close popup and save indent.
 " inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
 " function! s:my_cr_function()
     " return neocomplete#close_popup() . "\<CR>"
 " endfunction
 " <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><c-j>  pumvisible() ? "\<C-n>" : "\<c-j>"
inoremap <expr><c-k>  pumvisible() ? "\<C-p>" : "\<c-k>"
" inoremap <expr><space>  pumvisible() ? neocomplete#cancel_popup() : "\<space>"
inoremap <expr><cr>  pumvisible() ? neocomplete#close_popup() : "<cr>"
"
" add those:
" :NeoCompleteDisable
" NeoCompleteToggle
" NeoCompleteAutoCompletionLength
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Shell like behavior(not recommended).
"set completeopt+=longest
let g:neocomplete#enable_auto_select = 1
" let g:neocomplete-source-attribute-min_pattern_length = 3
"let g:neocomplete#disable_auto_complete = 1

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
"Necomplete + Neo snippets key-mappings.
"
let g:neosnippet#snippets_directory= g:portable.'/snipps'
let g:neosnippet#enable_snipmate_compatibility = 1

imap <C-i>     <Plug>(neosnippet_expand_or_jump)
smap <C-i>     <Plug>(neosnippet_expand_or_jump)
xmap <C-i>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"
" highlighting..
" Pmenu     normal item  |hl-Pmenu|
" PmenuSel  selected item  |hl-PmenuSel|
" PmenuSbar scrollbar  |hl-PmenuSbar|
" PmenuThumb    thumb of the scrollbar  |hl-PmenuThumb|
"
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_python_python_exec = '/user/bin/python3'
