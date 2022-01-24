# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

#Dynamic aliases
$(which lolcat > /dev/null) && alias cat='lolcat'
$(which duf > /dev/null) && alias df='duf' || alias df='df -h'
$(which procs > /dev/null) && alias ps='procs -p disable' || alias ps='ps aux'
$(which lsd > /dev/null) && alias ls='lsd -l' || alias ps='ls -GFhl'

#Start sheldon end plugins
eval "$(sheldon source)"
[[ $- == *i* ]] && source "${ZDOTDIR:-$HOME}/.sheldon/repos/github.com/sorin-ionescu/prezto/init.zsh" 2> /dev/null
[[ $- == *i* ]] && source "${ZDOTDIR:-$HOME}/.sheldon/repos/github.com/lildude/fzf-prezto/init.zsh" 2> /dev/null
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias group='cat /etc/group'
alias ss='ss -pln'
alias grep='grep --color=auto -a'
# alias ssh='sshukh'

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch .zcompdump
else
  compinit -C
fi
p10k finalize
