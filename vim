let mapleader=","
filetype off

" Vundle initialization.
set rtp+=~/.vim,~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'brookhong/cscope.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/ListToggle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'fatih/vim-go'
Plugin 'benmills/vimux'
Plugin 'scrooloose/nerdtree'
Plugin 'weynhamz/vim-plugin-minibufexpl'
Plugin 'wincent/terminus'

call vundle#end()
filetype plugin indent on

source ~/.vim/plugin/cscope_maps.vim

" Load Powerline configuration.
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set gfn=Fira\ Code\ Retina:h10
set guifont=Fira\ Code\ Retina:h10

if has('gui_running')
    set macligatures
    set go-=r 
    set go-=L 
    set go-=T 
    set go-=m
    set background=light
else
    set background=dark
    " Blacklist YCM.
    let g:ycm_python_byinary_path = 'python'
    let g:ycm_server_python_interpreter = '/usr/local/bin/python'
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  
    let g:ycm_filetype_blacklist = {
                \ 'tagbar' : 1,
                \ 'qf' : 1,
                \ 'notes' : 1,
                \ 'markdown' : 1,
                \ 'unite' : 1,
                \ 'text' : 1,
                \ 'vimwiki' : 1,
                \ 'pandoc' : 1,
                \ 'infolog' : 1,
                \ 'mail' : 1,
                \ 'plaintex' : 1,
                \ 'tex' : 1,
                \}
    " Syntastic options
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
endif

let g:miniBufExplAutoStart = 1

" Shortcuts for swapping windows.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <CR> :noh<CR><CR>

" Remove preview window for YouCompleteMe.
set completeopt-=preview

" Options for Ctrl-P
set wildmode=longest,list,full
set wildignore+=*.git/*,.DS_Store,*/node_modules/*
set wildmenu

" Ignore case when searching, except if search pattern includes uppercase.
set ignorecase
set smartcase

" Display matches as typing search string.
set hlsearch
set incsearch

"Timeout for key sequences"
set timeoutlen=500

" Smart indenting.
set ai
set si

" Remove error bells.
set noerrorbells
set novisualbell

" Smart tab
set expandtab

" Disable wrapping
set nowrap

" EOL characters.
set ff=unix

" Syntax highlighting
syntax enable

colorscheme solarized

" Infinite backup
set nobackup
set nowb
set noswapfile

let &undodir = expand('~/.vim/undodir')
set undofile


" Set line numbers.
set number
set relativenumber

" Split options.
set splitbelow
set splitright

" Backspace options.
set backspace=indent,eol,start

" Show powerline and tab bar always.
set laststatus=2
set showtabline=2

" Vimux
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

" CtrlP MRU
map <C-b> :CtrlPMRU<CR>

" Latex
autocmd FileType tex :NoMatchParen
au FileType tex setlocal nocursorline
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r -g @line @pdf @tex'

autocmd FileType tex call vimtex#init()
autocmd FileType tex :VimtexCompile
autocmd FileType tex :VimtexView

let g:ycm_collect_identifiers_from_tags_files = 1

" ClangFormat options.
let g:clang_format#code_style = 'google'
let g:clang_format#detect_style_file = 1
autocmd FileType c,cpp,objc ClangFormatAutoEnable

" Custom tab settings.
autocmd BufEnter * set tabstop=4
autocmd BufEnter * set shiftwidth=4
autocmd BufEnter *.js set tabstop=2
autocmd BufEnter *.jsx set tabstop=2
autocmd BufEnter *.tsx set tabstop=2
autocmd BufEnter *.js set shiftwidth=2
autocmd BufEnter *.jsx set shiftwidth=2
autocmd BufEnter *.tsx set shiftwidth=2

" Command height
set cmdheight=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_c_checkers = ['make']
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:syntastic_tex_checkers = ['']

let g:go_list_type = "quickfix"

" Configure tagbar for ctags and go.
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" Clang Format
map <C-V> :pyf /usr/local/var/homebrew/linked/clang-format/share/clang/clang-format.py<cr>
imap <C-V> <c-o>:pyf /usr/local/var/homebrew/linked/clang-format/share/clang/clang-format.py<cr>

" cscope options
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" cscope
if has('cscope')
    set tagstack
    set cscopetag
    set csto=0
    set nocsverb

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help
endif

" Easy tags settings
let g:easytags_events = ['VimEnter', 'BufWritePost']

command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction

nnoremap H gT
nnoremap L gt

set shortmess+=IF
