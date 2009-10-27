"see : http://d.hatena.ne.jp/japanrock_pg/20090805/1249473550

" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
" デフォルトの文字コード
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" ファイルを開く際のエンコーディングの候補を指定
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp,utf-8
set fileencodings+=,ucs-2le,ucs-2,utf-8,euc-jp

" 検索文字をハイライト
set hlsearch 

" 大文字小文字無視
set ignorecase
" 大文字ではじめたら大文字小文字無視しない
set smartcase

" <status line>
" 常にステータスラインを表示
set laststatus=2
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'\|'.&ff.']'}\ \ %l/%L\ (%P)%m%=%{strftime(\"%Y/%m/%d\ %H:%M\")} 

" ファイル内の <Tab> が対応する空白の数。
set tabstop=2

" 自動インデントの各段階に使われる空白の数。
set shiftwidth=2

" Insertモードで: <Tab> を挿入するのに、適切な数の空白を使う。（タブをスペースに展開する）
set expandtab

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。
set autoindent

" compatible の機能をオフにします。compatible のオプションを有効にすると、Vimの便利な機能が使えなくなる。 初期値：オン
set nocompatible

" 強調表示(色付け)のON/OFF設定。
syntax on

" 行数表示
set nu

" バッファを切替えてもundoの効力を失わない
set hidden

" コマンドライン補完を拡張モードにする
set wildmenu
set wildmode=list:longest,full

" ファイル形式の検出を有効化
filetype on
" ファイル形式別インデントのロードを有効化
filetype indent on
" ファイル形式別プラグインのロードを有効化
filetype plugin on

" rails.vim 参考 http://fg-180.katamayu.net/archives/2006/09/02/125150
"" ロードされる特徴のレベルの一般的なコントロール 4 は（すべての普通の特徴を有効にする。推奨）
let g:rails_level=4

"" 新しいRailsアプリケーションが作られたときロードするファイル。
let g:rails_default_file="app/controllers/application.rb"
"" 新しいアプリケーションで使うデータベース。
let g:rails_default_database="mysql"

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

"<TAB>で補完（autocomplpop.vim）
" {{{ Autocompletion using the TAB key
" This function determines, wether we are on the start of the line text (then
" tab indents) or
" if we want to try autocompletion
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
 
" ポップアップの配色
hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

"カーソル行の強調表示
set cursorline

" matchit の設定
:source $VIMRUNTIME/macros/matchit.vim
