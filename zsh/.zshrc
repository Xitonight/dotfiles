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

# Aliases
alias ls='eza --icons=always -A --color=always'
alias ins='yay -Sy --noconfirm'
alias unstow='stow -D'
alias zconf='nvim $HOME/dotfiles/zsh/.zshrc'

# Manpager with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
