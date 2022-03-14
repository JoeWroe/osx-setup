" REQUIRED

set nocompatible							                                                          " Use Vim settings, rather than Vi settings
	
let mapleader = ";"						                                                         	" Set leader key, leader keys prefix any other key to convert it to a shortcut command
let maplocalleader = ";"

" PLUGINS

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()							                                                        " Set runtime to include Vundle and initialize

Plugin 'VundleVim/Vundle.vim'						                                                " let Vundle manage Vundle, required
Plugin 'valloric/youcompleteme'					                                               	" Completion hints
Plugin 'scrooloose/nerdtree'						                                                " A NERDy file browser
Plugin 'sheerun/vim-polyglot'                                                           " Lorra lorra language support
Plugin 'wellle/context.vim'                                                             " Creates context window when scrolling
Plugin 'psliwka/vim-smoothie'                                                           " Scrolls, doesn't jump
Plugin 'wellle/targets.vim'                                                             " Adds loadsa new target commands, the docs are helpful for this one
Plugin 'markonm/traces.vim'                                                             " Range, Pattern and Substitute preview

call vundle#end()					                                                          		" All plugins must be added before this line
filetype plugin on				                                                         			" required

" SETUP

colorscheme desert				                                                         			" Set colour scheme

set history=1000					                                                          		" Increase command history
set showcmd								                                                              " Show incomplete commands
set showmode							                                                             	" Show current mode at bottom
set undofile							                                                             	" Maintain undo history between session
set undodir=$HOME/.vim/undodir	                                              					" Store undo history files 

set directory=$HOME/.vim/swpdir//					                                              " Store .swp files
set spellfile=$HOME/.vim/spelldir/en.utf-8.add				                                  " Store dodgy spellings
set nobackup								                                                            " Disable backup files
set exrc								                                                                " Enable project specific .vimrc

" let g:netrw_altv=1				                                                        			" Open files from netrw on right side of screen
" let g:netrw_winsize=80		                                                     					" Open files from netrw with width as % of window
" let g:netrw_keepdir=0			                                                       				" Keep current directory the same as the browsing directory

" EDITOR

set number							      	                                                        " Enable line numbers
set relativenumber				                                                        			" Show line numbers relative to cursor position
set laststatus=2					                                                           		" enable status bar
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ 	                    " Fancy status bar
set wildmenu								                                                            " Enable tab autocomplete for commands
set ruler								                                                                " Enable ruler in bottom right
set cursorline								                                                          " Enable underline of current cursor line
set backspace=indent,eol,start						                                              " More powerful backspacing

" SYNTAX

set encoding=utf-8							                                                        " Support Unicode
filetype plugin indent on						                                                    " Enable indenting for files
set autoindent								                                                          " Enable auto indenting
set tabstop=2								                                                            " Set with of tab
set shiftwidth=2							                                                          " When indenting with '>', use 2 spaces
set expandtab								                                                            " Insert spaces for tabs
set nowrap								                                                              " Don't wrap lines
set linebreak								                                                            " Prevent line wrapping mid-word
syntax enable						                                                              	" Enable syntax highlighting

" SEARCH

set incsearch								                                                            " Search whilst typing
set hlsearch								                                                            " Highlight searches
set ignorecase								                                                          " Ignore case when searching...
set smartcase								                                                            " ...unless you've typed a capital



" PLUGINS

"NERDTree

" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '∆'
let g:NERDTreeDirArrowCollapsible = ' ▾'
let g:NERDTreeNodeDelimiter = "\u00a0"

" vim-terraform

let g:terraform_align=1							                                                    " Align automatically with Tabularize
let g:terraform_fold_sections=1						                                              " Fold terraform blocks until unfolded
let g:terraform_fmt_on_save=1						                                                " Format Terraform files on save

" you-complete-me

let g:ycm_server_python_interpreter = ''				                                        " Sets Python version used by YCM

" context

let g:context_nvim_no_redraw = 1                                                        " Reduce CPU usage when scrolling to prevent flicker.



" KEY REMAPS

" move selected block up one line
vnoremap K :m '<-2<cr>gv=gv						

" Move selected block down one line
vnoremap J :m '>+1<cr>gv=gv

" Staying in insert mode, go to just before the first non-blank text on a line
inoremap II <Esc>I

" Staying in insert mode, go to the end of the line
inoremap AA <Esc>A

" Staying in insert mode, start editing on a new line above the current line
inoremap OO <Esc>O

" Staying in insert mode, start editing on a new line below the current line
inoremap Oo <Esc>o



" LEADER (Don't put comments on the same line as remaps...)


" Open the NERDTree
nnoremap <leader>1 :NERDTreeToggle<CR>

" Toggle spell checker with <leader>s
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>

" Turn off highlighting
noremap <leader>h :noh<CR>

" Quick save
noremap <leader>w :w<CR>

" Nicer :bp (previous file in buffer)
noremap <leader>j :w<CR> <bar> :bp<CR>

" Nicer :bn (next file in buffer)
noremap <leader>k :w<CR> <bar> :bn<CR>
