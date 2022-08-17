" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

let g:python3_host_prog = '~/.virtualenv/neovim/bin/python'

" ---------------------------------------------------------------------------

" Automated installation of vim-plug if not installed

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'preservim/nerdtree' |
	\ Plug 'scrooloose/nerdtree-project-plugin' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin' |
	\ Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()

" ---------------------------------------------------------------------------
"  GENERAL CONFIG

" Set Vim's internal encoding
set encoding=utf8

" Set the leader key
let mapleader = ";"
let maplocalleader = ";"

" Put the swap files in another folder
set undodir=~/.nvim/undo
set directory=~/.nvim/swp
set backupdir=~/.nvim/backup

" Use // to search for Visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" ---------------------------------------------------------------------------
"  EDITOR CONFIG

" Use relative line numbers
set number relativenumber

" Quick save and quit
map <silent> <leader>w :w<CR>
map <silent> <leader>q :q<CR>
map <silent> <leader>wq :wq<CR>

" Fancy statusbar
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Clear highlighting with <esc>
nnoremap <silent> <esc> :noh<cr><esc>

" Underline cursor line quick (when pairing)
map <silent> <leader>u :set cursorline!<CR>

" Quick switch buffers
map <silent> <leader>h :update \| bp<CR>
map <silent> <leader>l :update \| bn<CR>
map <silent> <leader>ls :update \| ls<CR>

" Movement without the memory
map <silent> <leader>j <C-d>
map <silent> <leader>k <C-u>
map <silent> <leader>J <C-f>
map <silent> <leader>K <C-b>
let g:smoothie_experimental_mappings = v:true

" Single Normal Mode Command Remaps
inoremap II I
inoremap AA A
inoremap OO O

" ---------------------------------------------------------------------------
" SYNTAX CONFIG

" Enable indentation for files
filetype plugin indent on

" In Insert mode: Use the appropriate number of spaces to insert a <TAB>
set expandtab shiftwidth=2 softtabstop=2 tabstop=2

" Smart autoindenting when starting a new line
set smartindent

" Don't wrap lines
set nowrap

" ---------------------------------------------------------------------------
" CoC SPECIFIC SETTINGS

" Give more space for displaying messages.
set cmdheight=2

" Reduce update time
set updatetime=300

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" CoC language servers
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-pyright',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-tsserver'
\ ]

" ---------------------------------------------------------------------------
"  NERDTree SPECIFIC SETTINGS

let NERDTreeIgnore = ['\.pyc$', '\.swp$', '.DS_Store', '\.git$', '__pycache__$', '\.pytest_cache$']
let NERDTreeShowHidden=1
map <silent> <leader>n :update \| NERDTreeToggle<CR>
map <silent> <leader>b :update \| NERDTreeFind<CR>

" ---------------------------------------------------------------------------
"  FZF SPECIFIC CONFIG

nmap <silent> <leader>ff :update \| FZF<CR>
nmap <silent> <leader>gf :update \| :GFiles?<CR>
nmap <silent> <leader>fh :History/

" ---------------------------------------------------------------------------
"  AG/ACK SPECIFIC CONFIG

let g:ackprg = 'ag --nogroup --nocolor --column'


" ---------------------------------------------------------------------------
"  AIRLINE SPECIFIC SETTINGS

let g:airline_theme='sol'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " only show filename in buffer tabline tabs
let g:airline_powerline_fonts = 1
