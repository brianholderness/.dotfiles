function _bh_is_valid_directory() {
    local directory_path="$1"
    local error_message="\"$directory_path\" cannot be referenced"

    if [[ ! -e "$directory_path" ]]; then
        _bh_printerr "$error_message" "Directory does not exist"
        false
    elif [[ ! -d "$directory_path" ]]; then
        _bh_printerr "$error_message" "Directory is not a regular directory"
        false
    elif [[ ! -r "$directory_path" ]]; then
        _bh_printerr "$error_message" "This process does not have permissions to read directory"
        false
    else
        true
    fi 
}

function _bh_is_ostype_set() {
    if [[ -z "$OSTYPE" ]]; then
        printf "[ERROR] OSTYPE not set. Cannot run platform specific scripts.\n"
        false
    else
        true
    fi 
}

function _bh_is_mac() {
    _bh_is_ostype_set && [[ "$OSTYPE" == darwin* ]]
}

function _bh_is_linux() {
    _bh_is_ostype_set && [[ "$OSTYPE" == linux* ]]
}

function _bh_is_wsl() {
    [[ -n "$WSL_DISTRO_NAME" ]]
}

function _bh_exists_on_path() {
    local path_to_add="$1"
    [[ "$PATH" == *":$path_to_add:"* ]]
}

function _bh_prepend_path() {
    local path_to_add="$1"
    _bh_is_valid_directory "$path_to_add" || return
    _bh_exists_on_path "$path_to_add" || PATH="${path_to_add}${PATH:+":$PATH"}" 
}

function _bh_append_path() {
    local path_to_add="$1"
    _bh_is_valid_directory "$path_to_add" || return
    _bh_exists_on_path "$path_to_add" || PATH="${PATH:+"$PATH:"}${path_to_add}" 
}
