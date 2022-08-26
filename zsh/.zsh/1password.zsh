_bh_1password_sock_path="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
if [[ -S "$_bh_1password_sock_path" && -r "$_bh_1password_sock_path" ]]; then
    export SSH_AUTH_SOCK="$_bh_1password_sock_path"
else
    _bh_printerr "Cannot use 1Password SSH Agent" "agent.sock file not found"
fi
