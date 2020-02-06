"No compatible
set nocompatible

" Relative numbers
set nu rnu

syntax enable
filetype plugin on


" FINDING FILES:
"
"" Search down into subfoder and tab completition
set path+=**

set encoding=utf-8

" Display all matching files when tab comp
set wildmenu

" FILE BROWSING
let g:netrw_banner=0 " disable banner
let g:netrw_browse_split=4 "open in prioir windows
let g:netrw_altv=1 " open splits to the right
let netrw_liststyle=3 " tree view
let g:netrw_list_hid=netrw_gitignore#Hide()


" Move up/down editor lines
noremap j gj
noremap k gk
