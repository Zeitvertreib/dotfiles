" set ofu=syntaxcomplete#Complete
" Better Completion
" set complete=.,w,b,u,t
" set completeopt=longest,menuone,preview
" set completeopt=menu,menuone,preview
" set completeopt+=noinsert
" autocmd CompleteDone * silent! pclose!
" autocmd BufEnter * call ncm2#enable_for_buffer()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use deoplete.
" call deoplete#custom#option({})
" let g:deoplete#enable_at_startup = 1

let g:neocomplete#max_keyword_width = 20
let g:neocomplete#sources#buffer#cache_limit_size = 500000
" sets cr to insert cndidate, but does not insert new line
" noremap <expr><CR> pumvisible()? "\<C-y>" : "\<CR>"
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#enable_auto_close_preview = 1
" let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_select = 1
" Define dictionary.

" Enable heavy omni completion.
" if !exists('g:neocomplete#keyword_patterns')
    " let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" let g:neosnippet#enable_snipmate_compatibility = 0

" imap <C-l>     <Plug>(neosnippet_expand_or_jump)
" smap <C-l>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-l>     <Plug>(neosnippet_expand_target)

" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" SuperTab like snippets behavior.
let g:neosnippet#enable_preview=1

let g:UltiSnipsExpandTrigger="<C-l>"
"let g:UltiSnipsExpandTrigger="ds"
"let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger=">"
"let g:UltiSnipsListSnippets="<c-b>"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
let g:neosnippet#snippets_directory= g:portable . '/snipps'
let g:UltiSnipsSnippetsDir= g:portable . '/usnipps/'
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
" let g:UltiSnipsListSnippets ="<C-l>"

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
" Enable omni completion.
" autocmd FileType vue setlocal tabstop=2
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType sass set filetype=sass.css
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

