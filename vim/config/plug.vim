call plug#begin()

Plug 'rakr/vim-one'

Plug 'vim-airline/vim-airline'

Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'dietsche/vim-lastplace'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'othree/xml.vim'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'ternjs/tern_for_vim'
Plug 'mhartington/deoplete-typescript'

Plug 'mattn/emmet-vim'

Plug 'wakatime/vim-wakatime'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

call deoplete#enable()

let g:emmet_html5 = 0
autocmd FileType html,js,css imap <expr> <tab> emmet#expandAbbrIntelligent('<tab>')
