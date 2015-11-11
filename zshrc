source ~/.site_specific.pre

export PATH=~/.bin:$PATH

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bunsen"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew brew-cask cake coffee command-not-found docker debian extract git fabric meteor mrt node npm pip osx python history-substring-search sublime vagrant zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:.

export EDITOR='vim'

source ~/.aliases

# Python stuff
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
#source virtualenvwrapper_lazy.sh 

export GOPATH=~/.go

# probably should verify this before setting it...
export TERM=xterm-256color

alias sudo='nocorrect sudo'
eval `dircolors ~/.dircolors`

# Setup zsh-autosuggestions
source $ZSH/custom/plugins/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

export AUTOSUGGESTION_HIGHLIGHT_CURSOR=0
export AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1
export AUTOSUGGESTION_HIGHLIGHT_COLOR="fg=6"

# Temporary fix for broken hotkeys
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

# Colorize less
export LESS='-R'
export LESSOPEN='|~/.bin/lessfilter %s'

alias git-recent="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
source ~/.site_specific.post
