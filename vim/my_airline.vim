" let g:colorizer_maxlines=1000
let g:airline_theme='base16_chalk'
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline_exclude_preview = 1
let g:airline#extensions#branch#displayed_head_limit=1
" function! My_Airline()
    " :AirlineTheme cool<CR>
" endfunction

" call My_Airline()

" hi EvenLbg ctermbg=235 guibg=#090909
" let g:stripe_config = {
" \   "group_odd" : "EvenLbg"
" \}

" EDIT CUSTOMIZATION
" Start editing the vimrc in a new buffer
nnoremap <leader>v :call Edit_vimrc()<CR>
function! Edit_vimrc()
    exe 'edit ' . g:DV . '/vimrc'
endfunction

" Edit your colorscheme on the fly!
nnoremap <leader>o :call Edit_colorscheme()<CR>
function! Edit_colorscheme()
    exe 'edit ' . g:DV . '/colors/betterblack.vim'
endfunction

" See what syntax groups are under the cursor
nnoremap <leader>O :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" General web stuff
au FileType htmldjango set ft=htmldjango.html
au BufRead,BufNewFile Vagrantfile set ft=ruby
au BufRead,BufNewFile *.coffee set ft=coffee
au BufRead,BufNewFile *.snippets set ft=snippets
au BufRead,BufNewFile Jenkinsfile set ft=groovy
