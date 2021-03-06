# Remove all previous environment defined aliases.
#
unalias -a

# Aliases.
#
alias aliases='alias | cut -c7- | bat -l ini --style=plain --paging never'
alias bd='br --only-folders'
alias be='bundle exec'
alias bs='br --sizes'
alias cf='fzf_change_directory'
alias cp='/bin/cp -i'
alias cz='_f() { cd "$@" && _z --add "$(pwd)"; }; _f'
alias dir='ls -l --group-directories-first'
alias df.='df -h .'
alias du='du -b'
alias dus='du_by_size'
alias eq='set -f; _f() { echo $@ | bc; set +f; }; _f'
alias f='fzf --ansi'
alias fkill='fzf_kill'
alias g='_f() { if [[ $# == 0 ]]; then git status -sb; else git "$@"; fi }; _f'
alias ga='fzf_git_status add'
alias gd='fzf_git_status diff'
alias gu='fzf_git_unadd'
alias gll='fzf_git_log'
alias glS='fzf_git_log_pickaxe'
alias grl='fzf_git_reflog'
alias gtop='glances --disable-bg'
alias gv='gvim 2> /dev/null'
alias h=history
alias hdd='history_dedup'
alias help='tldr'
alias hrg='history | rg'
alias l='exa --color=always --group-directories-first'
alias l1='l --oneline'
alias l1d='l1 --list-dirs'
alias ll='l --long'
alias ll.='ll --all'
alias lld='ll --list-dirs'
# usage: llfs +1M (find all files larger than 1 megabyte)
alias llfs='find_by_size'
alias lls='_f() { ll -r --sort=size "$@" | less; }; _f'
alias llt='_f() { ll -r --sort=modified "$@" | less; }; _f'
alias ls='ls --color --classify --human-readable --quoting-style=escape'
alias m='less'
alias mdi='meld 2>/dev/null'
alias mplayer='mplayer $* 2>/dev/null'
alias mux='tmuxinator'
alias mv='/bin/mv -i'
alias p='bat'
alias pping='prettyping --nolegend'
alias psu='ps -u $USER -f'
alias qmv='qmv -f do'
alias rg='rg --smart-case'
alias rgm='_f() { rg -p "$1" | less; }; _f'
alias rm='/bin/rm -i'
alias rmrf='/bin/rm -rf'
alias rs='rsync --archive --human-readable --progress --verbose'
alias src='. ~/.bashrc'
alias t='tree -C --dirsfirst'
alias tl='tree -C  --dirsfirst -L'
alias td='tree -C -d'
alias tdl='tree -C -d -L'
alias tnew='tmux new -s $(basename $(pwd) | cut -d"." -f1)'
alias v='nvim'
alias vdi='nvim -d'
alias vf='fzf_find_edit'
alias vg='grep_edit'
alias vim='stty -ixon && vim 2> /dev/null'
alias wl='wc -l'
alias x=exit
alias ytest='CI=true yarn test --colors'
# Directory navigation.
alias -- -='cd -'
alias ..='cd ..'
alias ..2='..; ..'
alias ..3='..2; ..'
alias ..4='..3; ..'
alias ..5='..4; ..'


# General environment variables.
#
export EDITOR=nvim
export LESS='-Q -R -X -F -s -i -g'
export LESS_TERMCAP_md=$(printf "\e[00;34m")
export LESS_TERMCAP_us=$(printf "\e[01;32m")
export LESSHISTFILE=-
# Note:
#   mi - completion options color (Bash 4.4 and later)
#   so - completion matching-prefix color (Bash 4.4 and later)
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;81:pi=38;5;43:bd=38;5;212:\
cd=38;5;225:or=30;48;5;202:ow=38;5;75:so=38;5;177:su=36;48;5;63:ex=38;5;156:\
mi=38;5;115:*.exe=38;5;156:*.bat=38;5;156:*.tar=38;5;204:*.tgz=38;5;205:\
*.tbz2=38;5;205:*.zip=38;5;206:*.7z=38;5;206:*.gz=38;5;205:*.bz2=38;5;205:\
*.rar=38;5;205:*.rpm=38;5;173:*.deb=38;5;173:*.dmg=38;5;173:*.jpg=38;5;141:\
*.jpeg=38;5;147:*.png=38;5;147:*.mpg=38;5;151:*.avi=38;5;151:*.mov=38;5;216:\
*.wmv=38;5;216:*.mp4=38;5;217:*.mkv=38;5;216:*.flac=38;5;223:*.mp3=38;5;218:\
*.wav=38;5;213:\
*akefile=38;5;176:*.pdf=38;5;253:*.ods=38;5;224:*.odt=38;5;146:\
*.doc=38;5;224:*.xls=38;5;146:*.docx=38;5;224:*.xlsx=38;5;146:\
*.epub=38;5;152:*.mobi=38;5;105:*.m4b=38;5;222:*.conf=38;5;121:\
*.md=38;5;224:*.markdown=38;5;224:*README=38;5;224:*.ico=38;5;140:\
*.iso=38;5;205"
export EXA_COLORS="da=38;5;252:sb=38;5;204:sn=38;5;43:\
uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
gm=38;5;203:ga=38;5;203:xa=38;5;239:*.ts=00"
export PAGER=less

# What platform are we running on.
export OS=`uname`

# History settings.
HISTCONTROL=ignoreboth:erasedups # Erase duplicates
HISTFILESIZE=99999               # Max size of history file
HISTIGNORE=?:??                  # Ignore one and two letter commands
HISTSIZE=99999                   # Amount of history to save
# Note, to immediately append to history file see 'prompt' function below.

# Disable /etc/bashrc_Apple_Terminal bash sessions on Mac, it does not play
# nice with normal bash history. Also, create a ~/.bash_sessions_disable file
# to be double sure to disable bash sessions.
export SHELL_SESSION_HISTORY=0

# Enable the useful Bash features:
#  - autocd, no need to type 'cd' when changing directory
#  - cdspell, automatically fix directory typos when changing directory
#  - direxpand, automatically expand directory globs when completing
#  - dirspell, automatically fix directory typos when completing
#  - globstar, ** recursive glob
#  - histappend, append to history, don't overwrite
#  - histverify, expand, but don't automatically execute, history expansions
#  - nocaseglob, case-insensitive globbing
#  - no_empty_cmd_completion, don't TAB expand empty lines
shopt -s autocd cdspell direxpand dirspell globstar histappend histverify \
    nocaseglob no_empty_cmd_completion

# Prevent file overwrite on stdout redirection.
# Use `>|` to force redirection to an existing file.
set -o noclobber

# Set the appropriate umask.
umask 002

# Use neovim-remote to prevent running neovim within neovim (via `:terminal`).
if [[ -n $NVIM_LISTEN_ADDRESS ]]; then
    alias nvim='nvr -cc split'
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
fi

# Customizations per platform.
if [[ $OS = Linux ]]; then
    alias cpa='/bin/cp -i -a'
    alias free='free -th'
    alias open='xdg-open 2>/dev/null'
    alias scp='/usr/bin/scp'
    alias ssh='/usr/bin/ssh'
    alias ssh-add='/usr/bin/ssh-add'
elif [[ $OS = Darwin ]]; then
    alias cpa='/usr/local/opt/coreutils/libexec/gnubin/cp -i -a'
    alias scp='/usr/local/bin/scp'
    alias ssh='/usr/local/bin/ssh'
    alias ssh-add='/usr/local/bin/ssh-add'
    export GTK_THEME='Meld-Mojave-light' # Force light theme for 'meld'
fi


# Functions.
#
brew_config() {
    if ! [[ -x $(command -v brew) ]]; then
        echo 'Note: brew is not installed.'
        return
    fi

    export BREW_PREFIX=$(brew --prefix)

    # Bash completions.
    if [[ $OS = Linux ]]; then
        # Source legacy Brew-related Bash completions.
        for f in $BREW_PREFIX/etc/bash_completion.d/*; do . $f; done
    elif [[ $OS = Darwin ]]; then
        # Please refer to: https://is.gd/5f9uD8
        # Source legacy version 1 bash_completion scripts.
        export BASH_COMPLETION_COMPAT_DIR="$BREW_PREFIX/etc/bash_completion.d"
        # Source version 2 bash_completion scripts.
        . $BREW_PREFIX/etc/profile.d/bash_completion.sh
    fi

    # Make 'g' alias to Git work with bash-completion.
    complete -o default -o nospace -F _git g

    # 'fzf' configuration.
    . $BREW_PREFIX/opt/fzf/shell/key-bindings.bash
    export FZF_DEFAULT_OPTS='
      --height 75% --multi --reverse --margin=0,1
      --bind ctrl-f:page-down,ctrl-b:page-up
      --bind pgdn:preview-page-down,pgup:preview-page-up
      --prompt="❯ "
      --color bg+:#262626,fg+:#dadada,hl:#ae81ff,hl+:#ae81ff
      --color border:#303030,info:#cfcfb0,header:#80a0ff,spinner:#42cf89
      --color prompt:#87afff,pointer:#f74782,marker:#f09479
    '
    export FZF_DEFAULT_COMMAND='fd --type f --color=never'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS='--preview "bat --color=always --line-range :500 {}"'
    export FZF_ALT_C_COMMAND='fd --type d . --color=never'
    export FZF_ALT_C_OPTS='--preview "tree -C {} | head -100"'
    # This is an undocumented environment variable for use by fzf.vim, see:
    # https://github.com/junegunn/fzf.vim/pull/707
    export FZF_PREVIEW_COMMAND='bat --color=always {}'

    # 'bat' configuration.
    export BAT_CONFIG_PATH="$HOME/dotfiles/bat.conf"
}

custom_sources() {
    # Bash completions.
    for f in ~/dotfiles/bash_completion.d/*; do . $f; done

    # 'broot' function.
    . ~/dotfiles/profile.d/br.sh

    # 'z' utility.
    _Z_NO_PROMPT_COMMAND=1
    . ~/dotfiles/profile.d/z.sh
}

dev_config() {
    if [[ -z $BREW_PREFIX ]]; then
        return
    fi

    if [[ -f $BREW_PREFIX/share/chruby/chruby.sh ]]; then
        . $BREW_PREFIX/share/chruby/chruby.sh
        chruby 2.6.6
    fi
    if [[ -d /usr/local/Android/Sdk ]]; then
        export ANDROID_SDK_ROOT=/usr/local/Android/Sdk
        PATH=$PATH:$ANDROID_SDK_ROOT/emulator
    elif [[ -d ~/Library/Android/Sdk ]]; then
        export ANDROID_SDK_ROOT=~/Library/Android/Sdk
        PATH=$PATH:$ANDROID_SDK_ROOT/emulator
    fi
    if [[ -d /usr/local/flutter/bin ]]; then
        PATH=$PATH:/usr/local/flutter/bin
        export DART_SDK=/usr/local/flutter/bin/cache/dart-sdk
        PATH=$PATH:$DART_SDK/bin
    fi
    if [[ -d ~/projects/go ]]; then
        export GOPATH=~/projects/go
        PATH=$PATH:$GOPATH/bin
    fi
}

du_by_size() {
    if [[ $# == 0 ]]; then
        du -sh * | sort -hr | less;
    else
        du -sh "$@" | sort -hr | less;
    fi
}

find_by_size() {
    find . -type f -size "$1" -exec exa --long {} \; ;
}

fzf_change_directory() {
    local directory=$(
      fd --type d | \
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'tree -C {} | head -100'
      )
    if [[ -n $directory ]]; then
        cd "$directory"
    fi
}

fzf_find_edit() {
    local file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        $EDITOR "$file"
    fi
}

fzf_git_log() {
    local selections=$(
      git ll --color=always "$@" |
        fzf --ansi --no-sort --height 100% \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @' |
                       diff-so-fancy"
      )
    if [[ -n $selections ]]; then
        local commits=$(echo "$selections" | cut -d' ' -f2 | tr '\n' ' ')
        git show $commits
    fi
}

fzf_git_log_pickaxe() {
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local selections=$(
      git log --oneline --color=always -S "$@" |
        fzf --ansi --no-sort --height 100% \
            --preview 'git show --color=always {1} | diff-so-fancy'
      )
    if [[ -n $selections ]]; then
        local commits=$(echo "$selections" | cut -d' ' -f1 | tr '\n' ' ')
        git show $commits
    fi
}

fzf_git_reflog() {
    local selection=$(
      git reflog --color=always "$@" |
        fzf --no-multi --ansi --no-sort --height 100% \
            --preview 'git show --color=always {1} | diff-so-fancy'
      )
    if [[ -n $selection ]]; then
        git show $(echo $selection | cut -d' ' -f1)
    fi
}

fzf_git_status() {
    local selections=$(
      git status --porcelain | \
      fzf --ansi \
          --preview 'if (git ls-files --error-unmatch {2} &>/dev/null); then
                         git diff --color=always {2} | diff-so-fancy
                     else
                         bat --color=always --line-range :500 {2}
                     fi'
      )
    if [[ -n $selections ]]; then
        local files=$(echo "$selections" | cut -c 4- | tr '\n' ' ')
        if [[ -n $files && "$1" == "add" ]]; then
            git add --verbose $files
        elif [[ -n $files && "$1" == "diff" ]]; then
            git diff $files
        fi
    fi
}

fzf_git_unadd() {
    local files=$(git diff --name-only --cached | fzf --ansi)
    if [[ -n $files ]]; then
        git unadd $files
    fi
}

fzf_kill() {
    local pid_col
    if [[ $OS = Linux ]]; then
        pid_col=2
    elif [[ $OS = Darwin ]]; then
        pid_col=3;
    else
        echo 'Error: unknown platform.'
        return
    fi
    local pids=$(
      ps -f -u $USER | sed 1d | fzf | tr -s [:blank:] | cut -d' ' -f"$pid_col"
      )
    if [[ -n $pids ]]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

grep_edit() {
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi

    $EDITOR $(rg -l "$1")
}

history_dedup() {
    # Details: https://is.gd/HPAtE5
    echo "Before: $(du -shL ~/.bash_history)"
    tac ~/.bash_history | awk '!x[$0]++' | tac > /tmp/bash_history
    # Use 'cp' instead of 'mv' to deal with symlinked ~/.bash_history. Use
    # 'command' to bypass aliases.
    command cp /tmp/bash_history ~/.bash_history && command rm /tmp/bash_history
    echo "After: $(du -shL ~/.bash_history)"
    history -c && history -r
}

path() {
    PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
    export MANPATH=/usr/local/man:/usr/local/share/man:/usr/man:/usr/share/man
    if [[ $OS = Darwin ]]; then
        PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
        MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
    elif [[ -d ~/.linuxbrew ]]; then
        PATH=~/.linuxbrew/bin:$PATH
        MANPATH=~/.linuxbrew/share/man:$MANPATH
    fi

    PATH=~/binaries:~/scripts:$PATH
}

prompt() {
    # Please first install the seafly Bash prompt.
    #   git clone https://github.com/bluz71/bash-seafly-prompt ~/.bash-seafly-prompt
    SEAFLY_PRE_COMMAND="history -a"
    SEAFLY_GIT_PREFIX=" "
    . ~/.bash-seafly-prompt/command_prompt.bash
}


# Set environment.
#
path
brew_config
dev_config
custom_sources
prompt
