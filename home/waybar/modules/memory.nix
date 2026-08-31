{
  interval = 10;
  format = "󰘚  : {icon}";
  format-icons = [
    "█ ▁ ▁ ▁ ▁"
    "█ █ ▁ ▁ ▁"
    "█ █ █ ▁ ▁"
    "█ █ █ █ ▁"
    "█ █ █ █ █"
  ];
  format-warning = "󰘚  {icon}";
  format-critical = "󰘚  {icon}";
  min-length = 14;
  max-length = 14;
  states = {
    warning = 75;
    critical = 90;
  };
  tooltip-format = "Memory Used: {used:0.0f}/{total:0.0f} GiB";
}
