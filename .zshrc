if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias v="nvim"
alias t="tmux"
alias g="lazygit"


autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

source ~/pkgs/powerlevel10k/powerlevel10k.zsh-theme  
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/pkgs/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/pkgs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
