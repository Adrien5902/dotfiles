if status is-interactive
    # Commands to run in interactive sessions can go here

    zoxide init fish | source

    starship init fish | source
    set fish_greeting

    alias we='thunar . >/dev/null 2>&1 & disown'
    alias rl='source ~/.config/fish/config.fish'
    alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
end

export GITHUB_USERNAME=Adrien5902
export EDITOR=nvim

# Rust better CLI tools alias
alias ls="eza"
alias cat="bat"
alias du="dust"
alias curl="xh"
alias grep="rg"

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.spicetify
fish_add_path ~/go/bin

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/adrien/.opam/opam-init/init.fish' && source '/home/adrien/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
