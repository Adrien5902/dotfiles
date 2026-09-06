{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Compilers
    rustc
    cargo
    bun
    opam
    clang
    llvmPackages.bintools
    gnumake

    neovim
    just
    gitui
    gh

    # LSPs
    nil
    biome
    just-lsp
    rust-analyzer

    # AI
    codex
  ];
}
