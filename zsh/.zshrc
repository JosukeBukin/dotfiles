export PATH="/sbin:$PATH"
export PATH="/home/ilia/bin:$PATH"
export PATH="/home/ilia/.local/bin:$PATH"
export PATH="/home/ilia/.local/bin/status:$PATH"
export PATH="/home/ilia/.cargo/bin:$PATH"
export TERM=xterm-256color

# Load completion
autoload -U compinit; compinit

# Plugins
fpath=($HOME/.zsh/plugins/zsh-completions/src $fpath)
fpath=($HOME/.zsh/plugins/gentoo-zsh-completions/src $fpath)
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load prompt
source $HOME/.zsh/prompt.zsh

HISTFILE="$HOME/.zsh_history"
SAVEHIST=2500
HISTSIZE=2500

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#  eval "$("$BASE16_SHELL/profile_helper.sh")"
###

# Autojump
[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh

# Aliases
alias nvi=__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia
alias vifm=vifmrun
# alias ls=lsd

# Binds
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey    "^[[H"           beginning-of-line
bindkey    "^[[4~"          end-of-line
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nnn
source ~/.zsh/nnn.zsh

[ -f "/home/ilia/.ghcup/env" ] && source "/home/ilia/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ilia/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ilia/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ilia/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ilia/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pmbootstrap
autoload bashcompinit
bashcompinit
eval "$(register-python-argcomplete pmbootstrap)"
