" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'dylanaraps/wal.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ying17zi/vim-live-latex-preview'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

if has('nvim')
	Plug 'w0rp/ale'
else
	Plug 'vim-syntastic/syntastic'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system
call plug#end()

" turn on completion in comments
let g:ycm_complete_in_comments=1
" load ycm conf by default
let g:ycm_confirm_extra_conf=0
" turn on tag completion
let g:ycm_collect_identifiers_from_tags_files=1
" start completion from the first character
let g:ycm_min_num_of_chars_for_completion=2
"Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Deoplete enable
let g:deoplete#enable_at_startup = 1

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fal :BLines<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fc :Commits<CR>

if has('nvim')
	" ALE changes
	let g:ale_linters = {
				\'cpp': ['gcc'],
				\'typescript': ['tsserver']
				\}

	let g:ale_fixers = {
				\'javascript': 'prettier',
				\'typescript': 'prettier',
				\}

	"ALE completion
	let g:ale_completion_enabled = 1

	"ALE parses makefiles in parent dirs
	let g:ale_c_parse_makefile = 1

	"Filetype fix for TS
	augroup FiletypeGroup
		autocmd!
		" .ts is a Typescript file
		au BufNewFile,BufRead *.ts set filetype=typescript
	augroup END

else
	" Syntastic changes
	let g:syntastic_cpp_checkers = ['gcc']
	let g:syntastic_cpp_compiler = 'gcc'
	let g:syntastic_cpp_compiler_options = ' -std=c++11'
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_mode_map = {
				\ "mode": "active",
				\ "passive_filetypes": ["asm"] }

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
endif

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

set list
set listchars=tab:\|\ 
hi NonText ctermfg=8