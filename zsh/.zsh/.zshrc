EDITOR="nvim"
VISUAL="$EDITOR"

################################################################################
# Some util functions
#   These should be in the utils file but we need them to source the utils file
################################################################################
function _bh_printerr() {
    local error_message="$1"
    local error_reason="$2"

    local prefix="[ERROR]"
    [[ -n "$error_reason" ]] && error_reason=": $error_reason"
    printf '%s %s%s.\n' "$prefix" "$error_message" "$error_reason"
}

function _bh_is_valid_file() {
    local file_path="$1"
    local error_message="\"$file_path\" cannot be referenced"

    if [[ ! -e "$file_path" ]]; then
        _bh_printerr "$error_message" "File does not exist"
        false
    elif [[ ! -f "$file_path" ]]; then
        _bh_printerr "$error_message" "File is not a regular file"
        false
    elif [[ ! -r "$file_path" ]]; then
        _bh_printerr "$error_message" "This process does not have permissions to read file"
        false
    else
        true
    fi 
}

function _bh_safe_source() {
    local file_path="$1"
    _bh_is_valid_file "$file_path" && source "$file_path"
}

################################################################################
# Includes
################################################################################
_bh_safe_source "$ZDOTDIR/utils.zsh"
_bh_is_mac && _bh_safe_source "$ZDOTDIR/homebrew.zsh"
_bh_safe_source "$ZDOTDIR/aliases.zsh"
_bh_safe_source "$ZDOTDIR/appearance.zsh"

_bh_safe_source "$ZDOTDIR/langs.zsh"

_bh_is_mac && _bh_safe_source "$ZDOTDIR/1password.zsh"
_bh_is_wsl && _bh_safe_source "$ZDOTDIR/npiperelay.zsh"

################################################################################
# Path
################################################################################
_bh_prepend_path "$HOME/.local/bin"

################################################################################
# History
################################################################################
HISTSIZE=10000
SAVEHIST=10000

# Search with up and down
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

if _bh_is_wsl; then
    UP_KEY="^[OA"
    DOWN_KEY="^[OB"
else
    UP_KEY="^[[A"
    DOWN_KEY="^[[B"
fi
bindkey "$UP_KEY" up-line-or-beginning-search
bindkey "$DOWN_KEY" down-line-or-beginning-search

################################################################################
# Auto completion
################################################################################
autoload -Uz compinit && compinit

# Allow for case-insensitive auto-complete if no matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Do menu-driven completion
zstyle ':completion:*' menu select

# Allow for shift-tab in completion menu
bindkey "^[[Z" reverse-menu-complete
