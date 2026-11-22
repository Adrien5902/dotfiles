# Switch to nixos todos
- [X] Minimal setup config
- [X] Multi host config

# Apps
## Gaming
- [X] steam
- [X] heroic
- [X] sober
- [X] pandora launcher
- [ ] minecraft nix servers

## Other
- [ ] xdg (mostly done)
- [X] hyprland (although i plan on keeping lua there's still things to configure)
- [X] wallpapers
- [ ] nvim (lazy -> nix)
- [X] spotify with spicetify (adding the possiblity of changing color_scheme would be cool)
- [ ] waybar (mostly done, only small fixes required)
- [X] starship
- [ ] rofi (change current theme)
- [X] ghostty
- [X] fish
- [X] git
- [X] gh
- [X] keyd
- [X] grim slurp
- [X] clipvault
- [ ] thunar (see laptop)
- [ ] gtk theme (somewhat done see [cyber-icon-theme](https://github.com/Adrien5902/cyber-icon-theme))
- [ ] qs or eww notif daemon (tired of dunst honestly)
- [X] obsidian

## XDG
- [ ] hyprland DP
- [ ] hyprland preview share picker
- [ ] phosh DP
- [X] cursor

## My apps
- [X] kdeconnect waybar
- [X] mutex

## Zen
- [X] enable
### Customization
### Extensions
- [X] uBlock
- [ ] vimium
- [ ] 2FA password manager
- [X] dark reader
- [X] zen internet
- [ ] proton vpn
- [ ] steam db

# Dev envs
- [X] ocaml
- [X] rust
- [X] lua
- [X] js/ts bun biome
- [ ] mcfunction
- [ ] java

# Notes

## vimium config
### custom css
div > .vimiumHintMarker {
  padding: 2px 3px;
  background-color: #abffd7;
  border: 0;
  border-radius: 2px;
  background-image: none;
}

div > .vimiumHintMarker span {
  font-size: 11px;
  font-weight: bold;
  text-shadow: none;
  color: #4a400e;
}

div > .vimiumHintMarker > .matchingCharacter {
  color: #dcbc2a;
}

### keyMappings
map ! visitPreviousTab

#### Unmaps
unmap /
unmap f
unmap F
unmap t

map s LinkHints.activateMode
map S LinkHints.activateModeToOpenInNewTab

#### Tabs
unmap J
unmap K

map J nextTab
map K previousTab
