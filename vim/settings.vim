" All the Vim settings go here!
" =============================

""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
colorscheme onedark
let g:airline_theme='onedark'
set termencoding=utf-8

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
