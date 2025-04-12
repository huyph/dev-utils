# === PATH configuration ===
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH

# === Default editor ===
export EDITOR='subl -w'

# === Terminal colors ===
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# === Git branch in prompt ===
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# === Custom prompt with colors and git ===
autoload -Uz colors && colors

setopt PROMPT_SUBST  # enable prompt evaluation
PROMPT="%{$fg[yellow]%}%n%{$reset_color%}@%m %{$fg[white]%}%D{%a %d %b} %T
%{$fg[cyan]%}[%~]%{$reset_color%}%{$fg[green]%}\$(parse_git_branch)%{$reset_color%} $ "