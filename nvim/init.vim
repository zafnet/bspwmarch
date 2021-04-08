"   o8o               o8o      .                    o8o                    
"   `"'               `"'    .o8                    `"'                    
"  oooo  ooo. .oo.   oooo  .o888oo      oooo    ooo oooo  ooo. .oo.  .oo.   
"  `888  `888P"Y88b  `888    888         `88.  .8'  `888  `888P"Y88bP"Y88b  
"   888   888   888   888    888          `88..8'    888   888   888   888  
"   888   888   888   888    888 .   .o.   `888'     888   888   888   888  
"  o888o o888o o888o o888o   '888i'  Y8P    `8'     o888o o888o o888o o888o 
"
" Configuraciones basicas
set laststatus=0
set ruler
syntax on
set title
set number
set relativenumber
set cursorline
set mouse=a
set scrolloff=4
set tabstop=8
set laststatus=2
set noshowmode

" Explorador
map e :Vexplore<Return>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 20

" Renglon coloreado
hi CursorLine cterm=NONE ctermbg=7
hi CursorLineNr ctermbg=7 ctermfg=11
hi LineNr ctermbg=0 ctermfg=7

" Mapeos
map WQ :wq<Return>
map WW :w<Return>
map q :q<Return>
map t :! preconv % \| groff -tbl -e -ms > %.pdf<CR><CR>
map T :! zathura %.pdf & disown<CR><CR>


" Statusbar
let g:currentmode={
   \ 'n'  : 'Normal',
   \ 'v'  : 'Visual',
   \ "\<C-V>" : 'V·Bloque',
   \ 'V'  : 'V·Linea',
   \ 'i'  : 'Insertar',
   \ 'R'  : 'Reemplazar',
   \ 'Rv' : 'V·Reemplazar',
   \ 'c'  : 'Comando',
   \ 'cv' : 'Vim Ex',
   \ 'r'  : 'Consola',
   \ 'r?' : 'Confirmar',
   \}

set statusline=%#color#\ \%{toupper(g:currentmode[mode()])}\ 
set statusline+=%4*%m
set statusline+=%3*\ \%f\ 
set statusline+=%2*\ \%y%r%w\ 
set statusline+=%1*\ \%=
set statusline+=%6*\ %L/%l
set statusline+=%5*:%c\ 
set statusline+=%#color#\ \%{StatusMode()}\ 

hi statusline ctermfg=8 ctermbg=15
hi StatusLineNC cterm=bold ctermbg=8 ctermfg=15
hi User1 ctermbg=8 ctermfg=0
hi User2 ctermbg=13 ctermfg=0
hi User3 ctermbg=11 ctermfg=0
hi User4 ctermbg=9 ctermfg=0
hi User5 ctermbg=10 ctermfg=0
hi User6 cterm=bold ctermbg=10 ctermfg=0

function! StatusMode()
	if mode() ==?'n'
		hi color cterm=bold ctermbg=8 ctermfg=15
	elseif mode() ==?'i'
		hi color cterm=bold ctermbg=14 ctermfg=0
	elseif mode() ==?'v'
		hi color cterm=bold ctermbg=11 ctermfg=0
	elseif mode() ==?'r'
		hi color cterm=bold ctermbg=9 ctermfg=0
	elseif mode() ==?'c'
		hi color cterm=bold ctermbg=15 ctermfg=8
	endif
	return mode()
endfunction
