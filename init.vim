:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" PLUGINS 
" ~/.config/nvim/plugged (UNIX)
" /user/<username>/appdata/local/nvim/plugged (WINDOWS)
call plug#begin(stdpath('config').'/plugged')

Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/vim-airline/vim-airline' " Status Bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
" Plug 'https://github.com/tmhedberg/SimpylFold' " Fold nested python code
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Scheme
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/mg979/vim-visual-multi' " Multi Cursor
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion

call plug#end()

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " No Preview
:colorscheme sonokai

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

