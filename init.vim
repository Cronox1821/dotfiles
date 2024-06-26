:set number
:set relativenumber
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
" /user/$USERPROFILE$/appdata/local/nvim/plugged (WINDOWS)
call plug#begin(stdpath('config').'/plugged')

Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/vim-airline/vim-airline' " Status Bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Scheme
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/mg979/vim-visual-multi' " Multi Cursor
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/sheerun/vim-polyglot' " Better syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" NerdTree & Tagbar Toggles & Customization

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let mapleader = ' '
nnoremap <leader>pv :Ex<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Run Code
"augroup compileandrun
"    autocmd!
"    autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
"augroup END

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Customization

        " Important!!
if has('termguicolors')
        set termguicolors
endif

""""""""""""""""""""" Sonokai 

" The configuration options should be placed before `colorscheme sonokai`.

let g:sonokai_style = 'andromeda'

"let g:sonokai_better_performance = 1 

let g:airline_theme = 'sonokai'

:set completeopt-=preview " No Preview

colorscheme sonokai

" Keybind COC

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
