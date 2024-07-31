" Depends: NerdFont; git


" --- Plugins (vim-plug) ---
" To install vim-plug:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" or (but don't recommend)
"curl -fLo /usr/share/vim/vimfiles/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()

Plug 'liuchengxu/space-vim-theme'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
" let g:airline_theme='wombat'
" let g:airline_theme='bubblegum'

Plug 'preservim/nerdtree'
map <F9> :NERDTreeToggle<CR>
" let NERDTreeIgnore=['\.DS_Store$', '\.git$'] " ignored files
let NERDTreeShowHidden=1

" Depends: fzf, bat
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

" Depends: universal-ctags(uctags-git)|ctags
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Plug 'voldikss/vim-floaterm'
" Plet g:floaterm_keymap_toggle = '<F12>'
" Plet g:floaterm_width = 0.9
" Plet g:floaterm_height = 0.9

Plug 'ryanoasis/vim-devicons'
" set encoding=utf8
" set guifont=DroidSansMono\ Nerd\ Font\ 11

" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'

" Peekaboo will show you the contents of the registers on the sidebar when you hit [...]
Plug 'junegunn/vim-peekaboo'

Plug 'tmux-plugins/vim-tmux'

" Syntax highlighting for kitty.conf:
Plug 'fladson/vim-kitty'

Plug 'lambdalisue/suda.vim'

" PlugClean
" PlugUpdate
call plug#end()


" --- My customizations ---
" Depends: 'liuchengxu/space-vim-theme':
set background=dark
color space_vim_theme

" -----
noremap <F12> :vertical terminal<CR>
" Ctrl-s to save:
noremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>a

set nu rnu " show number of current line and relative line numbers
"set cursorline   " show a visual line under the cursor's current line
syntax enable " enable syntax highlighting
set mouse=a " enable mouse support in all modes

set wildmenu " visual autocomplete for command menu
set laststatus=2 " display the status line always
set confirm " i.e.: ask instead of cancel
set title

" let mapleader="," " leader is comma

" File format:
"set fileformat=unix

"set nobinary

" Indent:
"filetype indent on " load filetype-specific indent files
filetype plugin indent on
set autoindent   " indent when moving to the next line while writing code

" Tab:
set tabstop=4    " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab    " expand tabs into spaces

"set showmatch    " show the matching part of the pair for () [] and {} (when typing)

" Area de transferencia:
" 'anonymous' register is aliased to the */+ register (Tornar a area de transferencia a mesma do sistema):
"set clipboard=unnamed
"set clipboard=unnamedplus
"inoremap <C-v> <ESC>"+Pa
inoremap <C-v> <C-r><C-o>+
vnoremap <C-v> c<ESC>"+P
vnoremap <C-c> "+y
vnoremap <C-x> "+d

" Search:
set incsearch " search as characters are entered
set hlsearch  " highlight matches
" turn off search highlight:
nnoremap <leader><space> :nohlsearch<CR>

" Fold:
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
" space open/closes folds:
"nnoremap <space> za
nnoremap <space> zA
set foldmethod=indent " fold based on indent level

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" -----
" Fix incorrect keys in tmux
if match($TERM, "screen")!=-1
  set term=xterm-256color
endif

