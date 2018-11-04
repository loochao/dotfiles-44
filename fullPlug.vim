" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/vim-plug'

" Extras
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'dylanaraps/wal.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ying17zi/vim-live-latex-preview'
Plug 'w0rp/ale'
"Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'

" if has('nvim')
" 	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
" 	Plug 'Shougo/deoplete.nvim'
" 	Plug 'roxma/nvim-yarp'
" 	Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Initialize plugin system
call plug#end()

" Deoplete enable
" let g:deoplete#enable_at_startup = 1

" Syntastic changes
" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_cpp_compiler = 'gcc'
" let g:syntastic_cpp_compiler_options = ' -std=c++11'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_mode_map = {
" 			\ "mode": "active",
" 			\ "passive_filetypes": ["asm"] }

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

let g:ale_linters = {
\   'cpp': ['gcc'],
\}

let g:ale_c_parse_makefile = 1

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

nnoremap g= :call Format()<CR>

" CtrlP changes
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"Change Nerd Tree Directory Symbols
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" Colorscheme and General Themes
colorscheme wal
let g:airline_theme = 'wal'
let g:airline#extensions#ale#enabled = 1

"tmux cursor fix
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Map ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>
