set nocompatible
syntax on "Enable syntax highlighting
filetype plugin indent on
runtime macros/matchit.vim

set number relativenumber
set nu rnu
set nowrap " dont wrap lines
set tabstop=4 " a tab is 4 spaces

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set autoindent " always set autindenting on
set copyindent " copy the previous indenting on autoindenting
set shiftwidth=4 " number of spaces to use for autoindenting
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase
" case-sensitive otherwise
set smarttab " insert tabs on the start of a line according to 
" shiftwidth , not tabstop
set hlsearch    " highlight search terms
set incsearch " show search matches as you type
set expandtab
set softtabstop=4
set textwidth=80

set mouse=a

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tek/vim-textobj-ruby')

" ESC in NEOVIM for fzf window
if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

autocmd BufRead, BufNewFile *.md filetype=markdown
autocmd BufRead, BufNewFile *.adoc filetype=asciidoc

autocmd FileType markdown setlocal spell
autocmd FileType asciidoc setlocal spell

func! WordProcessorMode()
    setlocal textwidth=80
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu

com! WP call WordProcessorMode()

let mapleader =',' 
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
