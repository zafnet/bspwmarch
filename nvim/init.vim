"   o8o               o8o      .                    o8o                    
"   `"'               `"'    .o8                    `"'                    
"  oooo  ooo. .oo.   oooo  .o888oo      oooo    ooo oooo  ooo. .oo.  .oo.   
"  `888  `888P"Y88b  `888    888         `88.  .8'  `888  `888P"Y88bP"Y88b  
"   888   888   888   888    888          `88..8'    888   888   888   888  
"   888   888   888   888    888 .   .o.   `888'     888   888   888   888  
"  o888o o888o o888o o888o   '888i'  Y8P    `8'     o888o o888o o888o o888o 
"
" CONFIGURACIONES BASICAS

set laststatus=0           "mostrar la línea de estado siempre puede ver el modo actual,nombre del archivo,estado del archivo,la regla, etc
set ruler                 " mostrar la columna actual en la barra de estado
syntax on
set title                 " Muestra el nombre del archivo en la ventana de la terminal
set number                " Muestra el nombre del archivo en la ventana de la terminal
set relativenumber        "muestra numero relativo
set mouse=a               " Permite la integración del mouse (seleccionar texto, mover el cursor)
set clipboard=unnamedplus
set encoding=utf-8
set scrolloff=4
set tabstop=8
set laststatus=2
set noshowmode            "Cómo deshacerse de la barra de línea de comando de abajo INSERT 
"set colorcolumn=120      " Muestra la columna límite a 120 caracteres se puede modificar
"set ignorecase           " Ignorar mayúsculas al hacer una búsqueda
"set smartcase            "No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es       " Corregir palabras usando diccionarios en inglés y español
"set background=light     "Fondo del tema: light o dark
"colorscheme              "poner Nombre de tema fijo ejemplo colorscheme zellner


"LOS QUE ESTAN COMENTADOS

"set nowrap               " No dividir la línea si es muy larga
"set termguicolors  " Activa true colors en la terminal


" RENGLON COLOREADO

set cursorline           "resalta la linea actual y las de abajo puedo colocar color fondo y frente le agregan hi cterm es para la terminal y el guibg es para cuando esta en grafico
hi CursorLine cterm=NONE ctermbg=brown " color para la linea actual de fondo ctermbg= color de fondo
hi CursorLineNr ctermbg=brown ctermfg=11
hi LineNr ctermbg=NONE ctermfg=red


" EXPLORADOR
map e :Vexplore<Return>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 20

" MAPEOS
map WQ :wq<Return>
map WW :w<Return>
map q :q<Return>
"map t :! preconv % \| groff -tbl -e -ms > %.pdf<CR><CR>
"map T :! zathura %.pdf & disown<CR><CR>

" STATUSBAR
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
