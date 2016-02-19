" All status line configuration goes here

set cmdheight=2
set display+=lastline

" general config
set laststatus=2 " always show status line
set showtabline=2 " always show tabline
set noshowmode " hide default mode text (e.g. INSERT) as airline already displays it

" airline config
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1  " buffers at the top as tabs
let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extensions#tmuxline#enabled=0
let g:airline_theme = 'bubblegum'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''

let g:airline#extensions#quickfix#quickfix_text = 'QF'
let g:airline#extensions#quickfix#location_text = 'LL'

" disable unused extensions (performance)
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#capslock#enabled   = 0
let g:airline#extensions#csv#enabled        = 0
let g:airline#extensions#ctrlspace#enabled  = 0
let g:airline#extensions#eclim#enabled      = 0
let g:airline#extensions#hunks#enabled      = 0
let g:airline#extensions#nrrwrgn#enabled    = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#syntastic#enabled  = 0
let g:airline#extensions#taboo#enabled      = 0
let g:airline#extensions#tagbar#enabled     = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" tmuxline config
let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'b': '#F',
        \ 'c': '#W',
        \ 'win': ['#I', '#W'],
        \ 'cwin': ['#I', '#W'],
        \ 'x': '#h',
        \ 'y': '%b %d',
        \ 'z': '%R'}
