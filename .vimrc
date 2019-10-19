" Vundle vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
"let g:ycm_confirm_extra_conf = 0 

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'

" End configuration, makes the plugins available
"call vundle#end()
filetype plugin indent on

set number
let g:ConqueTermColor = 2
let g:netrw_browse_split = 3
colorscheme akbkuku

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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



" Custom ConqueGDB Commands

fun! OpenDebug(file)
	if (a:file != " ")
		let filename="bin/Debug/" . a:file
	else
		let filename=" "
	endif

	let g:debug_open = 1
	tabnew
	let g:debug_tab = tabpagenr()
	exe "normal! :ConqueGdb " . filename . "\<CR>"
	1wincmd w
	q
	sleep 100m
	redraw
endf

fun! CloseDebug()
	unlet g:debug_open
	exe (g:debug_tab) . "tabclose"
	unlet g:debug_tab
endf

fun! DebugToggle(file)
  if exists("g:debug_open")
    call CloseDebug()
  else
    call OpenDebug(a:file)
  endif
endf

fun! GetFileLine(fn,ln)
  return readfile(a:fn,'',a:ln)[a:ln-1]
endfun

noremap <F5> :call DebugToggle(" ")<CR>
noremap <F6> :!./build.sh<CR>
noremap <C-F5> :!./build.sh -n<CR> :call DebugToggle(GetFileLine("CMakeLists.txt",10))<CR>

noremap <F2> :YcmCompleter GoToDefinition<CR>
noremap <F3> :YcmCompleter GoToDeclaration<CR>
noremap <F4> :%s/    /\t/g<CR>
noremap <C-F4> :%s/  /\t/g<CR>

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

