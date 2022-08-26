################################################################################
# Aliases
################################################################################
case "$OSTYPE" in
    darwin*)
        alias ls='gls --color=auto --group-directories-first'
        alias dircolors='gdircolors'
    ;;
    linux*)
        alias ls='ls --color=auto --group-directories-first'
        alias clear='clear -x'
    ;;
esac

alias l='ls -lAh'
alias la='ls -lah'
alias ll='ls -lh'

alias {v,vi}='nvim'

alias _='sudo'

################################################################################
# Named Directories
################################################################################
if _bh_is_wsl; then
    if [[ -n "$USERPROFILE" ]]; then
        hash -d winhome="$USERPROFILE"
    else
        _bh_printerr "Cannot create winhome named directory" "USERPROFILE env variable not set"
    fi
fi
