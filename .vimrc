" ========== Vim-Plug Plugin Manager ==========
call plug#begin('~/.vim/plugged')

" File explorer & icons
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Statusline
Plug 'itchyny/lightline.vim'

" Completion engine (VSCode-like)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Auto close tags & pairs
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" JavaScript / TypeScript support
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'

" HTML5 & CSS3 syntax
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" Emmet for fast HTML/CSS coding
Plug 'mattn/emmet-vim'

" Linting and fixing
Plug 'dense-analysis/ale'

" Git integration
Plug 'tpope/vim-fugitive'

" Commenting and surrounding text
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Live server for web preview
Plug 'wolandark/vim-live-server'

" Gruvbox theme (dark mode)
Plug 'morhetz/gruvbox'

call plug#end()

" ========== General Settings ==========

set number                  " Show line numbers
set expandtab               " Use spaces instead of tabs
set tabstop=2               " Number of spaces per tab
set shiftwidth=2            " Number of spaces for auto-indent
set smartindent             " Auto indent new lines
set nowrap                  " Do not wrap long lines
set mouse=                  " Disable mouse support
set termguicolors           " Enable true color support
set background=dark         " Tell Vim terminal background is dark

" Set the colorscheme to gruvbox
colorscheme gruvbox

" ========== Lightline config ==========
let g:lightline = { 'colorscheme': 'gruvbox' }

" ========== Key mappings ==========

" Map Ctrl+n to toggle NERDTree (Ctrl+b genelde tmux vb. programlarda kullanılır)
nnoremap <C-b> :NERDTreeToggle<CR>

" Alternative toggle with F2
nnoremap <F2> :NERDTreeToggle<CR>

nnoremap <C-p> :Files<CR>              " Ctrl+p to open fuzzy file finder (fzf)
nnoremap <C-f> :Rg<CR>                 " Ctrl+f to search text (fzf + ripgrep)
nnoremap <C-s> :w<CR>                  " Ctrl+s to save file
inoremap <C-s> <Esc>:w<CR>a            " Ctrl+s to save in insert mode
nnoremap <C-q> :q<CR>                  " Ctrl+q to quit

" ========== Emmet ==========
let g:user_emmet_leader_key = '<C-e>'

" ========== ALE (linting) config ==========
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'html': ['tidy'],
\   'css': ['stylelint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}
let g:ale_fix_on_save = 1

" ========== coc.nvim settings ==========
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ========== vim-closetag ==========
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'

" ========== Highlight TODO, FIXME ==========
syntax match TodoComment "\v<(TODO|FIXME|HACK):"
highlight link TodoComment Todo
