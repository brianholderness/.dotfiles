if ! which fzf &> /dev/null; then
    _bh_printerr "Cannot use fzf" "fzf not found; is it installed and on PATH?"
else
    # Created with https://minsw.github.io/fzf-color-picker/ 
    export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1 --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1 --color=info:#eacb8a,prompt:#81a1c1,pointer:#81a1c1 --color=marker:#a3be8b,spinner:#eacb8a,header:#a3be8b'
fi
