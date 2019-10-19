" Vundle vimrc
set nocompatible              " be iMproved, required

filetype plugin indent on

set number
colorscheme akbkuku

"  File Explorer Stuff
let g:netrw_liststyle=3		" Tree View
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically


" ··········· netrw ···················· 
fun! NetrwCrsrLn()
  if &filetype ==# "netrw"
    call HiCrsrLn()
  else
    highlight link CursorLine NONE
  endif
endf

fun! ExToggle(dir)
  if &filetype != "netrw"
    call ExOpen(a:dir)
  else
    call ExClose()
  endif
endf

fun! ExOpen(dir)
  exe "Explore " . a:dir
  let g:netrw_browse_split=0  " open files in current window
endf

fun! ExClose()
  while &filetype == "netrw"
    exe "normal! \<C-O>"
  endw
endf

fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose()
  else
    call VexOpen(a:dir)
  endif
endf

fun! VexOpen(dir)
  let g:netrw_browse_split=4    " open files in previous window
  let vex_width = 27

  exe "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H

  call VexSize(vex_width)
endf

fun! VexClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  q!
  unlet t:vex_buf_nr

  exe (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endf

fun! VexSize(vex_width)
  exe "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endf

fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

augroup NetrwGroup
  autocmd! BufEnter * call NormalizeWidths()
augroup END

noremap <Tab> :call VexToggle(getcwd())<CR>
noremap <Leader>` :call VexToggle("")<R>



set backspace=indent,eol,start

syntax on

set colorcolumn=81
highlight ColorColumn ctermbg=234

setlocal spell spelllang=en_us

set autoindent
set noexpandtab
set tabstop=8
set shiftwidth=8

autocmd FileType * set noexpandtab
autocmd FileType * set autoindent

autocmd FileType * set tabstop=8
au FileType python setlocal noexpandtab

