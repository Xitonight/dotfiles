if [ -z $SSH_CONNECTION ]; then
    tmux has-session -t "main" 2> /dev/null

    if [ $? != 0 ]; then
        tmux new-session -d -s "main" 2> /dev/null
        tmux neww -d -n "obsidian" -t main 2> /dev/null
        tmux neww -d -n "ssh" -t main 2> /dev/null
    fi

    if [ -z $TMUX ]; then
        tmux attach -t "main" 2> /dev/null
    fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enables (or installs if not installed yet) the Zinit plugin manager for zsh
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Source fzf theme
source $HOME/.zsh/current_fzf_theme

# Enable the p10k zsh prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Enable zinit plugins 
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Enable Oh-My-zsh plugins
zinit snippet OMZP::sudo

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use emacs keybindings
# ctrl + f	move forward (or accept suggestion)
# ctrl + b	move backwards
# ctrl + s	go to the start of the cmd
# ctrl + e	go to the end of the cmd
# ctrl + p	navigate to previous cmd
# ctrl + n	navigate to next cmd
# bindkey -e
# bindkey "^p" history-search-backward
# bindkey "^n" history-search-forward


# History tweaks
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Completion tweaks
setopt globdots
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -A --color=always $realpath'
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'eza -A --color=always $realpath'
zstyle ':fzf-tab:complete:timg:*' fzf-preview 'timg -pk $realpath'

# Aliases
alias l='eza -lh --icons=auto' # long list
alias ls='eza -1 -A --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

alias "ihateniggers"="zen-browser"

alias in='yay -Sy --noconfirm'
alias un='yay -Rs'
alias up='yay -Syu'

alias unstow='stow -D'
alias zconf='nvim $HOME/dotfiles/zsh/.zshrc'
alias sos='source ~/.zshrc'
alias nvims='sudoedit'
alias mkdir='mkdir -p'

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias obs='nvim ~/Shared/obsidian/main\ vault/'

# Manpager with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)

# Change default editor to neovim
export EDITOR=nvim
export VISUAL=nvim 

export MANPATH="$MANPATH:/usr/local/texlive/2024/texmf-dist/doc/man"
export INFOPATH="$INFOPATH:/usr/local/texlive/2024/texmf-dist/doc/info"
export PATH="$PATH:/usr/local/texlive/2024/bin/x86_64-linux"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
