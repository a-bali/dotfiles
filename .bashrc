# Bash configuration file

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# disable warning in OSX
export BASH_SILENCE_DEPRECATION_WARNING=1

# add local bin path
export PATH="~/.local/bin:$PATH"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# dotfiles management
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"


# prompt and terminal title

case "$TERM" in
xterm*|rxvt*)
    TITLE="\[\e]0;\u@\h: \w\a\]"
    ;;
*)
    TITLE="";;
esac


COLOR_SEPARATOR='\[\033[0;34m\]'
COLOR_CYAN='\[\033[1;36m\]'
COLOR_GRAY='\[\033[1;30m\]'
COLOR_YELLOW='\[\033[0;33m\]'
COLOR_PURPLE='\[\033[0;35m\]'
COLOR_GREEN='\[\033[0;32m\]'
COLOR_RESET='\[\033[0m\]'

function git_prompt() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}

    if [[ $(git status 2> /dev/null | tail -n1) = *"nothing to commit"* ]]; then
      echo -n "$COLOR_GREEN$branch_name$COLOR_RESET"
    elif [[ $(git status 2> /dev/null | head -n5) = *"Changes to be committed"* ]]; then
      echo -n "$COLOR_YELLOW$branch_name$COLOR_RESET"
    else
      echo -n "$COLOR_PURPLE$branch_name*$COLOR_RESET"
    fi

  fi
}

function prompt() {
  PS1="$TITLE$COLOR_SEPARATOR[$COLOR_YELLOW\u$COLOR_SEPARATOR@$COLOR_GREEN\h $COLOR_CYAN\w$COLOR_RESET $(git_prompt)$COLOR_SEPARATOR]\$ $COLOR_RESET"
}

PROMPT_COMMAND=prompt


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
if command -v gdircolors >/dev/null; then
  test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
fi


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# man colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


# load bash completion

[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -f /etc/bash_completion ] && . /etc/bash_completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# set up fzf

if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash

  if command -v fd > /dev/null; then
    export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --color=always --follow --hidden --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type d --strip-cwd-prefix --color=always --follow --hidden --exclude .git"
    _fzf_compgen_path() { 
      fd --hidden --follow --exclude ".git" . "$1" 
    }
    _fzf_compgen_dir() { 
      fd --type d --hidden --follow --exclude ".git" . "$1" 
    }
  fi

  _fzf_comprun() {
    local command=$1
    shift

    case "$command" in
      cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
      export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
      ssh)          fzf --preview 'dig {}'                   "$@" ;;
      *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
    esac
  }

  export FZF_DEFAULT_OPTS="--height 80% --border sharp --layout reverse --ansi"
  export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind '?:change-preview-window(down|hidden|)'"
  export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind '?:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
  export FZF_ALT_C_OPTS="--preview 'tree -C {}' | head -200"
  bind -m emacs-standard '"\C-p": " \C-b\C-k \C-u`__fzf_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
  bind -m vi-command '"\C-p": __fzf_cd__'
  bind -m vi-insert '"\C-p": __fzf_cd__'

  [ -f ~/.dotfiles/fzf-git.sh ] && . ~/.dotfiles/fzf-git.sh

fi

