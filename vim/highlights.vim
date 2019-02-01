set fillchars=vert:│,stlnc:=
highlight VertSplit ctermbg=black ctermfg=white cterm=none
highlight NonText ctermfg=8
highlight CursorLineNr ctermfg=9

if has('nvim')
	highlight DiffAdd ctermbg=6 ctermfg=232
	highlight DiffText ctermbg=1 ctermfg=232
	highlight IncSearch ctermbg=0 ctermfg=1
	set list
	set listchars=tab:\|\ 
endif

"Highlight columns 81 and 101 on lines with that many characters
autocmd Filetype cpp call matchadd('ColorColumn', '\%81v', 100)
autocmd Filetype cpp call matchadd('ColorColumn', '\%101v', 100)
