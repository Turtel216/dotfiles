# Tutorial: https://scottspence.com/posts/my-zsh-config

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# starting dir
cd ~/repos

# auto suggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"

SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL="⚡"

# Turn off power status when using spaceship prompt
export SPACESHIP_BATTERY_SHOW=false

export PATH=/home/dimitrios/.ghcup/bin:$PATH

eval "$(zoxide init zsh)"
