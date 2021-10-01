# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Aliases
alias group='cat /etc/group'
alias df='df -h'
alias ss='ss -pln'
alias ps='ps aux'
alias ls='ls -GFhl'
alias grep='grep --color=auto -a'
alias  df='df -H --si '
if [ -f /usr/bin/lolcat ] ||  [ -f /usr/local/bin/lolcat ] ; then
    alias cat='lolcat'
fi
# alias ssh='sshukh'

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(sheldon source)"
[[ $- == *i* ]] && source "${ZDOTDIR:-$HOME}/.sheldon/repos/github.com/sorin-ionescu/prezto/init.zsh" 2> /dev/null
[[ $- == *i* ]] && source "${ZDOTDIR:-$HOME}/.sheldon/repos/github.com/lildude/fzf-prezto/init.zsh" 2> /dev/null
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch .zcompdump
else
  compinit -C
fi
p10k finalize
