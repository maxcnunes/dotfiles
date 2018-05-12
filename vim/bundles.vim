" Specify a directory for plugins
call plug#begin('~/.vim/bundles')

" Add or remove your plugins here:
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
" Plug 'scrooloose/syntastic'
" Plug 'maxcnunes/syntastic-local-eslint.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go'
Plug 'henrik/vim-qargs'
Plug 'regedarek/ZoomWin'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/csv.vim'
Plug 'dahu/vim-fanfingtastic'
Plug 'takac/vim-hardtime'
Plug 'leafgarland/typescript-vim'

call plug#end()
