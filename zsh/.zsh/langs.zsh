################################################################################
# Go
################################################################################
function _bh_is_go_installed() {
    if _bh_is_mac; then
        _bh_is_valid_file "$(brew --prefix)/bin/go" &> /dev/null
    elif _bh_is_linux; then
        _bh_is_valid_directory "/usr/local/go" &> /dev/null
    else
        false
    fi
}

if _bh_is_go_installed; then
    _bh_is_linux && _bh_prepend_path "/usr/local/go/bin"
else
    _bh_printerr "Cannot use golang" "golang is not installed"
fi

################################################################################
# Rust
################################################################################
if _bh_is_valid_directory "$HOME/.rustup" &> /dev/null; then
    _bh_safe_source "$HOME/.cargo/env"
else
    _bh_printerr "Cannot use rust (rustup)" "rustup is not installed"
fi

################################################################################
# Node
################################################################################
function _bh_is_fnm_installed() {
    if _bh_is_mac; then
        _bh_is_valid_file "$(brew --prefix)/bin/fnm" &> /dev/null
    else
        false
    fi
}

if _bh_is_fnm_installed; then
    _bh_is_mac || _bh_prepend_path "$HOME/.fnm"
    eval "$(fnm env --use-on-cd)"
else
    _bh_printerr "Cannot use nodejs (fnm)" "fnm is not installed"
fi
