export PATH="/sbin:$PATH"
export PATH="/home/ilia/bin:$PATH"
export PATH="/home/ilia/.local/bin:$PATH"
export PATH="/home/ilia/.local/bin/status:$PATH"
export PATH="/home/ilia/.cargo/bin:$PATH"
export EMACS_SOCKET_NAME="/tmp/emacs1000/server"
export TERM=xterm-256color
export EDITOR=nvim

# Load completion
autoload -U compinit; compinit

# Plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice wait lucid
zinit load gentoo/gentoo-zsh-completions
zinit ice wait lucid
zinit load zsh-users/zsh-syntax-highlighting
zinit ice wait lucid
zinit load zsh-users/zsh-completions
zinit ice wait lucid
zinit load Aloxaf/fzf-tab
zinit ice wait lucid
zinit load zsh-users/zsh-autosuggestions

# Load prompt
source $HOME/.zsh/prompt.zsh

HISTFILE="$HOME/.zsh_history"
SAVEHIST=2500
HISTSIZE=2500

# Autojump
[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh

# Aliases
alias nvi=__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia
alias vifm=vifmrun
alias cat=bat
alias ls=lsd

# Binds
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
bindkey    "^[[H"           beginning-of-line
bindkey    "^[[4~"          end-of-line
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nnn
source $HOME/.zsh/nnn.zsh

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

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
