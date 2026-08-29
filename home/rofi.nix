{ pkgs, config, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-games
      rofi-emoji
      rofi-calc
    ];

    theme = {
      "*" = {
        font = "Iosevka Nerd Font Medium 11";

        bg0 = mkLiteral "#1a1b26";
        bg1 = mkLiteral "#1f2335";
        bg2 = mkLiteral "#24283b";
        bg3 = mkLiteral "#414868";
        fg0 = mkLiteral "#c0caf5";
        fg1 = mkLiteral "#a9b1d6";
        fg2 = mkLiteral "#737aa2";
        red = mkLiteral "#f7768e";
        green = mkLiteral "#9ece6a";
        yellow = mkLiteral "#e0af68";
        blue = mkLiteral "#7aa2f7";
        magenta = mkLiteral "#9a7ecc";
        cyan = mkLiteral "#4abaaf";

        text = mkLiteral "#cdd6f4";
        lavande = mkLiteral "#efb4ff";
        lanterne = mkLiteral "#e47cff";
        violet = mkLiteral "#c249df";
        ciel = mkLiteral "#67c9ff";
        marine = mkLiteral "#0e3063";
        gris = mkLiteral "#595959";
        crust = mkLiteral "#11111bee";
        noir = mkLiteral "#08101a";
        vert = mkLiteral "#2c5535";

        accent = mkLiteral "@red";
        urgent = mkLiteral "@yellow";

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";

        margin = 0;
        padding = 0;
        spacing = 0;
      };

      "element-icon, element-text, scrollbar" = {
        cursor = mkLiteral "pointer";
      };

      window = {
        location = mkLiteral "northwest";
        width = mkLiteral "280px";
        x-offset = mkLiteral "800px";
        y-offset = mkLiteral "400px";
        background-color = mkLiteral "@crust";
        border = 1;
        border-color = mkLiteral "@ciel";
        border-radius = mkLiteral "6px";
      };

      inputbar = {
        spacing = 8;
        padding = mkLiteral "4px 8px";
        children = map mkLiteral [
          "icon-search"
          "entry"
        ];
        background-color = mkLiteral "@bg2";
      };

      "icon-search, entry, element-icon, element-text" = {
        vertical-align = mkLiteral "0.5";
      };

      icon-search = {
        expand = false;
        filename = "search-symbolic";
        size = mkLiteral "14px";
      };

      textbox = {
        padding = mkLiteral "4px 8px";
        background-color = mkLiteral "@crust";
      };

      listview = {
        padding = mkLiteral "4px 0px";
        lines = 12;
        columns = 1;
        scrollbar = true;
        fixed-height = false;
        dynamic = true;
      };

      element = {
        padding = mkLiteral "4px 8px";
        spacing = 8;
      };

      "element normal urgent" = {
        text-color = mkLiteral "@urgent";
      };

      "element normal active" = {
        text-color = mkLiteral "@accent";
      };

      "element alternate active" = {
        text-color = mkLiteral "@accent";
      };

      "element selected" = {
        text-color = mkLiteral "@crust";
        background-color = mkLiteral "@lanterne";
      };

      "element selected urgent" = {
        background-color = mkLiteral "@urgent";
      };

      element-icon = {
        size = mkLiteral "0.8em";
      };

      element-text = {
        text-color = mkLiteral "inherit";
      };

      scrollbar = {
        handle-width = 4;
        handle-color = mkLiteral "@fg2";
        padding = mkLiteral "0 4px";
      };
    };
  };
}
