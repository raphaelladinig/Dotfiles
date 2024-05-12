source ~/.zplug/init.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -f ~/.profile ]; then
    . ~/.profile
fi

alias v="nvim"
alias t="tmux"
alias g="lazygit"

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug load
