call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

" ------------------------------
" General settings
" ------------------------------
" Set the leader key
let mapleader = ','
set cursorline
set relativenumber
set number
set nowrap
set winheight=10
set winminheight=10
set winwidth=30
set winminwidth=30
set foldmethod=manual

" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert
" set 'updatetime' to 5 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
au InsertLeave * let &updatetime=updaterestore

" Stop the preview window from opening whenever using omnicomplete
set completeopt-=preview

" Setting this to 100ms seems to make vim slow and gets in the way
" of Ctrl-P sometimes?
"set updatetime=100

" Commenting this out after mapping CapsLock to Esc, I can more easily type
" <c-[> instead of jj (which is kind of jarring anyway)
imap jj <Esc>

" To exit terminal mode, map Esc to the correct sequence.
tnoremap <Esc> <C-\><C-N>
" ------------------------------
" Navigation
" ------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Navigate windows with C-hjkl, auto-zoom height+width and move cursor to left
" margin
nnoremap <c-h> <c-w>h<c-w>_<c-w><bar>0
nnoremap <c-j> <c-w>j<c-w>_<c-w><bar>0
nnoremap <c-k> <c-w>k<c-w>_<c-w><bar>0
nnoremap <c-l> <c-w>l<c-w>_<c-w><bar>0
" Map ,z to zoom a window manually
nmap <leader>z <c-w>_<c-w><bar>0

" Get information on a Go function, method, variable under the cursor
nnoremap <leader>i :GoInfo<CR>

" Colors
let g:rehash256 = 1
let g:molokai_original = 1
set background=dark
silent! colorscheme molokai

" ------------------------------
" Quickfix location always at the bottom, otherwise
" it can open in the wrong split.
" ------------------------------
autocmd FileType qf wincmd J

" ------------------------------
" Language: Go
" ------------------------------
autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" Show info in the status 
" This seems to get in the way of Ctrl+P
"let g:go_auto_type_info = 1
let g:go_def_mode = "gopls"
" Run goimports when running :GoFmt
let g:go_fmt_command = "goimports"
" Highlighting galor!
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" variables of the same name
let g:go_auto_sameids = 1

" GoTestCompile
nnoremap <leader><leader>b :GoTestCompile<cr>

"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
au FileType proto set expandtab
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

"----------------------------------------------
" Language: Make
"----------------------------------------------
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2
