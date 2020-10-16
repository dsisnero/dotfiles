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
