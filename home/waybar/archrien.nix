{ modules, ... }:
map (attrs: attrs // modules) [
  {
    modules-left = [
      "group/date_time"
      "group/kdeconnect"
    ];
    modules-center = [
      "group/workspaces_and_power"
    ];
    modules-right = [
      "group/media_controls"
      "mpris#songdetails"
    ];
    layer = "top";
    output = "DP-2";
    height = 50;
    width = 0;
    margin = "0";
    spacing = 0;
    mode = "dock";
    reload_style_on_change = true;
  }
  {
    modules-left = [
      "group/date_time"
      "custom/idle_inhibit"
      "bleutooth"
    ];
    modules-center = [
      "group/specs"
    ];
    modules-right = [
      "custom/weather"
    ];
    layer = "top";
    output = "HDMI-A-2";
    height = 50;
    width = 0;
    margin = "0";
    spacing = 0;
    mode = "dock";
    reload_style_on_change = true;
  }
]
