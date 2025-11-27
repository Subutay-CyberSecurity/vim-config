" =========================
" =   PLUGIN MANAGER      =
" =========================
call plug#begin('~/.vim/plugged')

" File Explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Statusline
Plug 'itchyny/lightline.vim'

" Completion engine (VSCode-level LSP)
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Snippet engine
Plug 'neoclide/coc-snippets'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'

" Git
Plug 'tpope/vim-fugitive'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Colorscheme
Plug 'morhetz/gruvbox'

call plug#end()


" =========================
" =   GENERAL SETTINGS     =
" =========================
set number
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set nowrap
set mouse=
set termguicolors
set background=dark
colorscheme gruvbox


" =========================
" =   LIGHTLINE           =
" =========================
let g:lightline = { 'colorscheme': 'gruvbox' }


" =========================
" =   KEYMAPS             =
" =========================
" File tree
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <F2>  :NERDTreeToggle<CR>

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

" Save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Quit without saving
nnoremap <C-q> :q!<CR>
inoremap <C-q> <Esc>:q!<CR>


" =========================
" =   COC SETTINGS        =
" =========================

" ENTER → confirm completion
inoremap <silent><expr> <CR> coc#pum#visible()
      \ ? coc#pum#confirm()
      \ : "\<CR>"

" Backspace helper
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" TAB → next completion or indent
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Shift+Tab → previous completion
inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" COC LSP Extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-go'
  \ ]


" =========================
" =   LIVE SERVER         =
" =========================
" Start Live Server from current file's folder
command! StartLiveServer execute 'silent !live-server %:p:h >/dev/null 2>&1 & disown' | redraw!

" Suppress 'written' messages
set shortmess+=W
