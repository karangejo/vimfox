nnoremap <buffer> <localleader>f :call CallFoxDot()<cr>

function! CallFoxDot()
  " Write the query file if it has changed
  silent update

  let l:cmd = g:"call foxdot somehow" . expand('%')
  let l:results = systemlist(l:cmd)

  " Give our result buffer a meaningful name
  let l:name = '__FOX_DOT__'

  if bufwinnr(l:name) == -1
    " Open a new split
    execute 'vsplit ' . l:name
  else
    " Focus the existing window
    execute bufwinnr(l:name) . 'wincmd w'
  endif

  " Clear out existing content
  normal! gg"_dG

  " Don't prompt to save the buffer
  set buftype=nofile

  " Insert our content
  call append(0, l:results)

  " Refocus the query window
  execute 'wincmd p'
endfunction
