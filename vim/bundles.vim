set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'joshdick/onedark.vim'			" surround
Plugin 'joshdick/airline-onedark.vim'		" surround
Plugin 'tpope/vim-surround'			" surround
Plugin 'othree/yajs.vim'			" js highlight theme
Plugin 'othree/es.next.syntax.vim'		" es7 highlight theme
Plugin 'scrooloose/syntastic'			" linter
Plugin 'pmsorhaindo/syntastic-local-eslint.vim'	" use local eslint
Plugin 'altercation/vim-colors-solarized'	" solarized theme
Plugin 'vim-airline/vim-airline'		" status line
Plugin 'vim-airline/vim-airline-themes'		" status line theme
Plugin 'tpope/vim-fugitive'			" git wrapper 
Plugin 'airblade/vim-gitgutter'			" git status
Plugin 'scrooloose/nerdtree'			" file system explorer
Plugin 'ctrlpvim/ctrlp.vim' 			" fuzzy file finder
Plugin 'editorconfig/editorconfig-vim' 		" editor config
Plugin 'rking/ag.vim'				" search
Plugin 'flazz/vim-colorschemes'		 	" color scheme
Plugin 'Lokaltog/vim-easymotion'		" simple search
Plugin 'brettof86/vim-swigjs'			" swig syntax
Plugin 'gabrielelana/vim-markdown'		" markdown syntax
Plugin 'terryma/vim-multiple-cursors'		" multiple cursors
Plugin 'fatih/vim-go'				" golang
Plugin 'henrik/vim-qargs' 			" copy quicklist to args
Plugin 'regedarek/ZoomWin'			" zoom window
Plugin 'jiangmiao/auto-pairs'			" auto pairs
Plugin 'chrisbra/csv.vim'			" csv



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
