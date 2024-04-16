source ~/.zplug/init.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias v="nvim"
alias t="tmux"
alias g="lazygit"
alias p="pulsemixer"

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug load

# bun completions
[ -s "/home/raphael/.bun/_bun" ] && source "/home/raphael/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
