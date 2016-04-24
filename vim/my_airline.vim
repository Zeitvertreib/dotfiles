" let g:colorizer_maxlines=1000
let g:airline_theme='cool'
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline_theme=''
let g:airline_exclude_preview = 1
" function! My_Airline()
    " :AirlineTheme cool<CR>
    " echo "myairline"
" endfunction

" call My_Airline()

hi EvenLbg ctermbg=235 guibg=#090909
let g:stripe_config = {
\   "group_odd" : "EvenLbg"
\}
