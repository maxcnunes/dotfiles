" All the Vim settings go here!
" =============================

""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
colorscheme onedark
let g:airline_theme='onedark'
set termencoding=utf-8

if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ "Darwin"
    let g:onedark_termcolors=16
  else
    let g:onedark_termcolors=256
  endif
endif

set background=dark

let mapleader = ","			" map leader key to ','

set textwidth=120
set relativenumber
set number
set hlsearch				" highlight search terms
set incsearch       " search as you type"
set list listchars=tab:»·,trail:·	" show hidden tabs and white spaces

set autowrite				" save on buffer switch
set hidden				" hide buffers instead of closing them
set history=1000			" remember more commands and search history
set undolevels=1000			" use many muchos levels of undo
set timeoutlen=1000 ttimeoutlen=0	" make escape command faster

""""""""""""""""""""""""""""""
" Gathers vim files
""""""""""""""""""""""""""""""
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swap/

