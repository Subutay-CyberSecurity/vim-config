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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a


" =========================
" =   COC SETTINGS        =
" =========================

" ENTER → tamamlamayı onayla
inoremap <silent><expr> <CR> coc#pum#visible()
      \ ? coc#pum#confirm()
      \ : "\<CR>"

" Backspace kontrol fonksiyonu
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" TAB → tamamlamayı aç / sıradaki öneriye git
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Shift+Tab → önceki öneri
inoremap <silent><expr> <S-Tab>
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" COC LSP extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-go'
  \ ]
