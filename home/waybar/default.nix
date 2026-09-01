{
  hostname,
  lib,
  inputs,
  ...
}:
let
  modulesDir = ./modules;
  modules = builtins.listToAttrs (
    map (file: {
      name = lib.removeSuffix ".nix" (lib.removePrefix "${toString modulesDir}/" (toString file));
      value = import file;
    }) (lib.filesystem.listFilesRecursive modulesDir)
  );

  hostSettingsFile = ./${hostname}.nix;
in
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings =
      let
        imports = { inherit modules; };
      in
      if builtins.pathExists hostSettingsFile then
        import hostSettingsFile imports
      else
        [ (import ./common.nix imports) ];
  };

  imports = [ inputs.kdeconnect_waybar.homeManagerModules.default ];

  programs.kdeconnect-waybar = {
    enable = true;
    settings.configs = [
      {
        update_interval_secs = 1;
        format = "{DeviceInfo::DeviceTypeText}         {Battery::ChargePercent}% {Battery::ChargeTexts}";
        device_not_found_text = "x(            404  ";
        device_not_found_tooltip_text = "Device not found make sure kdeconnect is running and phone is connected";
        device_phone_text = "";
        device_tablet_text = "";
        is_charging_texts = [
          "󰢜"
          "󰂆"
          "󰂇"
          "󰂈"
          "󰢝"
          "󰂉"
          "󰢞"
          "󰂊"
          "󰂋"
          "󰂅"
        ];
        isnt_charging_texts = [
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
        charge_ranges = [
          10
          20
          30
          40
          50
          60
          70
          80
          90
        ];
      }
      {
        update_interval_secs = 1;
        device_not_found_text = "";
        name = "notifications";
        format = "{Notification::Grouped}";
        tooltip_format = "{Notification::Single}";
        notification_grouped_format = "  {CustomIcon} {CountText}  ";
        notification_single_format = "  -{CustomIcon} : {Title}\n{Content}\n";
        app_icons = {
          "" = "";
          Instagram = "";
          Snapchat = "";
          YouTube = "󰗃";
          WhatsApp = "";
          Discord = "";
          Messages = "";
          Calendar = "󰃭";
          GitHub = "󰊤";
          Netflix = "󰝆";
          X = "";
          Steam = "";
          Reddit = "";
          Twitch = "";
          Pronote = "";
          Spotify = "";
          Tasks = "";
          Gmail = "󰊫";
        };
        notifications_count_text = {
          "0" = "󰲲";
          "1" = "󰲠";
          "2" = "󰲢";
          "3" = "󰲤";
          "4" = "󰲦";
          "5" = "󰲨";
          "6" = "󰲪";
          "7" = "󰲬";
          "8" = "󰲮";
          "9" = "󰲰";
        };
      }
    ];
  };

  xdg.configFile."waybar/assets".source = ./assets;
}
