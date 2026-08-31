{
  format = "󰍬 {volume}%";
  format-muted = "󰍭 {volume}%";
  min-length = 7;
  max-length = 7;
  on-click = "~/.config/waybar/scripts/volume input mute";
  on-scroll-up = "~/.config/waybar/scripts/volume input raise";
  on-scroll-down = "~/.config/waybar/scripts/volume input lower";
  tooltip-format = "Device: {node_name}";
  node-type = "Audio/Source";
}
