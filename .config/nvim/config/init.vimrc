call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'goatslacker/mango.vim'
Plug 'croaker/mustang-vim'
Plug 'w0ng/vim-hybrid'

" general
" Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'haya14busa/incsearch.vim'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'

" editing
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides' " `,ig` to toggle
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'justinmk/vim-sneak'
Plug 'vim-scripts/camelcasemotion'

" eye candy
Plug 'myusuf3/numbers.vim'
Plug 'bling/vim-airline'

" programming
Plug 'mattn/emmet-vim'
Plug 'guileen/vim-node-dict'
Plug 'moll/vim-node'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/html5.vim'
Plug 'othree/csscomplete.vim'
Plug '1995eaton/vim-better-javascript-completion'
Plug 'gavocanov/vim-js-indent'
Plug 'benekastah/neomake'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'hail2u/vim-css3-syntax'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'mxw/vim-jsx'

call plug#end()
