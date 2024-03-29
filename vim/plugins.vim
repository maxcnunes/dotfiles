" All plugin depedencies go here!
" ===============================

" Specify a directory for plugins
call plug#begin('~/.vim/bundles')

" Add or remove your plugins here:
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'othree/yajs.vim', {'for': ['javascript']}
Plug 'othree/es.next.syntax.vim', {'for': ['javascript']}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'henrik/vim-qargs'
Plug 'regedarek/ZoomWin'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/csv.vim'
Plug 'dahu/vim-fanfingtastic'
Plug 'takac/vim-hardtime'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'suy/vim-context-commentstring'

call plug#end()
