if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('joshdick/onedark.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('othree/yajs.vim')
  call dein#add('othree/es.next.syntax.vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('maxcnunes/syntastic-local-eslint.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'} )
  call dein#add('tpope/vim-commentary')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('rking/ag.vim')
  call dein#add('Lokaltog/vim-easymotion')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('fatih/vim-go')
  call dein#add('henrik/vim-qargs')
  call dein#add('regedarek/ZoomWin')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('chrisbra/csv.vim')
  call dein#add('dahu/vim-fanfingtastic')
  call dein#add('takac/vim-hardtime')
  call dein#add('leafgarland/typescript-vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
