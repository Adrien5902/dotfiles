{
  lib,
  pkgs,
  ...
}:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    #  font = "Lat2-Terminus16";
    keyMap = "fr";

  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adrien = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
  };

  programs.kdeconnect.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # Compilers
    rustup
    bun
    opam
    clang
    llvmPackages.bintools
    gnumake

    keyd

    pkg-config
    dbus

    # Shell Customization
    waybar
    # quickshell
    dunst
    hyprpicker
    # clipvault

    # TUI Apps
    gitui
    playerctl
    ffmpeg
    bluetui
    # wlctl
    neovim
    git
    fish
    fzf
    htop
    # nvtop

    # Apps
    kitty
    thunar
    discord

    # Cli tools
    starship
    zoxide
    bat
    eza
    bash
    jq
    wl-clipboard
    ripgrep
    just
    gh
    zip
    unzip

    # LSPs
    nil
    biome
    just-lsp

    codex
  ];

  environment.sessionVariables = {
    PKG_CONFIG_PATH = lib.makeSearchPath "lib/pkgconfig" (
      with pkgs;
      [
        dbus
      ]
    );
  };

  nixpkgs.config.allowUnfree = true;

  services.keyd = {
    enable = true;

    keyboards.default = {
      ids = [ "*" ];

      settings = {
        main = {
          capslock = "overload(capslock, esc)";
          esc = "capslock";
        };

        "capslock:C" = {
          h = "left";
          k = "up";
          j = "down";
          l = "right";
        };
      };
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.noto
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };
}
