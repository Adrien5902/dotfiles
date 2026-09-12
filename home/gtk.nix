{ system, inputs, ... }:
{
  gtk = {
    enable = true;
    colorScheme = "dark";
    iconTheme = {
      name = "cyber-icon-theme";
      package = inputs.cyber-icon-theme.packages.${system}.default;
    };
  };
}
