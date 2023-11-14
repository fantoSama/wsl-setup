# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall
zstyle :compinstall filename '/c/Users/'${whoami}'/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add zsh completions
fpath=(~/.zsh/.plugins/zsh-completions/src $fpath)


#environment variables
export PATH=.:$PATH #running bash script without the ./

# Install plugins to zsh
source ~/.zsh/.plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/.plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/.plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'
alias cl='clear'
alias nt='nginx -t'
alias ns='nginx -s reload'