{ pkgs, ... }:
{
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    # Find shortcut IDs in ~/.config/zen/default/zen-keyboard-shortcuts.json
    # Get version from about:config -> zen.keyboard.shortcuts.version
    # Activation fails if version changes (prevents silent breakage).
    #
    # Use this command:
    # jq -c '.shortcuts[] | {id, key, keycode, action}' ~/.config/zen/default/zen-keyboard-shortcuts.json | fzf
    profiles.default =
      let
        uuidFromString =
          name:
          let
            hash = builtins.hashString "sha256" name;
          in
          "${builtins.substring 0 8 hash}-${builtins.substring 8 4 hash}-${builtins.substring 12 4 hash}-${builtins.substring 16 4 hash}-${builtins.substring 20 12 hash}";
        pin = name: url: { inherit name url; };
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
                    red = 100;
                    green = 150;
                    blue = 200;
                    algorithm = "floating";
                    type = "explicit-lightness";
                    lightness = 0;
                  }
                  {
                    red = 150;
                    green = 100;
                    blue = 100;
                    algorithm = "floating";
                    type = "explicit-lightness";
                    lightness = 0;
                  }
                ];
                texture = 0.0;
              };
            };
          };
      in
      {
        pinsForce = true;
        pinsForceAction = "remove"; # omit or "demote" to keep undeclared pins as normal tabs
        spacesForce = true;

        pins = pinList true [
          (pin "Gmail" "https://mail.google.com")
          (pin "Youtube" "https://youtube.com")
          (pin "Calendar" "https://calendar.google.com")
        ];

        spaces =
          { }
          // space "Home" {
            icon = "🏠";
            position = 100;
            pins = pinList false [
              (pin "Instagram" "https://instagram.com")
            ];
          }
          // space "Work" {
            icon = "📚";
            position = 200;
            pins = pinList false [ ];
          }
          // space "Games" {
            icon = "🎮";
            position = 300;
            pins = pinList false [ ];
          }
          // space "Dev" {
            icon = "📟";
            position = 400;
            pins = pinList false [
              (pin "GitHub" "https://github.com")
              (pin "ChatGPT" "https://chatgpt.com")
            ];
          }
          // space "Anime" {
            icon = "🎏";
            position = 500;
            pins = pinList false [
              (pin "Anime-Sama" "https://anime-sama.to")
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
          "mod.sameerasw.zen_transparent_glance_enabled" = true;
          "mod.sameerasw.zen_transparent_sidebar_enabled" = true;
        };

        keyboardShortcuts =
          let
            n_shortcuts =
              {
                id,
                n ? 10,
                modifiers,
              }@inputs:
              if n == 0 then
                [ ]
              else
                n_shortcuts (
                  inputs
                  // {
                    n = (n - 1);
                  }
                )
                ++ [
                  {
                    id = id + builtins.toString n;
                    key = builtins.toString n;
                    inherit modifiers;
                  }
                ];
          in
          [
            {
              id = "zen-toggle-sidebar";
              key = "s";
              modifiers = {
                control = true;
              };
            }
            {
              id = "key_newNavigatorTab";
              key = "q";
              modifiers.control = true;
            }
            {
              id = "key_restoreLastClosedTabOrWindowOrSession";
              key = "t";
              modifiers = {
                control = true;
                shift = true;
              };
            }
            {
              id = "key_quitApplication";
              disabled = true;
            }
            {
              id = "key_reload";
              key = "r";
              modifiers.control = true;
            }
            {
              id = "key_reload_skip_cache";
              key = "r";
              modifiers = {
                control = true;
                shift = true;
              };
            }
            {
              id = "addBookmarkAsKb";
              key = "d";
              modifiers = {
                control = true;
                shift = true;
                alt = true;
              };
            }
            {
              id = "zen-duplicate-tab";
              key = "d";
              modifiers = {
                control = true;
                shift = true;
              };
            }
            {
              id = "zen-toggle-pin-tab";
              key = "d";
              modifiers.control = true;
            }
          ]
          ++ n_shortcuts {
            n = 8;
            id = "key_selectTab";
            modifiers.control = true;
          }
          ++ n_shortcuts {
            id = "zen-workspace-switch-";
            modifiers = {
              control = true;
              alt = true;
            };
          };

        # In order to avoid breaking changes here, sometimes when you upgrade you
        # should be asked to bump this version
        keyboardShortcutsVersion = 20;
      };
  };

}

