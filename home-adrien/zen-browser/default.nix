{ pkgs, ... }@inputs:
{
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = import ./policies.nix;

    profiles.default =
      let
        uuidFromString =
          name:
          let
            hash = builtins.hashString "sha256" name;
          in
          "${builtins.substring 0 8 hash}-${builtins.substring 8 4 hash}-${builtins.substring 12 4 hash}-${builtins.substring 16 4 hash}-${builtins.substring 20 12 hash}";
        pin = name: url: {
          inherit name;
          url = "https://" + url;
        };
        pinList =
          isEssential: pins:
          builtins.listToAttrs (
            builtins.genList (
              position:
              let
                pin = builtins.elemAt pins position;
              in
              with pin;
              {
                inherit name;
                value = {
                  id = uuidFromString "pin:${name}";
                  inherit
                    url
                    position
                    isEssential
                    ;
                };
              }
            ) (builtins.length pins)
          );
        space =
          name:
          { ... }@inputs:
          {
            ${name} = inputs // {
              id = uuidFromString "space:${name}";
              theme = {
                type = "gradient";
                colors = [
                  {
                    #021831
                    red = 2;
                    green = 24;
                    blue = 49;
                    algorithm = "floating";
                  }
                  #271402
                  {
                    red = 39;
                    green = 20;
                    blue = 2;
                    algorithm = "floating";
                  }
                ];
                texture = 0.0;
                opacity = 1.0;
              };
            };
          };
      in
      {
        pinsForce = true;
        pinsForceAction = "remove"; # omit or "demote" to keep undeclared pins as normal tabs
        spacesForce = true;

        pins = pinList true [
          (pin "Gmail" "mail.google.com")
          (pin "Youtube" "youtube.com")
          (pin "Calendar" "calendar.google.com")
        ];

        spaces =
          { }
          // space "Home" {
            icon = "🏠";
            position = 500;
            pins = pinList false [
              (pin "Instagram" "instagram.com")
            ];
          }
          // space "Work" {
            icon = "📚";
            position = 400;
            pins = pinList false [ (pin "ENT" "monlycee.net") ];
          }
          // space "Games" {
            icon = "🎮";
            position = 300;
            pins = pinList false [
              (pin "SteamDB" "steamdb.info")
              (pin "Instant Gaming" "www.instant-gaming.com/")
            ];
          }
          // space "Dev" {
            icon = "📟";
            position = 200;
            pins = pinList false [
              (pin "GitHub" "github.com")
              (pin "ChatGPT" "chatgpt.com")
              (pin "Figma" "figma.com")
            ];
          }
          // space "Anime" {
            icon = "🎏";
            position = 100;
            pins = pinList false [
              (pin "Anilist" "anilist.co")
              (pin "Anime-Sama" "anime-sama.to")
            ];
          };

        mods = [
          "642854b5-88b4-4c40-b256-e035532109df" # Transparent zen
          "72f8f48d-86b9-4487-acea-eb4977b18f21" # Better CtrlTab Pane
          "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
        ];

        settings = {
          "zen.welcome-screen.seen" = true;
          "zen.workspaces.continue-where-left-off" = true;
          "browser.tabs.allow_transparent_browser" = true;
          "zen.widget.linux.transparency" = true;
          "zen.view.grey-out-inactive-windows" = false;
          "mod.sameerasw.zen_transparent_glance_enabled" = true;
          "mod.sameerasw.zen_transparent_sidebar_enabled" = true;

          #    extensions = {
          #      force = true;
          #      settings = {
          # # Vimium
          #        "{d7742d87-e61d-4b78-b8a1-b469842139fa}".keyMappings = ''
          #          unmap f
          #          unmap F
          #        '';
          #      };
          #    };
        };

        keyboardShortcuts = import ./keyboardShortcuts.nix;
        # In order to avoid breaking changes here, sometimes when you upgrade you
        # should be asked to bump this version
        keyboardShortcutsVersion = 20;
      };
  };
}
