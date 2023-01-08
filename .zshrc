source /antigen/antigen.zsh

# plugins
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
# theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Commit Antigen Configuration
antigen apply

alias cat="bat"
alias ls="exa"