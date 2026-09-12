{ pkgs, inputs, ... }:
let
  fenix = inputs.fenix.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  environment.systemPackages = with pkgs; [
    # Compilers
    fenix.complete.toolchain
    bun
    opam
    clang
    llvmPackages.bintools
    gnumake

    neovim
    just
    gitui
    gh
    watchexec

    # LSPs
    nil
    biome
    just-lsp

    # AI
    codex
  ];
}
