" be 'modern'
set nocompatible
syntax on
filetype plugin indent on
set termencoding=utf-8


""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
colorscheme onedark
let g:airline_theme='onedark'

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

set relativenumber
set number
set hlsearch				" highlight search terms
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

""""""""""""""""""""""""""""""
" mapping commands
""""""""""""""""""""""""""""""
" disable arrow keys
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" copy and paste to clipboard
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

noremap <silent> <Leader>c :nohl<Return>		" clean search highlight

map <leader>qf :copen<CR>  " go to quickfix list

map <c-q> :q<CR>					" Ctrl+Q to quit current window
nmap <C-Q> :q<CR>

nnoremap <leader>bn :bnext<CR>				" switch to next buffer
nnoremap <leader>bd :bp\|:bd #<CR>			" close current buffer
nnoremap <leader>bp :bprevious<CR>			" switch to previous buffer

nnoremap <c-c> :noh<return><esc>		" clean last search
inoremap jk <esc>					" clean last search

set textwidth=120

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
  autocmd BufEnter * match OverLength /\%121v.*/
augroup END

