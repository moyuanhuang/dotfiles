" Start loading plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/groovy.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'

" Git(hub) integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Commenting
Plug 'tpope/vim-commentary'

" Vim Surround
Plug 'tpope/vim-surround'

" Indent guide
Plug 'Yggdroot/indentLine'

" Fuzzy file finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" In-file content search
Plug 'mileszs/ack.vim'

" Auto-formatting
" Plug 'Chiel92/vim-autoformat'

" Expand-region
Plug 'terryma/vim-expand-region'

" Air-line
Plug 'vim-airline/vim-airline'

" Color schemes and vim-airline
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-airline/vim-airline-themes'

" Try to use this but it's too lagging bro
" Plug 'Valloric/YouCompleteMe'

" Linter
Plug 'vim-syntastic/syntastic'

" Add plugins to &runtimepath
call plug#end()


" ===========================
" Color scheme
" ===========================
set background=dark
set termguicolors
colorscheme deep-space
let g:airline_theme='deep_space'

" set the vim's terminal emulator color scheme
let g:terminal_ansi_colors = [
  \ "#373c40", "#cc6666", "#8cc85f", "#e3c78a",
  \ "#80a0ff", "#ce76e8", "#7ee0ce", "#c9c9c9",
  \ "#f09479", "#f74782", "#42cf89", "#cfcfb0",
  \ "#78c2ff", "#ae81ff", "#85dc85", "#e2637f"
  \]


" ===========================
" Chores
" ===========================
" Backspace act as expected
set backspace=indent,eol,start

" Use 2 spaces for indentation
set shiftwidth=2

" Write spaces instead of tabs when hitting <tab>
set expandtab

" Write exactly 2 spaces when hitting <tab>
set tabstop=2

" Navigate to search results while typing
set incsearch

" Highlight search results
set hlsearch

" Turn on line number
set number

" Enable indent guide
let g:indentLine_char = '¦'

" Escape don't back one char
set timeoutlen=300
inoremap fj x<C-c>"_x

" Update time set to 100
set updatetime=100

" Shift-Tab and Tab for indentation
nnoremap <S-Tab> <<
nnoremap <Tab> >>

" Map leader key to ,
let mapleader = ","


" ===========================
" Turn on mouse scroll
" ===========================
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>


" ===========================
" autoformat settings
" ===========================
noremap <leader>a :Autoformat<CR>
let g:formatters_ruby = ['rubocop']
let g:formatdef_rubocop = "'~/bin/rubocop-auto-correct-range '.a:firstline.' '.a:lastline.' '.bufname('%')"
let g:formatdef_brittany = '"brittany"'


" ===========================
" Ack.vim
" ===========================
if executable('rg')
  let g:ackprg = 'rg --sort-files --vimgrep'
endif
" Shortcuts for Ack
nmap <leader>f :Ack!<space>
nmap <leader>w :Ack!<space><cword><CR>
" Modify ack.vim mappings
let g:ack_mappings = {
  \ "<C-X>": "<C-W><CR><C-W>K",
  \ "<C-V>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t" }


" ===========================
" fzf
" ===========================
" Set location of fzf binary for fzf.vim
set rtp+=/usr/bin/fzf

" Key mappings for fzf plugin
nmap <leader>t :FZF<CR>
nmap <leader>bb :Buffers<CR>

" Respect .gitignore in fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

" match current color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" ===========================
" linting with vim-syntastic
" ===========================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']


" ===========================
" Airline
" ===========================
" Turn off syntastic warning/err message display
let g:airline#extensions#syntastic#enabled = 0


