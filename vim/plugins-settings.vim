" All plugins configurations go here!
" ===================================

""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_powerline_fonts=1
set noshowmode
let g:airline#extensions#tabline#enabled = 1 		" show buffer in tabs


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


""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""
map <leader>b :Buffers<cr>
map <leader>f :Files<cr>
let g:fzf_layout = { 'down': '~20%' }

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
let g:ale_go_golangci_lint_options = '--fast'
let g:ale_go_golangci_lint_package = 1
let g:ale_linters = {
\   'go': ['golangci-lint'],
\   'javascript': ['flow-language-server'],
\}
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""
let g:go_imports_autosave = 1
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

" typescript lint
" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
