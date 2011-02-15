"see : http://d.hatena.ne.jp/japanrock_pg/20090805/1249473550

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp,utf-8
set fileencodings+=,ucs-2le,ucs-2,utf-8,euc-jp

set hlsearch 
set ignorecase
set smartcase
set laststatus=2
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'\|'.&ff.']'}\ \ %l/%L\ (%P)%m%=%{strftime(\"%Y/%m/%d\ %H:%M\")} 
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set nocompatible
syntax on
set nu
set hidden
set wildmenu
set wildmode=list:longest,full
set cursorline

filetype on
filetype indent on
filetype plugin on

let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"

" http://www.e2esound.com/wp/2010/11/07/add_vimrc_settings/
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap ¡È¡É ¡È¡É<Left>
imap ¡É ¡É<Left>
imap <> <><Left>

" The highlight is deleted by pushing the escape key two degrees.
" See http://blog.appling.jp/archives/140
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#
nnoremap <C-l> :BufExplorer<CR>

" http://d.hatena.ne.jp/yuroyoro/20101104/1288879591
" CTRL-hjkl¤Ç¥¦¥£¥ó¥É¥¦°ÜÆ°
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h

" http://vim-users.jp/2010/02/hack122/
nnoremap Y y$

" rubycomplete.vim
"" FileType settings
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType html set filetype=xhtml
autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" autocomplpop.vim
let g:AutoComplPop_CompleteOption = '.,w,b,k'
let g:AutoComplPop_IgnoreCaseOption = 1
autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'
autocmd FileType perl let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/perl.dict'
autocmd FileType ruby let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
autocmd FileType html let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
autocmd FileType erlang let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/erlang.dict'

function! InsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
 return "\<TAB>"
 else
 if pumvisible()
 return "\<C-N>"
 else
 return "\<C-N>\<C-P>"
 end
 endif
endfunction
" " Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" " }}} Autocompletion using the TAB key
 
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

:source $VIMRUNTIME/macros/matchit.vim
