# Load Powerlevel10k theme if available
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Python environment setup ---
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# --- Node Version Manager (NVM) setup ---
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# --- Oh My Zsh configuration ---
export ZSH="/home/hattori/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# --- Plugins ---
plugins=(
  git
  dotenv
  docker
  node
  pip
  pyenv
  python  
  zsh-completions
  zsh-syntax-highlighting
  zsh-autosuggestions
  kubectl
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# --- Virtualenv prompt customization ---
ZSH_THEME_VIRTUALENV_PREFIX="("
ZSH_THEME_VIRTUALENV_SUFFIX=") "

# --- Zsh Autosuggestions configuration ---
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg-7'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=1000
ZSH_AUTOSUGGEST_USE_ASYNC=true

# --- Git prompt customization ---
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_no_bold[cyan]%}->"

# --- FZF (fuzzy finder) integration ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- Editor configuration ---
export EDITOR='nvim'

# (Repeated FZF source, can be removed if not intentional)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- Google Cloud SDK integration ---
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'; fi

# --- Aliases ---
alias ag="ag --hidden --skip-vcs-ignores --ignore=\"*Library*\" --ignore=\"*.gem*\" --ignore=\"*.build*\" --ignore=\"*.git*\""
alias ll="ls -lahG"
alias ls="ls -lah"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'



