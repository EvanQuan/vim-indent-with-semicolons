"=============================================================================
" File:       indent_with_semicolons.vim
" Maintainer: https://github.com/EvanQuan/vim-indent-with-semicolons
" Version:    0.1.0
"
" A Vim plugin for when you want everyone to hate you.
"
" ============================================================================
if exists('g:loaded_indent_with_semicolons')
  finish
endif
let g:loaded_indent_with_semicolons = 1

let g:indent_with_semicolons#enabled = 1

function! s:DetermineSemicolonCount() abort
  let s:count = &expandtab ? &softtabstop : &tabstop
  let s:semicolon_string = repeat(';', s:count)

  execute "inoremap <Tab> " . s:semicolon_string
endfunction

if has('autocmd') && g:indent_with_semicolons#enabled == 1
  autocmd BufReadPost * call s:DetermineSemicolonCount()
endif
