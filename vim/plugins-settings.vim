" All plugins configurations go here!
" ===================================

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
" ale linter
""""""""""""""""""""""""""""""
let g:airline#extensions#ale#enabled = 1 " use airline for ale messages
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}
let g:ale_go_gometalinter_options = '--fast'
" let g:ale_go_gometalinter_options = '--fast --disable=gas --disable=goconst --disable=gocyclo '

""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_list_height = 3
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

""""""""""""""""""""""""""""""
" ultisnips - snippets
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"

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
