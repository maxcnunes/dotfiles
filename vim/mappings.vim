" Most keyboard mappings go here!
" ===============================

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
