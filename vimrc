"No compatible
set nocompatible

" Relative numbers
set nu rnu
set autoindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

syntax enable
filetype plugin on

set noswapfile

set hidden " Instead of closing files, it hides them
set backspace=indent,eol,start
set hlsearch
set incsearch

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title
set visualbell
set noerrorbells

set mouse=a

" REMAPPING
nnoremap ; :

cmap w!! w !sudo tee % >/dev/null
" FINDING FILES:
"
"" Search down into subfoder and tab completition
set path+=**

set encoding=utf-8

" Display all matching files when tab comp
set wildmenu
set wildignore+=.pyc,.swp

" FILE BROWSING
let g:netrw_banner=0 " disable banner
let g:netrw_browse_split=4 "open in prioir windows
let g:netrw_altv=1 " open splits to the right
let netrw_liststyle=3 " tree view
let g:netrw_list_hid=netrw_gitignore#Hide()
let g:netrw_winsize = 25


" USER INTERFACE
set laststatus=2
set ruler

" Move up/down editor lines
set wrap
noremap j gj
noremap k gk

" Moving between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" SET UP VIMWIKI
"
let g:vimwiki_list = [{'path': '~/notes/', 
		\ 'syntax': 'markdown', 'ext': '.md'}]

" Set up Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \}
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_forward_search_on_start = 1


" SET UP ULTISNIPS
set runtimepath+=~/.vim/my_snippets/
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Language
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" SPECIAL PASTE
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" VIM MARKDOWN
let g:vim_markdown_folding_disabled = 1
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : 'build',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}


" COLORS
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256


" PERSONAL CONFIGURATION FOR JOURNAL
autocmd BufNewFile $JOURNAL/entries/*.md 0r $JOURNAL/template.txt

" Python
"
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


" Vim magic virtual env
"python with virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
""  project_base_dir = os.environ['VIRTUAL_ENV']
""  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
""  execfile(activate_this, dict(__file__=activate_this))
"EOF


" Vim slime
"let g:slime_no_mappings = 1
"xmap <c-c><c-c> <Plug>SlimeRegionSend
"nmap <c-c><c-c> <Plug>SlimeParagraphSend
"nmap <c-c>v     <Plug>SlimeConfig
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}


