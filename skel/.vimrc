set nocompatible
set bs=2 "set backspace to be able to delete previous characters
set number "Enable line numbering, taking up 6 spaces

"Turn off word wrapping
set wrap!

"Turn on smart indent
set smartindent
set tabstop=4 "set tab character to 4 characters
set noexpandtab "don't turn tabs into whitespace
"set shiftwidth=4 "indent width for autoindent
"filetype indent on "indent depends on filetype
"try a more sane indentation mode
set cindent

"Parse .html.erb files on VIM 7.0
autocmd BufRead *.rhtml set filetype=eruby
autocmd BufRead *.html.erb set filetype=eruby

"Shortcut to auto indent entire file
nmap <F12> 1G=G
imap <F12> <ESC>1G=Ga
nmap <F11> :set invnumber<RETURN>
imap <F11> <ESC>:set invnumber<RETURN>i
nmap <C-\> :set invpaste<RETURN>
imap <C-\> <ESC>:set invpaste<RETURN>i

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

"Set color scheme
set t_Co=256
colorscheme greens
syntax enable

"Enable indent folding
"set foldenable
"set fdm=indent
"Set space to toggle a fold
"nnoremap <space> za

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Have 3 lines of offset (or buffer) when scrolling
set scrolloff=10

"Set backup directory
set backupdir=$HOME/.vim/tmp
"Set swap dir
set dir=$HOME/.vim/tmp
"Set .viminfo to another dir
"since this can scatter a 
"lot of files. Keep defaults (+=)
set viminfo+=n$HOME/.vim/viminfo
