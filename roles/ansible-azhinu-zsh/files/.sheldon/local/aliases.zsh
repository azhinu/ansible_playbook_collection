#Dynamic aliases
# Use `duf` if available or use `df` with human readable sizes
$(which duf > /dev/null) && alias df='duf' || alias df='df -h'
# Use `procs` if available or add arg to `ps`
$(which procs > /dev/null) && alias ps='procs -p disable' || alias ps='ps aux' 
# Use `lsd` if available or use `ls` with color, human readable sizes and render as list.
$(which lsd > /dev/null) && alias ls='lsd -l --total-size' || alias ps='ls -GFhl'
# Use `bat` if available
$(which bat > /dev/null) && alias cat='bat -P'
# Use `lnav` in quiet mode
alias lnav='lnav -q'

# Aliases
# Show listening sockets with processes and ports as numbers.
alias ss='ss -pln' 
# Use grep with colors
alias grep='grep --color=auto'
# Use aliases with sudo
alias sudo='sudo '
# Rsync preserve arrts. Works only with modern rsync on mac
[[ "$OSTYPE" == "darwin"* ]] && alias rsync="rsync --acls --xattrs --crtimes --fileflags"
