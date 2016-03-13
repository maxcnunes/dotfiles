" this file is loaded BEFORE plugins

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

if has('gui_running')
  if filereadable(expand("~/.gvimrc.before"))
    source ~/.gvimrc.before
  endif
endif
