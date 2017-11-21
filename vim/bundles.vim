set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'joshdick/onedark.vim'			" theme
Plugin 'tpope/vim-surround'			" surround
Plugin 'othree/yajs.vim'			" js highlight theme
Plugin 'othree/es.next.syntax.vim'		" es7 highlight theme
Plugin 'scrooloose/syntastic'			" linter
Plugin 'maxcnunes/syntastic-local-eslint.vim'	" use local eslint
Plugin 'vim-airline/vim-airline'		" status line
Plugin 'tpope/vim-fugitive'			" git wrapper
Plugin 'airblade/vim-gitgutter'			" git status
Plugin 'scrooloose/nerdtree'			" file system explorer
Plugin 'tpope/vim-commentary'		" commenter
Plugin 'ctrlpvim/ctrlp.vim' 			" fuzzy file finder
Plugin 'editorconfig/editorconfig-vim' 		" editor config
Plugin 'rking/ag.vim'				" search
Plugin 'Lokaltog/vim-easymotion'		" simple search
Plugin 'terryma/vim-multiple-cursors'		" multiple cursors
Plugin 'fatih/vim-go'				" golang
Plugin 'henrik/vim-qargs' 			" copy quicklist to args
Plugin 'regedarek/ZoomWin'			" zoom window
Plugin 'jiangmiao/auto-pairs'			" auto pairs
Plugin 'chrisbra/csv.vim'			" csv
Plugin 'dahu/vim-fanfingtastic'			" ft,; improved
Plugin 'takac/vim-hardtime'			" force stop repeating the basic movement keys



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
