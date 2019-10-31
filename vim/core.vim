"
"           __________  ____  ______
"          / ____/ __ \/ __ \/ ____/
"         / /   / / / / /_/ / __/
"        / /___/ /_/ / _, _/ /___
"        \____/\____/_/ |_/_____/
"
"
"====================================================
"{{{ BASIC VARIABLE SETTINGS
"====================================================
set number relativenumber
set tabstop=2 softtabstop=2 shiftwidth=2 shiftround noexpandtab
set showcmd mouse=a
set ignorecase smartcase incsearch showmatch hlsearch
set autoread virtualedit+=block lazyredraw
set showmatch noshowmode
set wildmenu wildmode=full
set undofile
set undodir=$HOME/.vim/undo
set spelllang=en_us
set signcolumn=yes
set splitright splitbelow
set exrc

filetype plugin indent on
syntax on

" Turn On OmniComplete
set omnifunc=syntaxcomplete#Complete
let &showbreak='-> '
"====================================================
"}}}
"====================================================

"====================================================
"{{{ FORMATTING
"====================================================
function! RemoveTrailingSpaces()
	silent! execute '%s/\s\+$//ge'
endfunction

function! Format()
	silent! execute 'norm! mz'

	if &ft ==? 'c' || &ft ==? 'cpp' || &ft ==? 'php'
		set formatprg=astyle\ --mode=c
		silent! execute 'norm! gggqG'
	elseif &ft ==? 'java'
		set formatprg=astyle\ --mode=java
		silent! execute 'norm! gggqG'
	endif

	silent! call RemoveTrailingSpaces()
	silent! execute 'retab'
	silent! execute 'gg=G'
	silent! execute 'norm! `z'
	set formatprg=
endfunction

nnoremap <silent> g= :call Format()<CR>

autocmd BufWrite *.cpp :call RemoveTrailingSpaces()
autocmd BufWrite *.h :call RemoveTrailingSpaces()
autocmd BufWrite *.py :call RemoveTrailingSpaces()
autocmd BufWrite *.sql :call RemoveTrailingSpaces()
autocmd BufWrite *.txt :call RemoveTrailingSpaces()
"====================================================
"}}}
"====================================================

"====================================================
"{{{ FOLD SETTINGS
"====================================================
set foldmethod=syntax

nnoremap za zA
nnoremap zA za

nnoremap <silent> zl zo
nnoremap <silent> zh zc
nnoremap <silent> zL zO
nnoremap <silent> zH zC
"====================================================
"}}}
"====================================================

"====================================================
"{{{ FILETYPE SPECIFIC SETTINGS
"====================================================
augroup FiletypeGroup
	autocmd!
	" .ts is a Typescript file
	autocmd BufNewFile,BufRead *.ts set filetype=typescript
	autocmd BufNewFile,BufRead *.rasi set filetype=css

	autocmd Filetype asm setlocal shiftwidth=8 softtabstop=8
	autocmd Filetype vim setlocal foldmethod=marker
	autocmd Filetype tmux setlocal foldmethod=marker
	autocmd Filetype xdefaults setlocal foldmethod=marker
	autocmd Filetype python setlocal shiftwidth=4 softtabstop expandtab
	autocmd Filetype vimwiki setlocal foldlevel=10 expandtab tabstop=2 softtabstop=2
	autocmd Filetype tex setlocal textwidth=80
augroup END
"====================================================
"}}}
"====================================================

"====================================================
"{{{ GENERAL RE-MAPS
"====================================================
let mapleader = " "
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <silent> H ^
nnoremap <silent> L g_
xnoremap <silent> H ^
xnoremap <silent> L g_

nnoremap gC :tabnew<CR>

nnoremap <silent> g<CR> :noh<CR>

inoremap <silent> kj <Esc>

" move visual selection up/down line at a time
xnoremap <silent> K <Esc>'<kdd'>pgv
xnoremap <silent> J <Esc>'>jdd'<Pgv

" Show highlight group of character/word under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <silent> <F10> :call SynStack()<CR>

nnoremap <silent> <leader>pd "=strftime("%m-%d-%Y")<CR>p
"====================================================
"}}}
"====================================================

"====================================================
"{{{ SPLITS
"====================================================
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l

nnoremap <silent> <leader>H <C-w>H
nnoremap <silent> <leader>J <C-w>J
nnoremap <silent> <leader>K <C-w>K
nnoremap <silent> <leader>L <C-w>L

nnoremap <silent> <leader><C-h> :vertical resize +5<CR>
nnoremap <silent> <leader><C-j> :resize +5<CR>
nnoremap <silent> <leader><C-k> :resize -5<CR>
nnoremap <silent> <leader><C-l> :vertical resize -5<CR>

nnoremap <silent> <leader>\ :vnew<CR>
nnoremap <silent> <leader>- :new<CR>

nnoremap <silent> <C-w><C-h> :vertical resize +5<CR>
nnoremap <silent> <C-w><C-j> :resize +5<CR>
nnoremap <silent> <C-w><C-k> :resize -5<CR>
nnoremap <silent> <C-w><C-l> :vertical resize -5<CR>

if has('nvim')
	set inccommand=split
	tnoremap <silent> <Esc> <C-\><C-n>
endif
"====================================================
"}}}
"====================================================

"====================================================
"{{{ VIM SPECIFIC
"====================================================
if has('vim')
	set background=dark
	colorscheme darkblue
endif
"====================================================
"}}}
"====================================================
