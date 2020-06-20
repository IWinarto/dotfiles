" =============================== Plug-ins ================================== "
call plug#begin("~/.local/share/nvim/plugged/")

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
    " Plug 'jiangmiao/auto-pairs'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-line'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'easymotion/vim-easymotion'

    " Colorschemes
    " Plug 'morhetz/gruvbox'
    " Plug 'danilo-augusto/vim-afterglow'
    Plug 'romainl/Apprentice'
    Plug 'tomasiser/vim-code-dark'
    Plug 'nanotech/jellybeans.vim'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'danilo-augusto/vim-afterglow'
    Plug 'ajh17/Spacegray.vim'
    Plug 'w0ng/vim-hybrid'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'mhartington/oceanic-next'
    " Plug 'mkarmona/colorsbox'

    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif

call plug#end()


" =============================== General =================================== "
syntax enable
filetype plugin indent on

set colorcolumn=121
set tw=120
set fo+=t
set fo-=l
set wrap
set number
set relativenumber
set expandtab
set showmatch
set mouse=a
set tabstop=8
set softtabstop=4
set shiftwidth=4
set background=dark
set backspace=indent,eol,start
set linespace=5
set fileencoding=utf-8
set fillchars+=vert:\|
set autochdir
set clipboard^=unnamed,unnamedplus
set iskeyword-=_


" ================================ Theme ==================================== "
if (has("termguicolors"))
    set termguicolors
endif
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

au ColorScheme * hi clear SignColumn
au ColorScheme * hi clear NonText
au ColorScheme * hi LineNr ctermbg=none guibg=none
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi EndOfBuffer ctermbg=none guibg=none

" colorscheme hybrid
" colorscheme deep-space
" colorscheme hybrid_material
colorscheme afterglow
" colorscheme onedark
" colorscheme codedark
" colorscheme jellybeans
" colorscheme apprentice
" let g:jellybeans_use_term_italics = 1
" colorscheme palenight
" let g:palenight_terminal_italics=1
" colorscheme OceanicNext
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme spacegray
" let g:spacegray_use_italics = 1
" let g:spacegray_low_contrast = 1

let g:airline_theme = 'deus'
" let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1


" ============================== Vim Polyglot =============================== "
let g:python_highlight_space_errors = 0


" ================================ Keys ===================================== "
nnoremap j gj
nnoremap k gk
nnoremap <Esc> :noh<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-d> <Esc>ddi

" enable command plus / or ? (e.g. d/, r?, y?, etc) without highlighting after completion of command"
" onoremap <expr> / "/" . input("") . "\<CR> \| :noh\<CR>"
" onoremap <expr> ? "?" . input("") . "\<CR> \| :noh\<CR>"

let mapleader="\<Space>"
map <Leader> <Plug>(easymotion-prefix)


" =============================== Deoplete ================================== "

if has('nvim')
    " Deoplete completion setups
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_ignore_case = 1
    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif

    " Deoplete tab-completion
    inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<Tab>"

    " Close the preview window after completion
    autocmd CompleteDone * silent! pclose!
endif


" ============================ Auto-commands ================================= "
augroup filetypes
    autocmd!
    autocmd FileType python setlocal omnifunc=jedi#completions
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
    autocmd FileType rust setlocal omnifunc=rustcomplete#Complete
    autocmd FileType haskell setlocal omnifunc=haskellcomplete#Complete
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType make setlocal noexpandtab
augroup end


" ============================== EasyAlign ================================== "
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/tex object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
