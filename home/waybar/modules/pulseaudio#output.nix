{
  format = "{icon} {volume}%";
  format-muted = "{icon} {volume}%";
  format-icons = {
    default = [
      "󰕿"
      "󰖀"
      "󰕾"
    ];
    default-muted = "󰝟";
    headphone = "󰋋";
    headphone-muted = "󰟎";
    headset = "󰋎";
    headset-muted = "󰋐";
  };
  min-length = 7;
  max-length = 7;
  on-click = "~/.config/waybar/scripts/volume output mute";
  on-scroll-up = "~/.config/waybar/scripts/volume output raise";
  on-scroll-down = "~/.config/waybar/scripts/volume output lower";
  tooltip-format = "<b>Output Device</b>: {desc}";
}
