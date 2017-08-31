" Configurations of all plugins

""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_loc_list_height = 3				" height
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint', 'jshint']

""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts=1
"let g:airline_theme='powerlineish'
set noshowmode
let g:airline#extensions#tabline#enabled = 1 		" show buffer in tabs


""""""""""""""""""""""""""""""
" ctrlp.vim
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5
noremap <silent> <Leader>bb :CtrlPBuffer<Return>	" open buffer fuzzy list


""""""""""""""""""""""""""""""
" hardtime
""""""""""""""""""""""""""""""
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_ignore_buffer_patterns = [ "NERD.*"  ]
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 5

""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""
noremap <silent> <Leader>t :NERDTreeToggle<Return>	" toggle treeview
noremap <silent> <Leader>f :NERDTreeFind<Return>	" find file
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp']


""""""""""""""""""""""""""""""
" gitx
""""""""""""""""""""""""""""""
" Open GitX (requires gitx in $PATH)
function! s:GitX(...)
  silent exe '!gitx --git-dir='.b:git_dir.' '.join(a:000)
  redraw!
endfunction

augroup ft_gitx
  " Open GitX
  autocmd User Fugitive command! -buffer -nargs=* Gitx call s:GitX(<q-args>)
  autocmd User Fugitive noremap <buffer> <leader>gx :Gitx<cr>

  " Alias Gstage (Opens GitX on stage view)
  autocmd User Fugitive command! -buffer Gstage call s:GitX('-c')
  autocmd User Fugitive noremap <buffer> <leader>gt :Gstage<cr>
augroup END


""""""""""""""""""""""""""""""
" silver searcher
""""""""""""""""""""""""""""""
" Use ag over grep
let g:agp_rg="ag\ --nogroup\ --nocolor\ --column"

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0


""""""""""""""""""""""""""""""
" vim-gitgutter
""""""""""""""""""""""""""""""
" dark column
" highlight SignColumn guibg=233
highlight SignColumn ctermbg=235


""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_list_height = 3

let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter']
" Only executed on saving a go file
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
" Only executed on :GoMetaLinter
" let g:syntastic_go_gometalinter_args = ['--enable-all']
" let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'megacheck']

" Fix showing 2 windows for linter messages
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd FileType go nmap <leader>rt  <Plug>(go-test)
autocmd FileType go nmap <leader>rr  <Plug>(go-run)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy/<C-R><C-R>=substitute(
\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy?<C-R><C-R>=substitute(
\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>
