{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/common.nix
    ./../../modules/gaming.nix
  ];

  networking.hostName = "archrien"; # Define your hostname.
}
