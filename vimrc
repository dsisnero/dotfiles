set nocompatible

"Activate filetype detection
filetype plugin indent on 

" activate syntax highlighting
syntax on 

runtime macros/matchit.vim

set number relativenumber
set nu rnu
set nowrap " dont wrap lines
set tabstop=4 " a tab is 4 spaces
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
set complete+=kspell

set mouse=a

" Python 3 provider {{{2
let s:python3_host_prog=expand('$USERPROFILE/venv/neovim3/Scripts/python.exe')
if filereadable(fnameescape(s:python3_host_prog))
    let g:python3_host_prog = fnameescape(s:python3_host_prog)
else
    unlet! g:python3_host_prog
endif


" Providers configuration {{{1

" Ruby provider {{{2
let s:ruby_host_prog = expand('f:/windows/tools/ruby/Ruby30-x64/bin/neovim-ruby-host.bat')
if filereadable(fnameescape(s:ruby_host_prog))
    let g:ruby_host_prog = fnameescape(s:ruby_host_prog)
else
    unlet! g:ruby_host_prog
endif


packadd minpac
packadd termdebug
let termdebug_wide = 1
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('kana/vim-textobj-user')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tek/vim-textobj-ruby')
call minpac#add('airblade/vim-rooter')
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-lua/completion-nvim')
call minpac#add('nvim-lua/lsp_extensions.nvim')
call minpac#add('nvim-lua/popup.nvim')
call minpac#add('t9md/vim-ruby-xmpfilter')
call minpac#add('adelarsq/vim-matchit')
"call minpac#add('SirVer/ultisnips')


" add commands for minpac
command! PackUpdate callvminpac#update()
command! PackClean call minpac#clean()

" ESC in NEOVIM for fzf window
if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif


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
noremap <leader>ew :e %%
noremap <leader>es :sp %%
noremap <leader>ev :vsp %%
noremap <leader>et :tabe %%
nnoremap <leader>evv :vsp ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>


let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)


" Ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
let g:rg_derive_root='true'

noremap <Leader>b :Buffers<cr>
noremap <Leader>f :Files<cr>
noremap <Leader>/ :BLines<cr>
noremap <Leader>pf :GFiles<cr>
