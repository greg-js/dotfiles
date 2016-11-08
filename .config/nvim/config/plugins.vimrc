filetype plugin indent on

" neomake config
autocmd! BufWritePost * Neomake
" autocmd BufLeave * QFix

let g:neomake_place_signs = 0

let g:neomake_open_list = 2

let g:neomake_javascript_enabled_makers = ['eslint']

" set background=dark
colorscheme apprentice

" make background transparent
hi Normal ctermbg=NONE
hi EndOfBuffer ctermbg=NONE
hi LineNr ctermbg=234

" CtrlP
let g:ctrlp_prompt_mappings={'PrtClearCache()':['<Leader><F5>']}
let g:ctrlp_prompt_mappings={'PrtdeleteEnt()':['<Leader><F7>']}
let g:ctrlp_match_window='bottom,order:btt,min:2,max:25'
set wildmenu " enhanced autocomplete
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot
",*public/css/*,*public/js*

" delimitMate options
let delimitMate_expand_cr=1

" enable matchit (for matching tags with %)
runtime macros/matchit.vim

" vim-sneak settings
hi SneakPluginTarget ctermfg=black ctermbg=181818

" javascript libraries syntax
let g:used_javascript_libs = 'jquery,underscore,react,flux,chai'

" completion
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
    \ 'tern#Complete',
    \ 'jspc#omni'
  \]
endif

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_request_timeout = 1
let g:SuperTabClosePreviewOnPopupClose = 1

" disable colorizer at startup
let g:colorizer_startup = 0
let g:colorizer_nomap = 1

" emmet-vim settings
" let g:user_emmet_settings = { "html": { "quote_char": "'"} }

" rust settings
let g:racer_cmd = "$HOME/.cargo/bin/racer"
let $RUST_SRC_PATH="/usr/src/rust/src"
