{
  interface = "wlan0";
  format = "{ifname}";
  format-wifi = "{signalStrength}% ";
  format-ethernet = "{ifname} ";
  format-disconnected = "";
  tooltip-format = "{ifname}";
  tooltip-format-wifi = "{essid} ({signalStrength}%) ";
  tooltip-format-ethernet = "{ifname} ";
  tooltip-format-disconnected = "Disconnected";
  max-length = 50;
}
