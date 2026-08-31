{
  interval = 10;
  format = "󰍛 : {icon}";
  format-icons = [
    "█ ▁ ▁ ▁ ▁"
    "█ █ ▁ ▁ ▁"
    "█ █ █ ▁ ▁"
    "█ █ █ █ ▁"
    "█ █ █ █ █"
  ];
  format-warning = "󰍛 {icon}";
  format-critical = "󰍛 {icon}";
  min-length = 14;
  max-length = 14;
  states = {
    warning = 75;
    critical = 90;
  };
  on-click = "kitty -e htop";
}
