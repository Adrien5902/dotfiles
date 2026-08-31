{
  format = "{icon} {volume}%";
  format-muted = "󰝟 {volume}%";
  format-icons = [
    "󰕿"
    "󰖀"
    "󰕾"
  ];
  min-length = 7;
  max-length = 7;
  on-click = "~/.config/waybar/scripts/volume output mute";
  on-scroll-up = "~/.config/waybar/scripts/volume output raise";
  on-scroll-down = "~/.config/waybar/scripts/volume output lower";
  tooltip-format = "Device: {node_name}";
  node-type = "Audio/Sink";
}
