{ pkgs, inputs, ... }:
let
  fenix = inputs.fenix.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  environment.systemPackages = with pkgs; [
    # Editor & Tools
    neovim
    codex
    gitui
    gh
    watchexec
    just-lsp
    just

    # Rust
    fenix.complete.toolchain

    # C
    clang
    llvmPackages.bintools
    gnumake

    # Ocaml
    ocaml
    ocamlPackages.ocaml-lsp
    ocamlPackages.utop
    ocamlformat

    # Lua
    lua-language-server

    # Nix
    nil

    # Web
    biome
    nodejs
    bun
  ];
}
