set nocompatible

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'osyo-manga/vim-over'
Plugin 'Raimondi/delimitMate'

Plugin 'othree/html5.vim'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-haml'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'JulesWang/css.vim'
Plugin 'ap/vim-css-color'

Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'w0rp/ale'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'wellle/targets.vim'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'elixir-editors/vim-elixir'
Plugin 'airblade/vim-rooter'
" jump to def for elixir
" Plugin 'slashmili/alchemist.vim'
Plugin 'chrisbra/Colorizer'
" rename tabs
Plugin 'gcmt/taboo.vim'

" themes
Plugin 'dracula/vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'jacoborus/tender.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'w0ng/vim-hybrid'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'juanpabloaj/vim-pixelmuerto'

call vundle#end()
filetype plugin indent on    " required


" General
set ttyfast                    " Send more characters at a given time
set ttimeoutlen=0              " Fix delay when escaping from insert with Esc
set mouse=a                    " Enable mouse in all in all modes
set clipboard=unnamed
set history=100                " Number of :cmdline history items to store
set nostartofline              " Don't reset cursor to start of line when moving around
set nofoldenable               " No folding
set sessionoptions+=tabpages,globals

" Appearance
if (has("termguicolors"))
 set termguicolors
endif

syntax on                      " Turn on syntax highlighting
" Set the colorscheme
" find more here https://github.com/flazz/vim-colorschemes/tree/master/colors
" colorscheme gotham256
" colorscheme hybrid
" colorscheme jellybeans
" colorscheme seoul256
colorscheme dracula
" colorscheme spacemacs-theme

set t_Co=256                   " Use all 265 colours
set synmaxcol=300              " Number of columns to apply syntax highlighting
set background=dark            " Use dark themes
set ruler                      " Show the cursor position
set showcmd                    " Show the (partial) command as it’s being typed
set noshowmode                 " Don't show the current mode (airline.vim takes care of us)
set laststatus=2               " Always show status line
set visualbell                 " Use visual bell instead of audible bell (annnnnoying)
set title                      " Show the filename in the window titlebar
set number                     " Enable line numbers
set numberwidth=5              " set a wider number gutter
set nowrap                     " Disable soft-wrap
set showbreak=↪\               " Character to display at the start of soft-wrapped lines
set lazyredraw                 " Don't redraw when we don't have to
set incsearch                  " Shows the search as you type!
set list                       " Show hidden characters
set listchars=tab:»·,trail:·,extends:>,precedes:<
set scrolloff=3                " Minimal number of lines to keep above and below the cursor
set sidescrolloff=3            " Minimal number of columns to keep to the left and right of the cursor
set winminheight=0             " Allow splits to be reduced to a single line

set tags=./tags;,tags;

" Files and buffers
silent !mkdir -p $HOME/.vim/undo > /dev/null 2>&1
set undodir=~/.vim/undo        " Directory to save undo files
set undofile                   " Persist undo history to a file
set undolevels=1000            " Maximum number of changes that can be undone
set nobackup                   " Don't make a backup before overwriting a file
set nowritebackup              " Don't make a backup before writing the file
set noswapfile                 " Don't create swap files
set hidden                     " Allow buffers to exist in the background
set autoread                   " Read open files again when changed outside Vim
set wildmenu                   " Enhanced completion mode
set wildmode=list:longest,list:full
set wildignore+=.DS_Store      " File patterns to ignore when expanding wildcards
set wildignore+=*/vim/undo*
set wildignore+=*/.git/*
set wildignore+=*/.sass-cache/*
set wildignore+=*/bower_components/*
set wildignore+=*/node_modules/*
set wildignore+=*/vendor/*
set wildignore+=*/log/*,*/tmp/*,*/build/*,*/dist/*,*/doc/*
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Text and editing
set backspace=indent,eol,start " Backspacing over everything in insert mode
set encoding=utf-8             " Set the default character encoding
set nobomb                     " No BOMs
set spelllang=en_au,en_gb      " Spellchecking languages
set linebreak                  " Break on boundaries when wrapping
set nojoinspaces               " Only one space when joining lines
set expandtab                  " Spaces, not tabs-obviously ;-)
set tabstop=2                  " Set the wisth of hard tabs
set softtabstop=2              " Set the width of soft tabs
set shiftwidth=2               " Set the width of indents
set shiftround                 " Round indents to multiples of 'shiftwidth'
set autoindent                 " Copy indent from current line when starting a new line
set smartindent                " Be smart about auto indenting
set ignorecase                 " Ignore case in search patterns
set smartcase                  " Obey case if there's an upper case character in search patterns
set iskeyword+=-,_,$,@,%,#,?   " These are not word dividers
set omnifunc=syntaxcomplete#Complete


" File types
augroup filetypedetect
au BufNewFile,BufRead *.{rjs,rbw,gem,gemspec,ru,rake} setlocal filetype=ruby
au BufNewFile,BufRead {Gemfile,Guardfile,Rakefile,Capfile,Procfile} setlocal filetype=ruby
au BufNewFile,BufRead *.ejs setlocal filetype=html

au FileType text setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 spell
au FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
au FileType plaintex setlocal spell
au FileType make setlocal noexpandtab
au FileType markdown setlocal iskeyword-=/ wrap linebreak nolist textwidth=0 wrapmargin=0 spell

au FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,xml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
au FileType python setlocal omnifunc=pythoncomplete#Complete

au FocusLost * :wa
augroup END

" Paste toggle
set pastetoggle=<leader>p

" Fix eslint errors
function! ESLintFix()
  :! yarn run eslint % -- --fix
  :redraw
  :e
  :w
endfunction

function! ESLintFixAll()
  :! yarn run eslint . -- --fix
  :redraw
  :ea
  :wa
endfunction


" let g:hybrid_custom_term_colors = 1

" Status line config
let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'MyFilename'
      \ },
      \ }

" returns filename with parent directory, eg session/service.js
function! MyFilename()
  return substitute(expand('%'), '.*/\([^/]\+/\)', '\1', '')
endfunction

" Search
" Make CtrlP search in the current working directory by default
" Useful for monorepos
let g:ctrlp_cmd = 'CtrlP .'
let g:rooter_change_directory_for_non_project_files = ''

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!

" Use rg (ripgrep) in CtrlP for listing files.
" Respects .gitignore, and is fast enough to not require caching.
if executable('rg')
  let g:ctrlp_user_command = 'rg --vimgrep --files --smart-case %s'
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp\|vendor/bundled$'
\ }


" Use rg (ripgrep) for searching in grep and Ack.vim
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ackprg = 'rg --vimgrep --no-heading --smart-case'
endif

" Delete trailing whitespace
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'
au FileType markdown let g:DeleteTrailingWhitespace = 0

" Find/Replace in whole buffer
function! VisualFindAndReplace()
  :OverCommandLine%s/
  :w
endfunction

" Find/Replace within current visual selection
function! VisualFindAndReplaceWithSelection() range
  :'<,'>OverCommandLine s/\%V
  :w
endfunction


" Delimitmate
let g:delimitMate_expand_cr = 1

" NERDTree
let g:NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\~$', 'node_modules[[dir]]', 'bower_components[[dir]]', 'public[[dir]]', 'tmp[[dir]]', 'dist[[dir]]', 'deps[[dir]]', '_build[[dir]]']

" JSON
let g:vim_json_syntax_conceal = 0
" keep gutter open
let g:ale_sign_column_always = 1
" call ale#linter#Define('elixir', {
" \   'name': 'credo',
" \   'executable': 'mix',
" \   'command': 'mix credo suggest --strict --format=flycheck --read-from-stdin %s',
" \   'callback': 'ale_linters#elixir#credo#Handle',
" \})

" Markdown
let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']

" Mappings
let mapleader=" "

inoremap jk <Esc>

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :
"nnoremap : ;
"vnoremap : ;

" save
nmap <leader>s :w<CR>
" close search window
nmap <leader>c :cclose<CR>
" Most recently used
noremap <leader>r :CtrlPMRU<CR>
" Toggle Comments
map <leader>/ :Commentary<CR>
" Toggle paste
map <leader>p :set invpaste paste?<CR>
" Toggle Nerdtree
map <leader>d :NERDTreeToggle<CR>
" Show current file in nerdtree
map <leader>n :NERDTreeFind<CR>
" Open github page in browser
map <leader>g :Gbrowse
" yank entire file
map <leader>y :%y+<CR>
" Select block
nnoremap <leader>v v%
" Auto lint
map <Leader>fx :call ESLintFix()<CR>
map <Leader>fxa :call ESLintFixAll()<CR>
" search current word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" search
nnoremap \ :Rg<SPACE>
nnoremap <leader>z :call ToggleZoomWindow()<CR>
" Highlight
nnoremap <Leader>h :set hlsearch<CR>
" add a blank lines
nnoremap <S-Enter> O<Esc>
nnoremap <C-Enter> o<Esc>
" Switch tabs
map <Leader>t gt
" tagbar and search tags
nnoremap <leader>. :CtrlPTag<cr>

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" Move based on display lines, not physical lines
map j gj
map k gk

" Move selected lines up and down
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Copy selected text
vnoremap <C-c> "*y

