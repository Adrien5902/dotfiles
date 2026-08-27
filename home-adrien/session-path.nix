{ pkgs, ... }:
{
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.spicetify"
    "$HOME/.bun/bin"
    "$HOME/.cache/.bun/bin"
    "$HOME/go/bin"
    "$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin"
  ];
}
