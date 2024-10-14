autoload -Uz vcs_info
precmd_vcs_info() {vcs_info}
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%B%F{red}%n%F{white}@%F{blue}%m %F{green}%~ %# %f%b'
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git*' formats '%F{red}'$'\UF126'' %b %F{green}'$'\UF1D3'' %r%f'
zstyle ':vcs_info:*' enable git
