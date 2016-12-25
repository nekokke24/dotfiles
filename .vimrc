" {{{ [maganement] NeoBundle
" ==================================================================================
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'mattn/emmet-vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" ==================================================================================
" colorscheme zenburn
" colorscheme jellybeans
" colorscheme molokai
" }}} ==============================================================================
" {{{ [settings] Initialize
" ==================================================================================
syntax on
set guioptions=m
set visualbell t_vb=
set clipboard=unnamed
set virtualedit=block
set nobackup
set noswapfile
set hlsearch
set ignorecase
set smartcase
set nowrapscan
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set incsearch
set number
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set ruler
set laststatus=2
set lsp=2
set visualbell t_vb=
set mouse=a
set cmdheight=2
set novisualbell
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set list
set listchars=eol:¬,tab:▸\ ,extends:>,precedes:<,trail:-
" :SignifyToggle
" }}} ==============================================================================
" {{{ [settings][keybind] Normal mode
" ==================================================================================
nmap j gj
nmap k gk
nmap > >>
nmap < <<
nmap <C-t> :badd
nmap <C-n> :bn <return>
nmap <C-p> :bp <return>
nmap <C-c> :bdelete <return>
nmap <C-q> :colorscheme jellybeans <return>
nmap <S-l> <C-w>l
nmap <S-h> <C-w>h
nmap <S-k> <C-w>k
nmap <S-j> <C-w>j
nmap <C-m> :nohl <return>
nmap <C-o> :VimFiler <return>
nmap <Leader>r :QuickRun <return>
nmap <Leader>ig :IndentGuidesToggle <return>
nmap ¥ \
nmap <C-h> :SignifyToggle <return>
nmap <S-g><S-a> :Gwrite <return>
nmap <S-g><S-c> :Gcommit <return>
nmap <S-g><S-b> :Gblame <return>
nmap <S-g><S-s> :Gstatus <return>
nmap <S-g><S-p><S-s> :Git push <return>
nmap <S-g><S-p><S-l> :Git pull <return>
nmap <S-g><S-v> :Gitv <return>
nmap <S-g><S-f> :Gitv! <return>
" }}} ==============================================================================
" {{{ [settings][keybind] Insert mode
" ==================================================================================
imap ¥ \
" }}} ==============================================================================
" {{{ [settings][keybind] Visual mode
" ==================================================================================
vmap ¥ \
vmap s S
vmap <silent> > >gv
vmap <silent> < <gv
vmap <C-s> :OverCommandLine<CR>s/
vmap <C-r> :RengBang<CR>
" }}} ==============================================================================
" {{{ [settings][keybind] Command mode
" ==================================================================================
cmap ¥ \
" }}} ==============================================================================
" {{{ [settings][keybind] Operator
" ==================================================================================
map R <Plug>(operator-replace)
" }}} ==============================================================================
" {{{ [settings] 無限undoと編集位置の自動復帰 http://blog.papix.net/entry/2012/12/14/04~
" ==================================================================================
if has('persistent_undo')
       set undodir=~/.vim/undo
       set undofile
endif
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""
" }}} ==============================================================================
" {{{ [settings] バッファの表示設定を保存する (foldとか)
" ==================================================================================
" Save fold settings.
" autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
" autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | en~
" Don't save options.
" set viewoptions-=options
" }}} ==============================================================================
" {{{ [settings][plugin] Syntastic
" ==================================================================================
let g:syntastic_javascript_checker = 'jshint'
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'javascript'],
      \ 'passive_filetypes': []
      \ }

" Change error marks
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol=' '
" }}} ==============================================================================
" {{{ [settings][plugin] Syntastic file saved validate
" ==================================================================================
" let g:syntastic_check_on_open=1 "ファイルを開いたにチェックする
" let g:syntastic_check_on_save=1 "保存時にはチェック
" let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
" let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
" set statusline+=%#warningmsg# "エラーメッセージの書式
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" }}} ==============================================================================
" {{{ [settings][plugin] neosnippet
" ==================================================================================
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}} ==============================================================================
" {{{ [settings][plugin] neocomplete
" ==================================================================================
let g:neocomplete#enable_at_startup = 1
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
let g:neocomplete_snippets_dir = '~/dotfiles/.neocon-snippets'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'javascript' : $HOME.'/dotfiles/.neocon-snippets/javascript.snip'
\ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/dotfiles/.neocon-snippets/'
"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

filetype plugin on
" au BufEnter * execute ":lcd " . expand("%:p:h")
" }}} ==============================================================================
" {{{ [settings][plugin] emmet-vim (zen-coding)
" ==================================================================================
nmap <C-e> <C-y>,
imap <C-e> <C-y>,
vmap <C-e> <C-y>,
" }}} ==============================================================================
" {{{ [settings][plugin] vim-airline
" ==================================================================================
let g:airline_enable_hunks = 0
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
" }}} ==============================================================================
" {{{ [settings][plugin] Simple JS Indenter
" ==================================================================================
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1
" }}} ==============================================================================
" {{{ [settings][plugin] EasyMotion
" ==================================================================================
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=";"
let g:EasyMotion_grouping = 1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
" }}} ==============================================================================
" {{{ [settings][plugin] clever-f
" ==================================================================================
let g:clever_f_use_migemo = 1
" }}} ==============================================================================
" {{{ [settings][plugin] skk.vim
" ==================================================================================
let skk_jisyo = '~/.skk-dic'
let skk_large_jisyo = '~/.skk-dic/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1
" }}} ==============================================================================
" {{{ [settings][plugin] unite.vim
" ==================================================================================
nmap ,ub :Unite buffer_tab <return>
nmap ,um<return> :Unite bookmark <return>
nmap ,uma :UniteBookmarkAdd <return>
nmap ,uf :Unite file <return>
nmap ,uh :Unite file_mru <return>
nmap ,ur :Unite register <return>
nmap ,ug :Unite git_modified<return>
nmap ,ul :Unite locate<return>
nmap ,ut<return> :Unite todo:undone<return>
nmap ,utt :Unite todo:tag:
nmap ,uta :UniteTodoAddSimple -tag<return>
nmap ,ua :Unite mark<return>
nmap ,uc :Unite -auto-preview colorscheme<return>
autocmd FileType git :setlocal foldlevel=99
" }}} ==============================================================================
" {{{ [settings][macvim] Opacity level
" ==================================================================================
if has('gui_macvim')
       set transparency=5
endif
" }}} ==============================================================================
" {{{ [settings][plugin] wauto.vim
" ==================================================================================
let g:auto_write = 1

