" Hints:    https://bluz71.github.io/2018/03/12/vim-hints.html
" Tips:     https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" Plugins:  https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html
" Mappings: https://bluz71.github.io/2017/06/14/a-few-vim-tmux-mappings.html

"===========================================================
" SETTINGS
"===========================================================

" Enable syntax highlighting.
"
syntax on


" General vim settings.
"
set autoindent        " Indented text
set autoread          " Pick up external changes to files
set autowrite         " Write files when navigating with :next/:previous
set background=dark   " Dark background by default
set backspace=indent,eol,start
set belloff=all       " Bells are annoying
set breakindent       " Wrap long lines *with* indentation
set breakindentopt=shift:2
if has("unnamedplus") " Copy to/from system clipboard
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set colorcolumn=81,82 " Highlight 81 and 82 columns
set conceallevel=2
set complete=.,w,b    " Sources for term and line completions
set completeopt=menu,menuone,noinsert,noselect
set dictionary=/usr/share/dict/words
if has('nvim-0.3.2') || has("patch-8.1.0360")
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif
set expandtab         " Use spaces instead of tabs
set foldlevelstart=20
set foldmethod=indent " Simple and fast
set foldtext=""
set formatoptions=cqj " Default format options
set gdefault          " Always do global substitutes
set history=200       " Keep 200 changes of undo history
set infercase         " Smart casing when completing
set ignorecase        " Search in case-insensitively
set incsearch         " Go to search results immediately
set laststatus=2      " We want a statusline
set matchpairs=(:),{:},[:]
set mouse=a           " Mouse support in the terminal
set mousehide         " Hide mouse when typing text
set nobackup          " No backup files
set nocompatible      " No Vi support
set noexrc            " Disable reading of working directory vimrc files
set nohlsearch        " Don't highlight search results by default
set nojoinspaces      " No to double-spaces when joining lines
set noshowcmd         " No to showing command in bottom-right corner
set noshowmatch       " No jumping jumping cursors when matching pairs
set noshowmode        " No to showing mode in bottom-left corner
set noswapfile        " No backup files
set nowrapscan        " Don't wrap searches around
set number            " Show line numbers
set nrformats=        " No to oct/hex support when doing CTRL-a/x
set path=**
set pumheight=20      " Height of complete list
set relativenumber    " Show relative numbers
set ruler
set shiftwidth=4      " Default indentation amount
set shortmess+=c      " Don't show insert mode completion messages
set signcolumn=auto   " Only render sign column when needed
set showbreak=↳       " Use this to wrap long lines
set smartcase         " Case-smart searching
set smarttab
set splitbelow        " Split below current window
set splitright        " Split window to the right
set t_Co=256          " 256 color support
set tabstop=4         " Tab width
set termguicolors     " Enable 24-bit color support for terminal Vim
set textwidth=80      " Standard width before breaking
set timeoutlen=1500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break terminal cursor block
" to I-beam and back functionality set by the t_SI and t_EI variables.
set ttimeoutlen=10
set ttyfast
" Set the persistent undo directory on temporary private fast storage.
let s:undoDir="/tmp/.undodir_" . $USER
if !isdirectory(s:undoDir)
    call mkdir(s:undoDir, "", 0700)
endif
let &undodir=s:undoDir
set undofile          " Maintain undo history
set updatetime=150    " Make GitGutter plugin more responsive
set viminfo=          " No backups
set wildcharm=<Tab>   " Defines the trigger for 'wildmenu' in mappings
set wildmenu          " Nice command completions
set wildmode=full     " Complete the next full match
set wrap              " Wrap long lines

" Options specific to Neovim or Vim.
if has("nvim")
    set inccommand=nosplit
    set list
    set listchars=tab:\ \ ,trail:-
    set signcolumn=auto:1
else
    set cryptmethod=blowfish2
    set listchars=eol:$,tab:>-,trail:-
    set ttymouse=xterm2
    if exists('&cursorlineopt')
        set cursorline
        set cursorlineopt=number
    endif
endif


"===========================================================
" FUNCTIONS
"
" ~/dotfiles/vim/autoload - custom functions
"===========================================================


"===========================================================
" TERMINAL CONFIGURATION
"===========================================================
runtime custom/terminal.vim


"===========================================================
" MAPPINGS
"===========================================================
runtime custom/mappings.vim


"===========================================================
" PLUGINS
"===========================================================

" Automatically install vim-plug and run PlugInstall if vim-plug is not found.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize vim-plug.
call plug#begin('~/.vim/plugged')

"-----------------------------
" Color scheme plugins
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
    runtime custom/moonfly.vim " Options must be set before colorscheme call
Plug 'bluz71/vim-nightfly-guicolors'
    runtime custom/nightfly.vim " Options must be set before colorscheme call

"-----------------------------
" Style plugins
"-----------------------------
Plug 'bluz71/vim-moonfly-statusline'
    " ~/dotfiles/vim/plugin/moonfly-statusline.vim - options
Plug 'Yggdroot/indentLine'
    " ~/dotfiles/vim/plugin/indentLine.vim - options
Plug 'gcmt/taboo.vim'
    " ~/dotfiles/vim/plugin/taboo.vim - options

"-----------------------------
" Behavior plugins
"-----------------------------
Plug 'nelstrom/vim-visual-star-search'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'andymass/vim-matchup', { 'for': ['dart', 'javascript', 'json'] }
    " ~/dotfiles/vim/plugin/matchup.vim - options
Plug 'tommcdo/vim-lion'
    " ~/dotfiles/vim/plugin/lion.vim - options
Plug 'chaoren/vim-wordmotion'
    " ~/dotfiles/vim/after/plugin/wordmotion.vim - overrides
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tmsvg/pear-tree'
    " ~/dotfiles/vim/plugin/pear-tree.vim - options, mappings
Plug '907th/vim-auto-save'
    " ~/dotfiles/vim/plugin/auto-save.vim - options
Plug 'rhysd/clever-f.vim'
    " ~/dotfiles/vim/plugin/clever-f.vim - options
Plug 'mbbill/undotree'
    " ~/dotfiles/vim/plugin/undotree.vim - options, mappings
Plug 'tpope/vim-abolish'
    " ~/dotfiles/vim/after/plugin/abolish.vim - abbreviations
Plug 'tpope/vim-unimpaired'
    " ~/dotfiles/vim/after/plugin/unimpaired.vim - overrides

"-----------------------------
" Misc plugins
"-----------------------------
Plug 'tpope/vim-obsession'
    " ~/dotfiles/vim/plugin/obsession.vim - mappings
Plug 'lifepillar/vim-cheat40'
    " ~/dotfiles/vim/after/plugin/cheat40.vim - options, mappings
Plug 'tweekmonster/startuptime.vim'

"-----------------------------
" File management plugins
"-----------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
    " ~/dotfiles/vim/plugin/fzf.vim - options, mappings
Plug 'pbogut/fzf-mru.vim'
    " ~/dotfiles/vim/plugin/fzf-mru.vim - options, mappings
Plug 'mhinz/vim-grepper'
    " ~/dotfiles/vim/plugin/grepper.vim - options, mappings
    " ~/dotfiles/vim/after/plugin/grepper.vim - overrides
Plug 'Shougo/vimfiler.vim' | Plug 'Shougo/unite.vim'
    " ~/dotfiles/vim/plugin/vimfiler.vim - options, mappings

"-----------------------------
" Completion plugins
"-----------------------------
Plug 'ajh17/VimCompletesMe'
Plug 'natebosch/vim-lsc'
    " ~/dotfiles/vim/plugin/lsc.vim - options

"-----------------------------
" Git plugins
"-----------------------------
Plug 'tpope/vim-fugitive'
    " ~/dotfiles/vim/plugin/fugitive.vim - mappings
Plug 'airblade/vim-gitgutter'
    " ~/dotfiles/vim/plugin/gitgutter.vim - options, mappings

"-----------------------------
" Development plugins
"-----------------------------
Plug 'sheerun/vim-polyglot'
    " ~/dotfiles/vim/plugin/polyglot.vim - options
Plug 'tpope/vim-bundler'
    " Run 'gem ctags' to generate ctags for installed gems (required just once).
Plug 'tpope/vim-rails'
    " ~/dotfiles/vim/plugin/rails.vim - mappings
Plug 'tpope/vim-projectionist'
    " ~/dotfiles/vim/plugin/projectionist.vim - mappings
Plug 'dense-analysis/ale'
    " ~/dotfiles/vim/plugin/ale.vim - options, mappings
Plug 'janko-m/vim-test'
    " ~/dotfiles/vim/plugin/test.vim - options, mappings
Plug 'SirVer/ultisnips', { 'on': [] }
    " ~/dotfiles/vim/plugin/ultisnips.vim - options, mapping & on-demand loading
    " ~/dotfiles/vim/UltiSnips - custom snippets

" Sleuth and EditorConfig will adjust style and indent either heuristically
" (former) or explicitly (later). Note, EditorConfig will take precedence if
" a .editorconfig file is found.
Plug 'tpope/vim-sleuth'
    " ~/dotfiles/vim/after/plugin/sleuth.vim - overrides
Plug 'sgur/vim-editorconfig'

"-----------------------------
" tmux support
"-----------------------------
Plug 'christoomey/vim-tmux-navigator'
    " ~/dotfiles/vim/plugin/tmux-navigator.vim - options, mappings

"-----------------------------
" Neovim specific plugins
"-----------------------------
if has("nvim")
    Plug 'bfredl/nvim-miniyank'
        " ~/dotfiles/vim/plugin/miniyank.vim - mappings
    Plug 'norcalli/nvim-colorizer.lua'
        " ~/dotfiles/vim/after/plugin/nvim-colorizer.vim - options, mappings
endif

" Finalize vim-plug.
call plug#end()


" Load up the match it plugin which provides smart % XML/HTML matching.
runtime macros/matchit.vim


"===========================================================
" AUTOCMDS
"===========================================================
runtime custom/autocmds.vim
    " ~/dotfiles/vim/ftplugin       - file type options, mappings
    " ~/dotfiles/vim/after/ftplugin - file type overrides


"===========================================================
" COLOR SCHEME
"===========================================================

if filereadable(expand('~/.colorscheme'))
    exec "colorscheme " . readfile(expand('~/.colorscheme'))[0]
else
    colorscheme moonfly
endif
