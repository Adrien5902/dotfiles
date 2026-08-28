# Find shortcut IDs in ~/.config/zen/default/zen-keyboard-shortcuts.json
# Get version from about:config -> zen.keyboard.shortcuts.version
# Activation fails if version changes (prevents silent breakage).
#
# Use this command:
# jq -c '.shortcuts[] | {id, key, keycode, action}' ~/.config/zen/default/zen-keyboard-shortcuts.json | fzf
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
}
