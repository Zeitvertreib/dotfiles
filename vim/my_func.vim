" echo "portable ".expand('<sfile>')." used"

" Called with a command and a redirection target
"   (see `:help redir` for info on redirection targets)
" Note that since this is executed in function context,
"   in order to target a global variable for redirection you must prefix it with `g:`.
" EG call Redir('ls', '=>g:buffer_list')
funct! Redir(command, pattern)
"  exec 'redir @p'
"  silent exec a:command
"  redir END
  redir => lines
  silent execute a:command
  redir END
  new
  setlocal buftype=nofile bufhidden=hide noswapfile
  put =lines
  g/^\s*$/d
  %s/^\s*\d\+:\s*//e
  if !empty(a:pattern)
    execute 'v/' . a:pattern . '/d'
  endif
  0

endfunct
" The last non-space substring is passed as the redirection target.
" EG
"   :R ls @">
"   " stores the buffer list in the 'unnamed buffer'
" Redirections to variables or files will work,
"   but there must not be a space between the redirection operator and the variable name.
" Also note that in order to redirect to a global variable you have to preface it with `g:`.
"   EG
"     :R ls =>g:buffer_list
"     :R ls >buffer_list.txt
command! -nargs=? -complete=help R call call(function('Redir'), split(<q-args>, '\s\(\S\+\s*$\)\@='))

function! Pluginmanager()
    silent! :s/^/Plug '/
    silent! :s/$/'/
endfunction

map ,p :call Pluginmanager()<CR>

fun! SetMkfile()
  let filemk = "Makefile"
  let pathmk = "./"
  let depth = 1
  while depth < 4
    if filereadable(pathmk . filemk)
      return pathmk
    endif
    let depth += 1
    let pathmk = "../" . pathmk
  endwhile
  return "."
endf

command! -nargs=* Make tabnew | let $mkpath = SetMkfile() | make <args> -C $mkpath | cwindow 10

"python with virtualenv support // rework this
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
  " project_base_dir = os.environ['VIRTUAL_ENV']
  " activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  " execfile(activate_this, dict(__file__=activate_this))
" EOF
"" open URL under cursor in browser
" function! <SID>OpenURL(url)
    " if has("win32")
        " exe "!start cmd /cstart /b ".a:url.""
    " elseif $DISPLAY !~ '^\w'
        " exe "silent !sensible-browser \"".a:url."\""
    " else
        " exe "silent !sensible-browser -T \"".a:url."\""
    " endif
    " redraw!
" endfunction
" command! -nargs=1 OpenURL :call <SID>OpenURL(<q-args>)
" nnoremap gb :OpenURL <cfile><CR>
" function! TurnOffSearchHighlighting()
" ...any cim command in python...
" python << endPython

" vim.command('nohlsearch')

" endPython
" endfunction
" https://github.com/JarrodCTaylor/vim-plugin-starter-kit/wiki/Working-with-VimScript-variables"
" IMB:
function AlignAssignments ()
    "Patterns needed to locate assignment operators...
    let ASSIGN_OP   = '[-+*/%|&]\?=\@<!=[=~]\@!'
    let ASSIGN_LINE = '^\(.\{-}\)\s*\(' . ASSIGN_OP . '\)'

    "Locate block of code to be considered (same indentation, no blanks)
    let indent_pat = '^' . matchstr(getline('.'), '^\s*') . '\S'
    let firstline  = search('^\%('. indent_pat . '\)\@!','bnW') + 1
    let lastline   = search('^\%('. indent_pat . '\)\@!', 'nW') - 1
    if lastline < 0
        let lastline = line('$')
    endif

    "Find the column at which the operators should be aligned...
    let max_align_col = 0
    let max_op_width  = 0
    for linetext in getline(firstline, lastline)
        "Does this line have an assignment in it?
        let left_width = match(linetext, '\s*' . ASSIGN_OP)

        "If so, track the maximal assignment column and operator width...
        if left_width >= 0
            let max_align_col = max([max_align_col, left_width])

            let op_width      = strlen(matchstr(linetext, ASSIGN_OP))
            let max_op_width  = max([max_op_width, op_width+1])
         endif
    endfor

    "Code needed to reformat lines so as to align operators...
    let FORMATTER = '\=printf("%-*s%*s", max_align_col, submatch(1),
    \                                    max_op_width,  submatch(2))'

    " Reformat lines with operators aligned in the appropriate column...
    for linenum in range(firstline, lastline)
        let oldline = getline(linenum)
        let newline = substitute(oldline, ASSIGN_LINE, FORMATTER, "")
        call setline(linenum, newline)
    endfor
endfunction

nmap <silent>  ;=  :call AlignAssignments()<CR>

"from: https://github.com/vysakh0/dotfiles/blob/master/vim/plugin_config.vim
"Vim dispatch, change compiler for language specific"
"autocmd FileType ruby let b:dispatch = 'ruby %'
autocmd FileType ruby let b:dispatch = 'ruby %'
autocmd FileType python let b:dispatch = 'python %'
autocmd FileType java let b:dispatch = 'javac %'
autocmd FileType javascript let b:dispatch = 'node %'

nnoremap <leader>dp :Dispatch<CR>
" to see the output of the quick fix window
nnoremap <leader>c :Copen<CR>
"nnoremap <space>d :Dispatch bundle exec rspec %<CR>
nnoremap <leader>br :Dispatch ruby %<CR>

function! FileName()
    let l:file_name = bufname("%")
    let l:line_num  = line(".")
    let l:total     = ( l:file_name.":".l:line_num )
    :exe "Dispatch mix test ".total
endfunction

nnoremap <leader>mc :call FileName()<CR>
nnoremap <leader>mf :Dispatch mix test %<CR>
nnoremap <leader>mt :Dispatch mix test<CR>

nnoremap <leader>dc :Dispatch bundle check <CR>
nnoremap <leader>di :Dispatch bundle install<CR>
nnoremap <leader>dl :Dispatch bundle install --local<CR>
