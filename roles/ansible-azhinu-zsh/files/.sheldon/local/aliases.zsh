#Dynamic aliases
$(which duf > /dev/null) && alias df='duf' || alias df='df -h'
$(which procs > /dev/null) && alias ps='procs -p disable' || alias ps='ps aux'
$(which lsd > /dev/null) && alias ls='lsd -l' || alias ps='ls -GFhl'

# Aliases
alias group='cat /etc/group'
alias ss='ss -pln'
alias grep='grep --color=auto -a'
# Use aliases with sudo
alias sudo='sudo '
# Rsync preserve arrts. Works only with modern rsync
alias rsync="rsync --acls --xattrs --crtimes --fileflags"

alias cat='/usr/local/bin/bat -P'
alias df='/usr/local/bin/duf'
alias ls='/usr/local/bin/lsd --total-size -l'
alias lnav='lnav -q'
