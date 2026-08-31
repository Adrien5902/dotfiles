{ modules, ... }: {
  modules-left = [
    "group/date_time"
    "group/kdeconnect"
  ];
  modules-center = [
    "group/workspaces_and_battery"
  ];
  modules-right = [
    "group/media_controls"
    "mpris#songdetails"
  ];
  layer = "top";
  height = 50;
  width = 0;
  margin = 0;
  spacing = 0;
  mode = "dock";
  reload_style_on_change = true;
} // modules
