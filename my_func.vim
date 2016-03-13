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
