autoload -U colors && colors

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
 if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    echo "(`basename $virtualenv_path`)"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
   if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    echo -n "$(git_prompt_info)"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

local parse_special='%{$fg[green]%}$(prompt_virtualenv)%{$reset_color%}'
local parse_git='$(prompt_git)'

PS1="${parse_special} %(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜) %{$fg[cyan]%}%c%{$reset_color%} ${parse_git}%# "