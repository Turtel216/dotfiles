# Tutorial: https://scottspence.com/posts/my-zsh-config

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# auto suggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"

SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL="⚡"

# Turn off power status when using spaceship prompt
export SPACESHIP_BATTERY_SHOW=false

export PATH=~/.ghcup/bin:$PATH
export PATH=~/go/bin/:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=~/.config/emacs/bin:$PATH
export PATH=~/.cargo/bin:$PATH

alias emacs="emacsclient -c -a 'emacs'"

eval "$(zoxide init zsh)"

[ -f "/home/dimitrios/.ghcup/env" ] && . "/home/dimitrios/.ghcup/env" # ghcup-env
