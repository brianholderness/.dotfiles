ZDOTDIR="$HOME/.zsh"

case "$OSTYPE" in
    darwin*)
        # shellenv just echo's some EXPORT's for brew env variables
        eval $(/opt/homebrew/bin/brew shellenv)
        export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
    ;;
esac
